local ok, npairs = pcall(require, "nvim-autopairs")
if not ok then return end

npairs.setup({
    -- disable in certain filetypes
    disable_filetype = {"TelescopePrompt", "vim"},

    -- enable treesitter integration (better pairing awareness)
    check_ts = true,

    -- don't add pair if next char is alphanumeric
    ignored_next_char = "[%w%.]",

    -- enable fast wrap (very useful feature)
    fast_wrap = {
        map = "<M-e>", -- Alt + e
        chars = {"{", "[", "(", '"', "'"},
        pattern = [=[[%'%"%)%>%]%)%}%,]]=],
        offset = 0,
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "Search",
        highlight_grey = "Comment"
    }
})
