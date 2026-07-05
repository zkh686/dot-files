hl.window_rule({
    name = "btop_scratchpad",
    float = true,
    match = {
        class = "^(foot)$",
        title = "^(btop)$",
    },
    workspace = "special:scratchpad",
})


hl.window_rule({
    match = { class = "^(wezterm-scratchpad)$" },
    workspace = "special:scratchpad",
    float = true,
    size = { 1000, 600 },
    center = true,
})
