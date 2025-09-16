#!/bin/bash
#
# Bootstrap script for chezmoi dotfiles installation
# Usage: curl -fsSL https://raw.githubusercontent.com/achiurizo/dotfiles/main/bootstrap.sh | bash
#
# Strict bash mode
set -euo pipefail
IFS=$'\n\t'

# Trap errors and cleanup
trap 'error_exit "Script failed at line $LINENO"' ERR

# Global variables
declare -r SCRIPT_NAME="$(basename "${0}")"
declare -r TEMP_DIR="$(mktemp -d)"
declare -r LOG_FILE="${TEMP_DIR}/bootstrap.log"

# Colors for output (disable if not a terminal)
if [[ -t 1 ]]; then
    readonly RED='\033[0;31m'
    readonly GREEN='\033[0;32m'
    readonly YELLOW='\033[1;33m'
    readonly BLUE='\033[0;34m'
    readonly NC='\033[0m'
else
    readonly RED=''
    readonly GREEN=''
    readonly YELLOW=''
    readonly BLUE=''
    readonly NC=''
fi

# Cleanup function
cleanup() {
    [[ -d "${TEMP_DIR}" ]] && rm -rf "${TEMP_DIR}"
}
trap cleanup EXIT

# Error exit function
error_exit() {
    local message="${1:-"Unknown error occurred"}"
    log_error "${message}"
    log_error "Check log file: ${LOG_FILE}"
    exit 1
}

# Logging functions with proper error handling and emojis
log_info() {
    local message="${1:-""}"
    printf "%b[INFO]%b 🔍 %s\n" "${BLUE}" "${NC}" "${message}" | tee -a "${LOG_FILE}"
}

log_success() {
    local message="${1:-""}"
    printf "%b[SUCCESS]%b ✅ %s\n" "${GREEN}" "${NC}" "${message}" | tee -a "${LOG_FILE}"
}

log_warning() {
    local message="${1:-""}"
    printf "%b[WARNING]%b ⚠️ %s\n" "${YELLOW}" "${NC}" "${message}" | tee -a "${LOG_FILE}"
}

log_error() {
    local message="${1:-""}"
    printf "%b[ERROR]%b ❌ %s\n" "${RED}" "${NC}" "${message}" | tee -a "${LOG_FILE}" >&2
}

# Check if command exists with proper error handling
command_exists() {
    local cmd="${1:-""}"
    [[ -n "${cmd}" ]] || return 1
    command -v "${cmd}" >/dev/null 2>&1
}

# Detect OS with proper error handling
detect_os() {
    local os_name
    os_name="$(uname -s 2>/dev/null)" || error_exit "Failed to detect operating system"

    case "${os_name}" in
        Darwin*)
            printf "macos"
            ;;
        Linux*)
            printf "linux"
            ;;
        *)
            error_exit "Unsupported operating system: ${os_name}"
            ;;
    esac
}

# Safely evaluate Homebrew shell environment
setup_brew_env() {
    local os_type="${1:-""}"
    local brew_env_script=""

    case "${os_type}" in
        linux)
            brew_env_script="/home/linuxbrew/.linuxbrew/bin/brew"
            ;;
        macos)
            brew_env_script="/opt/homebrew/bin/brew"
            ;;
        *)
            error_exit "Unknown OS type for Homebrew setup: ${os_type}"
            ;;
    esac

    if [[ -x "${brew_env_script}" ]]; then
        # Safely evaluate Homebrew environment
        local brew_env
        brew_env="$("${brew_env_script}" shellenv 2>/dev/null)" || error_exit "Failed to get Homebrew environment"
        eval "${brew_env}"
        log_info "Homebrew environment configured"
    else
        error_exit "Homebrew executable not found at ${brew_env_script}"
    fi
}

# Install Homebrew with enhanced error handling
install_homebrew() {
    if command_exists brew; then
        log_info "Homebrew already installed"
        return 0
    fi

    log_info "Installing Homebrew... 🍺"

    # Download and verify Homebrew installer
    local homebrew_url="https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"
    local installer_script="${TEMP_DIR}/homebrew_install.sh"

    if ! curl -fsSL "${homebrew_url}" -o "${installer_script}"; then
        error_exit "Failed to download Homebrew installer"
    fi

    # Execute installer with proper environment
    if ! NONINTERACTIVE=1 bash "${installer_script}" 2>&1 | tee -a "${LOG_FILE}"; then
        error_exit "Failed to install Homebrew"
    fi

    # Setup Homebrew environment
    local os_type
    os_type="$(detect_os)"
    setup_brew_env "${os_type}"

    log_success "Homebrew installed successfully! 🍺✨"
}

