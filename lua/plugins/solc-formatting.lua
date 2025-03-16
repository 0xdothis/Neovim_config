return {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.forge_fmt.with({
                    command = "forge",
                    args = { "fmt", "--stdin" },
                    on_output = function(_, done)
                        return function(err, output)
                            if err then
                                print("forge fmt error:", err)
                            else
                                print("forge fmt output:", output)
                            end
                            done(output)
                        end
                    end,
                }),
            },
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        callback = function()
                            print("Formatting buffer", bufnr)
                            vim.lsp.buf.format({ async = false })
                        end,
                    })
                end
            end,
        })
    end,
}