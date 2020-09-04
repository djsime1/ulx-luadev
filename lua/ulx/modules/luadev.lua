if not luadev then return end

function ulx.ld_l(calling_ply, line)
    ulx.fancyLogAdmin(calling_ply, true, "#A executed #s on server.", line)
    luadev.RunOnServer(line, luadev.GetPlayerIdentifier(calling_ply, "l "), {ply=calling_ply})
end
local ld_l = ulx.command("luadev", "ulx l", ulx.ld_l, "!l", true)
ld_l:addParam{["type"] = ULib.cmds.StringArg, ["hint"] = "lua", ULib.cmds.takeRestOfLine}
ld_l:defaultAccess(ULib.ACCESS_SUPERADMIN)
ld_l:help("Execute lua on server")

function ulx.ld_ls(calling_ply, line)
    ulx.fancyLogAdmin(calling_ply, true, "#A executed #s on shared.", line)
    luadev.RunOnShared(line, luadev.GetPlayerIdentifier(calling_ply, "ls "), {ply=calling_ply})
end
local ld_ls = ulx.command("luadev", "ulx ls", ulx.ld_ls, "!ls", true)
ld_ls:addParam{["type"] = ULib.cmds.StringArg, ["hint"] = "lua", ULib.cmds.takeRestOfLine}
ld_ls:defaultAccess(ULib.ACCESS_SUPERADMIN)
ld_ls:help("Execute lua on shared")

function ulx.ld_lc(calling_ply, line)
    ulx.fancyLogAdmin(calling_ply, true, "#A executed #s on clients.", line)
    luadev.RunOnClients(line, luadev.GetPlayerIdentifier(calling_ply, "lc "), {ply=calling_ply})
end
local ld_lc = ulx.command("luadev", "ulx lc", ulx.ld_lc, "!lc", true)
ld_lc:addParam{["type"] = ULib.cmds.StringArg, ["hint"] = "lua", ULib.cmds.takeRestOfLine}
ld_lc:defaultAccess(ULib.ACCESS_SUPERADMIN)
ld_lc:help("Execute lua on clients")

function ulx.ld_lsc(calling_ply, target, line)
    ulx.fancyLogAdmin(calling_ply, true, "#A executed #s on #T", line, target)
    luadev.RunOnClient(line, target, luadev.GetPlayerIdentifier(calling_ply, "lsc "), {ply=calling_ply})
end
local ld_lsc = ulx.command("luadev", "ulx lsc", ulx.ld_lsc, "!lsc", true)
ld_lsc:addParam{["type"] = ULib.cmds.PlayerArg, ["hint"] = "target"}
ld_lsc:addParam{["type"] = ULib.cmds.StringArg, ["hint"] = "lua", ULib.cmds.takeRestOfLine}
ld_lsc:defaultAccess(ULib.ACCESS_SUPERADMIN)
ld_lsc:help("Execute lua on a client")

function ulx.ld_lm(calling_ply, line)
    ulx.fancyLogAdmin(calling_ply, true, "#A executed #s on self.", line, target)
    luadev.RunOnClient(line, calling_ply, luadev.GetPlayerIdentifier(calling_ply, "lm "), {ply=calling_ply})
end
local ld_lm = ulx.command("luadev", "ulx lm", ulx.ld_lm, "!lm", true)
ld_lm:addParam{["type"] = ULib.cmds.StringArg, ["hint"] = "lua", ULib.cmds.takeRestOfLine}
ld_lm:defaultAccess(GetConVar("sv_allowcslua"):GetBool() and ULib.ACCESS_ALL or ULib.ACCESS_SUPERADMIN)
ld_lm:help("Execute lua on self")

function ulx.ld_lb(calling_ply, line)
    ulx.fancyLogAdmin(calling_ply, true, "#A executed #s on client and server.", line, target)
    luadev.RunOnClient(line, calling_ply, luadev.GetPlayerIdentifier(calling_ply, "lb "), {ply=calling_ply})
    luadev.RunOnServer(line, luadev.GetPlayerIdentifier(calling_ply, "lb "), {ply=calling_ply})
end
local ld_lb = ulx.command("luadev", "ulx lb", ulx.ld_lb, "!lb", true)
ld_lb:addParam{["type"] = ULib.cmds.StringArg, ["hint"] = "lua", ULib.cmds.takeRestOfLine}
ld_lb:defaultAccess(ULib.ACCESS_SUPERADMIN)
ld_lb:help("Execute lua on client and server")