# Install chezmoi with proper error handling
install_chezmoi() {
    if command_exists chezmoi; then
        log_info "chezmoi already installed"
        return 0
    fi

    log_info "Installing chezmoi via Homebrew... 🏠"

    if ! brew install chezmoi 2>&1 | tee -a "${LOG_FILE}"; then
        error_exit "Failed to install chezmoi"
    fi

    # Verify installation
    if ! command_exists chezmoi; then
        error_exit "chezmoi installation verification failed"
    fi

    log_success "chezmoi installed successfully! 🏠✨"
}

# Initialize and apply dotfiles with robust error handling
setup_dotfiles() {
    log_info "Initializing and applying dotfiles... 📄"

    local dotfiles_repo="https://github.com/achiurizo/dotfiles.git"

    # Check if chezmoi is already initialized
    local chezmoi_data
    if chezmoi_data="$(chezmoi data 2>/dev/null)" && printf "%s" "${chezmoi_data}" | grep -q "achiurizo"; then
        log_info "chezmoi already initialized, applying changes..."
        # Apply changes, ignoring TTY-related errors for automated environments
        local apply_exit_code=0
        chezmoi apply --verbose 2>&1 | tee -a "${LOG_FILE}" || apply_exit_code=$?

        if [[ ${apply_exit_code} -eq 0 ]]; then
            log_success "Dotfiles applied successfully! 📄✨"
        else
            log_warning "chezmoi apply completed with warnings (exit code: ${apply_exit_code})"
            log_info "This may be due to TTY limitations in automated environments"
        fi
    else
        log_info "Initializing chezmoi with dotfiles repository..."
        local init_exit_code=0
        chezmoi init --apply --verbose "${dotfiles_repo}" 2>&1 | tee -a "${LOG_FILE}" || init_exit_code=$?

        if [[ ${init_exit_code} -eq 0 ]]; then
            log_success "Dotfiles initialized and applied successfully! 📄🚀"
        else
            log_warning "chezmoi init completed with warnings (exit code: ${init_exit_code})"
            log_info "This may be due to TTY limitations in automated environments"
        fi
    fi
}

# Install Homebrew dependencies with enhanced error handling
install_brew_dependencies() {
    log_info "Installing Homebrew dependencies from Brewfile... 📦"

    # Get chezmoi source directory safely
    local chezmoi_source_dir
    if ! chezmoi_source_dir="$(chezmoi source-path 2>/dev/null)"; then
        log_warning "Could not get chezmoi source directory, skipping dependency installation"
        return 0
    fi

    local brewfile="${chezmoi_source_dir}/Brewfile"

    if [[ -f "${brewfile}" ]]; then
        log_info "Found Brewfile at ${brewfile}"

        # Change to source directory and run brew bundle
        local original_dir="${PWD}"
        if ! cd "${chezmoi_source_dir}"; then
            log_warning "Could not change to chezmoi source directory"
            return 0
        fi

        # Run brew bundle with error handling
        local bundle_exit_code=0
        brew bundle --verbose 2>&1 | tee -a "${LOG_FILE}" || bundle_exit_code=$?

        # Return to original directory
        cd "${original_dir}"

        if [[ ${bundle_exit_code} -eq 0 ]]; then
            log_success "Homebrew dependencies installed successfully! 📦✨"
        else
            log_warning "Some Homebrew dependencies failed to install (exit code: ${bundle_exit_code})"
        fi
    else
        log_warning "Brewfile not found at ${brewfile}, skipping dependency installation"
    fi
}

# Setup mise and install languages with proper error handling
setup_mise() {
    if ! command_exists mise; then
        log_warning "mise not installed, skipping language setup"
        return 0
    fi

    log_info "Setting up languages with mise... 🐍💎"

    # Install Python globally with error handling
    if mise use -g python@latest 2>&1 | tee -a "${LOG_FILE}"; then
        log_success "Python installed via mise! 🐍"

        # Install pynvim for Neovim
        if command_exists pip; then
            log_info "Installing pynvim for Neovim... 🔥"
            local pip_exit_code=0
            pip install --user pynvim 2>&1 | tee -a "${LOG_FILE}" || pip_exit_code=$?

            if [[ ${pip_exit_code} -eq 0 ]]; then
                log_success "pynvim installed! 🔥✨"
            else
                log_warning "Failed to install pynvim (exit code: ${pip_exit_code})"
            fi
        else
            log_warning "pip not available, skipping pynvim installation"
        fi
    else
        log_warning "Failed to install Python via mise"
    fi

    # Install Ruby globally with error handling
    if mise use -g ruby@latest 2>&1 | tee -a "${LOG_FILE}"; then
        log_success "Ruby installed via mise! 💎"
    else
        log_warning "Failed to install Ruby via mise"
    fi
}

