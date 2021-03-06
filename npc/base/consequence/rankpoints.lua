--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>. 
]]
local class = require("base.class")
local factions = require("base.factions")
local consequence = require("npc.base.consequence.consequence")
local tools = require("npc.base.tools")

local _rankpoints_helper_set
local _rankpoints_helper_add
local _rankpoints_helper_sub

local rankpoints = class(consequence,
function(self, mode, value)
    consequence:init(self)
    self["value"], self["valuetype"] = tools.set_value(value)
    if (mode == "=") then
            self["perform"] = _rankpoints_helper_set
    elseif (mode == "+") then
            self["perform"] = _rankpoints_helper_add
    elseif (mode == "-") then
            self["perform"] = _rankpoints_helper_sub
    else
        -- unkonwn comparator
    end
end)

function _rankpoints_helper_set(self, npcChar, player)
    local value = tools.get_value(self.npc, self.value, self.valuetype)
    local rankpoints = factions.getRankpoints(player)
    rankpoints = value
    factions.setRankpoints(player,rankpoints)
end

function _rankpoints_helper_add(self, npcChar, player)
    local value = tools.get_value(self.npc, self.value, self.valuetype)
    local rankpoints = factions.getRankpoints(player)
    rankpoints = rankpoints + value
    factions.setRankpoints(player,rankpoints)
end

function _rankpoints_helper_sub(self, npcChar, player)
    local value = tools.get_value(self.npc, self.value, self.valuetype)
    local rankpoints = factions.getRankpoints(player)
    rankpoints = rankpoints - value
    factions.setRankpoints(player,rankpoints)
end
    
return rankpoints