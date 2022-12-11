vim.api.nvim_create_autocmd({"BufWritePre"}, {
        pattern = { "*.tf", "*.tfvars" },
        callback = function ()
                vim.cmd("TerraformFmt")
        end
})