# Setup tmux plugin manager with enhanced error handling
setup_tmux() {
    local tpm_dir="${HOME}/.tmux/plugins/tpm"

    if [[ -d "${tpm_dir}" ]]; then
        log_info "tmux plugin manager already installed"
        return 0
    fi

    log_info "Installing tmux plugin manager... 🪟"

    # Create parent directory if it doesn't exist
    local plugins_dir="${HOME}/.tmux/plugins"
    if [[ ! -d "${plugins_dir}" ]]; then
        if ! mkdir -p "${plugins_dir}"; then
            log_warning "Failed to create tmux plugins directory"
            return 0
        fi
    fi

    # Clone TPM repository
    local clone_exit_code=0
    git clone https://github.com/tmux-plugins/tpm "${tpm_dir}" 2>&1 | tee -a "${LOG_FILE}" || clone_exit_code=$?

    if [[ ${clone_exit_code} -eq 0 ]]; then
        log_success "tmux plugin manager installed! 🪟✨"
        log_info "Run 'tmux source ~/.tmux.conf && tmux run ~/.tmux/plugins/tpm/scripts/install_plugins.sh' to install plugins"
    else
        log_warning "Failed to install tmux plugin manager (exit code: ${clone_exit_code})"
    fi
}

# Verify installations with detailed checking
verify_setup() {
    log_info "Verifying installation... 🔍"

    # Define essential tools array properly
    local -a tools=("brew" "chezmoi" "bat" "fd" "fzf" "gh" "rg" "nvim" "tmux")
    local -a missing_tools=()
    local -a available_tools=()

    # Check each tool
    local tool
    for tool in "${tools[@]}"; do
        if command_exists "${tool}"; then
            available_tools+=("${tool}")
            log_success "${tool} is available"
        else
            missing_tools+=("${tool}")
        fi
    done

    # Report results
    if [[ ${#missing_tools[@]} -gt 0 ]]; then
        log_warning "Missing tools: ${missing_tools[*]}"
        log_info "You may need to restart your shell or source your shell configuration"
        log_info "Available tools: ${available_tools[*]}"
    else
        log_success "All essential tools are available! 🎉"
    fi

    # Log summary
    log_info "Verification complete: ${#available_tools[@]}/${#tools[@]} tools available"
}

# Validate prerequisites before starting
validate_prerequisites() {
    log_info "Validating prerequisites..."

    local -a required_tools=("curl" "git")
    local tool

    for tool in "${required_tools[@]}"; do
        if ! command_exists "${tool}"; then
            error_exit "${tool} is required but not installed"
        fi
        log_info "${tool} is available"
    done

    # Check if running as root (not recommended)
    if [[ "${EUID}" -eq 0 ]]; then
        log_warning "Running as root is not recommended"
        log_info "Consider running as a regular user"
    fi

    log_success "Prerequisites validated"
}

# Main installation function with enhanced structure
main() {
    local start_time
    start_time="$(date '+%Y-%m-%d %H:%M:%S')"

    log_info "Starting dotfiles bootstrap process at ${start_time} 🚀"
    log_info "Script: ${SCRIPT_NAME}"
    log_info "Log file: ${LOG_FILE}"

    # Detect and log OS information
    local os_type
    os_type="$(detect_os)"
    log_info "OS detected: ${os_type}"

    # Validate prerequisites
    validate_prerequisites

    # Run installation steps with progress tracking
    log_info "=== Installation Phase === 📥"
    install_homebrew
    install_chezmoi
    setup_dotfiles
    install_brew_dependencies

    log_info "=== Configuration Phase === ⚙️"
    setup_mise
    setup_tmux

    log_info "=== Verification Phase === 🔍"
    verify_setup

    # Final summary
    local end_time
    end_time="$(date '+%Y-%m-%d %H:%M:%S')"
    log_success "Bootstrap process completed at ${end_time}! 🎉🚀"
    log_info "You may need to restart your shell to use all tools"
    log_info "Run 'chezmoi diff' to see any pending changes"
    log_info "Full log available at: ${LOG_FILE}"
}

# Entry point with argument validation
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Script is being executed directly
    main "$@"
fi