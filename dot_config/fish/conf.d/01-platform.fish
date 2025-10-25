# Platform detection and platform-specific configuration

# Detect operating system
set -gx PLATFORM_OS (uname -s | tr '[:upper:]' '[:lower:]')
set -gx PLATFORM_ARCH (uname -m)

# Detect WSL
if test -f /proc/sys/fs/binfmt_misc/WSLInterop
    set -gx IS_WSL 1
    set -gx IS_LINUX 1
end

# Linux detection
if test "$PLATFORM_OS" = "linux"
    set -gx IS_LINUX 1

    # Distro detection
    if test -f /etc/os-release
        set -gx LINUX_DISTRO (grep ^ID= /etc/os-release | cut -d= -f2 | tr -d '"')
    end
end

# macOS detection
if test "$PLATFORM_OS" = "darwin"
    set -gx IS_MACOS 1
end

# Homebrew initialization (platform-aware)
if set -q IS_MACOS
    if test -x /opt/homebrew/bin/brew
        eval (/opt/homebrew/bin/brew shellenv)
    end
else if set -q IS_LINUX
    if test -x /home/linuxbrew/.linuxbrew/bin/brew
        eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    end
end
