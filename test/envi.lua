-- INSERT INTO triggerfields VALUES (8,12,0,'test.envi');
require("base.common")
require("base.factions");
module("test.envi", package.seeall)




function MoveToField(char)
	if char:getType() ~= Character.player then --Monsters will be ingored
		return
	end
	if math.random(0,99)< 99  and char:increaseAttrib("hitpoints",0)>0 then --Chance of 10% and Hitpoints above 0
		if base.factions.getMembership(char) ~= 2 then
		char:inform("Ohoh, ein Hinterhalt!", "Ohoh, an ambush!")
		world:gfx(41,position(5,5,0));
		world:gfx(41,position(6,6,0));
		else
        	world:gfx(41,position(10,11,0));
        	world:createMonster(101,position(10,11,0),0); --smelly mummy
		char:inform("Ohoh, ein Hinterhalt!", "Ohoh, an ambush2!")
		world:gfx(41,position(12,12,0));
        	world:createMonster(101,position(12,12,0),0); --mummified temple servant
		world:gfx(41,position(10,13,0));
        	world:createMonster(101,position(10,13,0),0); --Cherga's servant
        	world:gfx(41,position(10,10,0));
        	world:createMonster(101,position(10,10,0),0); --another mummy
		char:inform("Ohoh, ein Hinterhalt!", "Ohoh, an ambush3!")
			if base.factions.getMembership(char) == 1 then
			char:inform("Hui, du bist aus Cadomyr", "Hui, you are from Cadomyr")
			else
			char:inform("Hui, du bist nicht von Cadomyr", "Hui, you are not from Cadomyr")
			end
		end
	else
			char:warp(position(8,16,0))
			world:gfx(37,char.pos);
			world:makeSound(13,char.pos);
			char:inform("Die kr�chzende Stimme meldet sich wieder: \"Keine Chance!\" Worauf eine Stimme aus dem S�dwesten sagt: \"Lauf weg!\"", "The jagged voice says: \"No Chance!\". A voice from the southwest replies: \"Run away!\"")  
			world:makeSound(25,char.pos);			
			world:gfx(13,char.pos);
			char:increaseAttrib("hitpoints", -5000)
	end

end


