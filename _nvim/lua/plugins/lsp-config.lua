return {
    {
        "williamboman/mason.nvim",
        -- NOTE: I comment it to install jdtls (java language server)
         config = function()
         	require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
    }, 
}
