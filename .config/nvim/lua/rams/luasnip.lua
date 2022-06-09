if vim.g.snippets ~= luasnip then
  vim.g.snippets = luasnip
end

local ls = require('luasnip')
local types = require('luasnip.util.types')

ls.config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { "<-", "Error" } },
            },
        },
    }
}

vim.keymap.set({ "i", "s" }, "<c-k>", function ()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function ()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })

vim.keymap.set("i", "<c-l>", function()
    if ls.choice_active() then
    end
end)

vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/rams/luasnip.lua<CR>")

ls.snippets = {
    all = {
        
    },
    php = {
    },
    html = {
        ls.parser.parse_snippet("pinp"," <div class=\"p-field\">\n            <label for=\"$1\">$2</label>\n            <input type=\"text\" pInputText id=\"$1\" [(ngModel)]=\"model.$1\" required autofocus />\n            <small class=\"p-error\" *ngIf=\"submitted && !model.$1\">$2 ist ein Pflichtfeld.</small>\n        </div>\n   "), 
        ls.parser.parse_snippet("ptextarea","<div class=\"p-field\"> <label for=\"$1\">$2</label> <textarea id=\"$1\" pInputTextarea [(ngModel)]=\"model.$1\" required rows=\"3\" cols=\"20\"></textarea> </div> "),
        ls.parser.parse_snippet("ppanel","<p-panel header=\"$1\" [toggleable]=\"$2\" [collapsed]=\"$3\">\n   $0\n   </p-panel>"),
    },

    lua = {
        ls.parser.parse_snippet("pinp"," <div class=\"p-field\">\n            <label for=\"$1\">$0</label>\n            <input type=\"text\" pInputText id=\"$1\" [(ngModel)]=\"model.$1\" required autofocus />\n </div>\n   ") 
    },
}
