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

-- snowpatch (928)


local common = require("base.common")
local gathering = require("content.gathering")

module("content.gatheringcraft.snowballmaking", package.seeall)

function StartGathering(User, SourceItem, ltstate)

    gathering.InitGathering()
    local snowballmaking = gathering.snowballmaking

    common.ResetInterruption( User, ltstate )
    if ( ltstate == Action.abort ) then -- work interrupted
        User:talk(Character.say, "#me unterbricht "..common.GetGenderText(User, "seine", "ihre").." Arbeit.", "#me interrupts "..common.GetGenderText(User, "his", "her").." work.")
        return
    end

    if not common.CheckItem( User, SourceItem ) then -- security check
        return
    end

    if not common.FitForWork( User ) then -- check minimal food points
        return
    end

    common.TurnTo( User, SourceItem.pos ) -- turn if necessary

    -- check the amount
    local MaxAmount = 10
    local changeItem = false
    local amountStr = SourceItem:getData("amount")
    local amount = 0
    if ( amountStr ~= "" ) then
        amount = tonumber(amountStr)
    elseif ( SourceItem.wear == 255 ) then
        amount = MaxAmount
    end


    if ( ltstate == Action.none ) then -- currently not working -> let's go
        snowballmaking.SavedWorkTime[User.id] = snowballmaking:GenWorkTime(User,toolItem)
        User:startAction( snowballmaking.SavedWorkTime[User.id], 0, 0, 0, 0)
        User:talk(Character.say, "#me formt Schneeb�lle.", "#me forms snowballs.")
        return 
    end

    -- since we're here, we're working
    amount = amount - 1
    SourceItem:setData("amount",amount)
    world:changeItem(SourceItem)

    local notCreated = User:createItem( 456, 1, 333, nil ) -- create the new produced items
    if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
        world:createItemFromId( 456, notCreated, User.pos, true, 333, nil )
        common.HighInformNLS(User,
        "Du kannst nichts mehr halten und der Rest f�llt zu Boden.",
        "You can't carry any more and the rest drops to the ground.")
    else -- character can still carry something
        if amount > 0 then  -- there are still items we can work on
            snowballmaking.SavedWorkTime[User.id] = snowballmaking:GenWorkTime(User,toolItem)
            User:changeSource(SourceItem)
            User:startAction( snowballmaking.SavedWorkTime[User.id], 0, 0, 0, 0)
        end
    end
    if amount == 0 then
        SourceItem:setData("amount","")
        SourceItem.id = 929
        SourceItem.wear = 4
        world:changeItem(SourceItem)
        User:inform("Hier gibt es kaum noch Schnee.",
                    "You have depleted the snow pile.",Character.highPriority)
        return
    end

end
