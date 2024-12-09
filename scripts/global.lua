if (GLOBALTHINGSICANTPRETENDTOCAREABOUT ~= nil) then
    return GLOBALTHINGSICANTPRETENDTOCAREABOUT
end
local M = {}

M.current_screen = nil
M.screen_stack = {}

local defsave = require("defsave.defsave")
defsave.appname = "KistrasMinesweeper"
defsave.load("config")
defsave.update("config")

local default_variables = {
    name = "Player" .. math.random(1000, 9999),
}
for k, v in pairs(default_variables) do
    if defsave.get("config", k) == nil then
        defsave.set("config", k, v)
    end
end

M.defsave = defsave

GLOBALTHINGSICANTPRETENDTOCAREABOUT = M
return M