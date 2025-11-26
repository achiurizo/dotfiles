return {
    "mattn/emmet-vim",
    init = function()
        -- Patch emmet_utils to use modern vim.treesitter API instead of deprecated ts_utils
        package.preload["emmet_utils"] = function()
            local M = {}
            M.get_node_at_cursor = function()
                local node = vim.treesitter.get_node()
                if not node then
                    return nil
                end
                while node do
                    local node_type = node:type()
                    if node_type == "element" then
                        return "html"
                    elseif node_type == "stylesheet" then
                        return "css"
                    end
                    node = node:parent()
                end
                return ""
            end
            return M
        end
    end,
}
