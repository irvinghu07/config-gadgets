require("oil").setup({
    default_file_explorer = true,

    columns = {"icon", "size", "mtime"},

    buf_options = {buflisted = false, bufhidden = "hide"},

    win_options = {
        wrap = false,
        signcolumn = "no",
        cursorcolumn = false,
        foldcolumn = "0",
        spell = false,
        list = false,
        conceallevel = 3,
        concealcursor = "nvic"
    },

    delete_to_trash = true, -- safer

    skip_confirm_for_simple_edits = true,

    prompt_save_on_select_new_entry = true,

    cleanup_delay_ms = 2000,

    constrain_cursor = "name",

    view_options = {
        show_hidden = false,
        natural_order = true,
        case_insensitive = true,

        sort = {{"type", "asc"}, {"name", "asc"}}
    },

    keymaps = {
        ["<CR>"] = "actions.select",
        ["-"] = "actions.parent",
        ["<BS>"] = "actions.parent",

        ["<C-v>"] = {"actions.select", opts = {vertical = true}},
        ["<C-s>"] = {"actions.select", opts = {horizontal = true}},
        ["<C-t>"] = {"actions.select", opts = {tab = true}},

        ["q"] = "actions.close",

        ["g."] = "actions.toggle_hidden",

        ["<C-p>"] = "actions.preview",

        ["<C-r>"] = "actions.refresh",

        ["gx"] = "actions.open_external",

        ["?"] = "actions.show_help"
    },

    use_default_keymaps = false,

    float = {
        padding = 2,
        max_width = 0.8,
        max_height = 0.8,
        border = "rounded",

        win_options = {winblend = 0}
    },

    preview_win = {
        update_on_cursor_moved = true,
        preview_method = "fast_scratch"
    },

    confirmation = {border = "rounded"},

    progress = {border = "rounded"}
})
