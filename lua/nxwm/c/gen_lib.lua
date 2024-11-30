if not vim then error('needs to be run with neovim') end
local function gen_lib(outfile,libpaths,libname,pcalls)
    pcalls=pcalls or {}
    local source=vim.split([=[
--[[
DO NOT EDIT
This file is autogenerated from gen_lib.lua
To regenerate this file, run `nvim -l gen_lib.lua`
--]]
]=],'\n')
    table.insert(source,'local ffi=require"ffi"')
    table.insert(source,'ffi.cdef[=[')
    for _,v in pairs(pcalls) do pcalls[v[1]]=v end
    local add_pcall={}
    for _,lib in ipairs(libpaths) do
        for line in io.lines(lib) do
            for _,pattern in ipairs{
                {'^#define%s+([%w_]+)%s+0x(%x+)',16},
                {'^#define%s+([%w_]+)%s+(%d+)'},
                {'^#define%s+([%w_]+)%s+%((%d)L?<<(%d+)%)'},
            } do
                local name,number,expr=string.match(line,pattern[1])
                if name then
                    table.insert(source,('enum {%s=%s};'):format(name,tonumber(number,pattern[2])*(2^(expr or 0))))
                    break
                end
            end
        end
        local systemlist=vim.fn.systemlist({'gcc','-E',lib})
        local skip_count=0
        for _,line in ipairs(systemlist) do
            if vim.startswith(line,'#') then goto continue end
            if vim.trim(line)=='' then goto continue end
            if skip_count>0 then
                skip_count=skip_count-1
                goto continue
            end
            if pcalls[line] then
                skip_count=#pcalls[line]-1
                table.insert(add_pcall,pcalls[line])
                goto continue
            end
            table.insert(source,line)
            ::continue::
        end
    end
    table.insert(source,']=]')
    for _,v in ipairs(add_pcall) do
        if v.note then table.insert(source,'--'..v.note) end
        table.insert(source,'pcall(function() ffi.cdef[=[')
        for _,line in ipairs(v) do table.insert(source,line) end
        table.insert(source,']=] end)')
    end
    table.insert(source,('return ffi.load"%s" --[[@as table]]'):format(libname))
    vim.fn.writefile(source,outfile)
end
--- *foo*
gen_lib('xlib.lua',{
    '/usr/include/X11/Xlib.h',
    '/usr/include/X11/X.h',
    '/usr/include/X11/keysymdef.h',
},'X11',{
        'AnyButton',
        'AnyModifier',
        'ButtonPress',
        'ButtonPressMask',
        'ButtonRelease',
        'CirculateNotify',
        'CirculateRequest',
        'ClientMessage',
        'ColormapNotify',
        'ConfigureNotify',
        'ConfigureRequest',
        'ControlMask',
        'CreateNotify',
        'CurrentTime',
        'DestroyNotify',
        'EnterNotify',
        'Expose',
        'FocusIn',
        'FocusOut',
        'GenericEvent',
        'GrabModeAsync',
        'GrabModeSync',
        'GraphicsExpose',
        'GravityNotify',
        'IsViewable',
        'KeyPress',
        'KeyRelease',
        'KeymapNotify',
        'LASTEvent',
        'LeaveNotify',
        'LockMask',
        'MapNotify',
        'MapRequest',
        'MappingNotify',
        'Mod1Mask',
        'Mod2Mask',
        'Mod3Mask',
        'Mod4Mask',
        'Mod5Mask',
        'MotionNotify',
        'NoExpose',
        'PropertyNotify',
        'ReparentNotify',
        'ReplayPointer',
        'ResizeRequest',
        'RevertToParent',
        'SelectionClear',
        'SelectionNotify',
        'SelectionRequest',
        'ShiftMask',
        'StructureNotifyMask',
        'SubstructureNotifyMask',
        'SubstructureRedirectMask',
        'UnmapNotify',
        'VisibilityNotify',
        'Window',
        'XAllowEvents',
        'XCloseDisplay',
        'XConfigureWindow',
        'XDefaultScreen',
        'XDefaultScreenOfDisplay',
        'XEvent',
        'XFree',
        'XGetInputFocus',
        'XGetWindowAttributes',
        'XGrabButton',
        'XGrabKey',
        'XInternAtom',
        'XKeysymToKeycode',
        'XMapWindow',
        'XMoveResizeWindow',
        'XNextEvent',
        'XOpenDisplay',
        'XPending',
        'XQueryTree',
        'XRectangle',
        'XRootWindow',
        'XSelectInput',
        'XSendEvent',
        'XSetInputFocus',
        'XSync',
        'XUnmapWindow',
        'XWindowAttributes',
        'XWindowChanges',
        {'^XK_'}
    })
gen_lib('clib.lua',{
'/usr/include/sys/ioctl.h',
'/usr/include/asm-generic/ioctls.h',
},'c',{
        'struct winsize',
        'TIOCGWINSZ',
        'ioctl',
    })
gen_lib('xfixlib.lua',{
    '/usr/include/X11/extensions/Xfixes.h',
    '/usr/include/X11/extensions/shapeconst.h',
},'Xfixes',{
        'ShapeInput',
        'ShapeBounding',
        'XFixesCreateRegion',
        'XFixesDestroyRegion',
        'XFixesSetWindowShapeRegion',
        'XFixesInvertRegion',
    })
