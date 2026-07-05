local M = {}

M.init = function(opts)
    opts = opts or {}
    
    local args = { "hyprscratch", "init" }
    
    if opts.clean then table.insert(args, "clean") end
    if opts.spotless then table.insert(args, "spotless") end
    if opts.eager then table.insert(args, "eager") end
    if opts.no_auto_reload then table.insert(args, "no-auto-reload") end
    if opts.config then table.insert(args, "--config=" .. opts.config) end
    
    hl.exec_cmd(table.concat(args, " "))
end

M.toggle = function(name)
    return hl.dsp.exec_cmd("hyprscratch toggle " .. name)
end

M.show = function(name)
    return hl.dsp.exec_cmd("hyprscratch show " .. name)
end

M.hide = function(name)
    return hl.dsp.exec_cmd("hyprscratch hide " .. name)
end

M.cycle = function(mode)
    if mode and mode ~= "" then
        return hl.dsp.exec_cmd("hyprscratch cycle " .. mode)
    end
    return hl.dsp.exec_cmd("hyprscratch cycle")
end

M.previous = function(action)
    if action and action ~= "" then
        return hl.dsp.exec_cmd("hyprscratch previous " .. action)
    end
    return hl.dsp.exec_cmd("hyprscratch previous")
end

M.scratchpad = function(title, command, opts)
    local cmd = "hyprscratch " .. title .. ' "' .. command .. '"'
    if opts and opts ~= "" then
        cmd = cmd .. " " .. opts
    end
    return hl.dsp.exec_cmd(cmd)
end

M.reload = function(config_path)
    local cmd = "hyprscratch reload"
    if config_path and config_path ~= "" then
        cmd = cmd .. " " .. config_path
    end
    return hl.dsp.exec_cmd(cmd)
end

M.hide_all = function()
    return hl.dsp.exec_cmd("hyprscratch hide-all")
end

return M
