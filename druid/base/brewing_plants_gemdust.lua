-- ALCHEMY
-- reworked version
-- bases upon Falk's original script
-- by Merung

require("base.common")
require("druid.base.alchemy")

module("druid.base.brewing_plants_gemdust", package.seeall)

function UseItem(User,SourceItem,TargetItem,Counter,Param,ltstate)
   
   -- infront of a cauldron?
   if base.common.GetFrontItemID(User) == 1008 then
	  
       -- if there is a cauldron, it will become our object of changes; let's save it
	   local cauldron = base.common.GetFrontItem( User );
	   
	   -- is the char an alchemist?
	    if User:getMagicType() ~= 3 then
		  base.common.TempInformNLS( User,
				"Nur jene, die in die Kunst der Alchemie eingef�hrt worden sind, k�nnen hier ihr Werk vollrichten.",
				"Only those who have been introduced to the art of alchemy are able to work here."
							);
		  return;
	    end
	   
	    -- there is a complete potions; we cannot add anything to it
		if (cauldron:getData("potionID") ~= "") then 
	        base.common.TempInformNLS( User,
		    "Einem fertigen Trank kannst Du nichts mehr beif�gen.",
		    "You cannot add something to a completed potion."
			   );
		    return;
	    end
	
		local AlchemyPlant = druid.base.alchemy.CheckIfAlchemyPlant(User,SourceItem);
	    local GemDust = druid.base.alchemy.CheckIfGemDust(User,SourceItem);
		-- check if the SourceItem is a herb used for alchemy
		if AlchemyPlant or SourceItem.id == 157 then
		    BrewingPlant(User,SourceItem,cauldron)
	        
			-- check if it is a mineral which can be used for prefixing
		elseif SourceItem.id == 316 then
		    BrewingPrefix(User,SourceItem,cauldron)
		
		    -- check if it is gem dust
	    elseif GemDust then
		   BrewingGemDust(User,SourceItem,cauldron)
	    end
    end
end

function BrewingPlant(User,SourceItem,cauldron)
	
	if ( ltstate == Action.abort ) then
		base.common.TempInformNLS( User,
		"Du brichst Deine Arbeit ab.",
		"You abort your work."
			   );
		return;
	end
	
	if (ltstate == Action.none) then
	   User:startAction(20,21,5,0,0);
	   return
	end
	
	local dataZList = druid.base.alchemy.SplitCauldronData(User,cauldronData);
	if SourceItem.id == 157 then -- rotten treebark
		-- try to neutralize a already neutral stock -> boom!
		if (cauldron:getData("stockData") == "55555555") then
			druid.base.alchemy.StockExplosion(User, SourceItem, cauldron);
			return;
		-- no stock; let's tell the char!
		elseif (cauldron:getData("stockData") == "") then
			base.common.TempInformNLS( User,
			"Es befindet sich nichts zum Filtern im Kessel.",
			"There is nothing to filter in the cauldron."
			   );
			return
		end
		-- there is a not neutral stock
		for i=1,8 do
			if dataZList < 5 then 
				dataZList[i] = dataZList[i] + 1
			elseif dataZList > 5 then
				dataZList[i] = dataZList[i] - 1
			end	
		end
	end
	
	-- if there is no cauldronData, we will create one    
	if (cauldron:getData("stockData") == "") then
	   cauldron:setData("stockData","55555555");
	end
	
	local cauldronData = tonumber(cauldron:getData("stockData"));
	
	if SourceItem.id ~= 157 then -- not a rotten tree bark; a normal alchemy herb
		
		local Plant = SourceItem.id
		local plusWertPos,minusWertPos = druid.base.alchemy.SplitPlantData(Plant);
		-- "overflow" leads to explosion of the stock
		if dataZList[plusWertPos] == 9 or dataZList[minusWertPos] == 1 then
		  druid.base.alchemy.StockExplosion(User, SourceItem, cauldron);
		  return;
		end 

		if plusWertPos == 0 then
		   dataZList[minusWertPos] = dataZList[minusWertPos] - 1 ;
		elseif minusWertPos == 0 then
			   dataZList[plusWertPos] = dataZList[plusWertPos] + 1 ;
		else
			dataZList[plusWertPos] = dataZList[plusWertPos] + 1 ;
			dataZList[minusWertPos] = dataZList[minusWertPos] - 1 ;
		end
	end
	
	-- delete the plant
	world:makeSound(10,cauldron.pos);
	User:increaseAtPos(SourceItem.itempos,-1);
	
	-- learn!
	User:learn("alchemy",6,10,100,User:increaseAttrib("perception",0))
	
	-- the new data value is being created
	local newStockData = druid.base.alchemy.PasteCauldronData(User,dataZList);
	cauldron:setData("stockData",""..newStockData);
	world:changeItem(cauldron)
end

function BrewingGemDust(User,SourceItem,cauldron)
	
	-- no stock, no potion!	
	if (cauldron:getData("stockData") == "") then
	   base.common.TempInformNLS( User,
		"Im Kessel muss sich ein Sud befinden, um diesen zu verazaubern.",
		"There has to be a stock in the cauldron so that you can enchant it."
			   );
		return;
	end
	
	if ( ltstate == Action.abort ) then
		base.common.TempInformNLS( User,
		"Du brichst Deine Arbeit ab.",
		"You abort your work."
			   );
		return;
	end
	
	if (ltstate == Action.none) then
	   User:startAction(20,21,5,0,0);
	   return
	end
	
	if SourceItem.id == 446 then --bluestone
	   ID_potion = 165 -- id of the matching potion
	elseif SourceItem.id == 447 then  -- ruby
		   ID_potion = 59
	elseif SourceItem.id == 448 then  -- emerald
		   ID_potion = 327
	elseif SourceItem.id ==	449 then  -- blackstone
		   ID_potion = 329
	elseif SourceItem.id == 450 then -- amethyst
		   ID_potion = 166
	elseif SourceItem.id == 451 then -- topaz
		   ID_potion = 328
	elseif SourceItem.id == 452 then -- diamond
		   ID_potion = 330
	end 
	
	-- change cauldron's data and quality
	world:makeSound(13,cauldron.pos);
	world:gfx(52,cauldron.pos);
	cauldron:setData("potionID", ""..ID_potion);
	cauldron.quality = 999; -- !!!!!!!!!!!!!!!!!!!!!! note to myself (merung): replace it with a proper calculation  !!!!!!!!!!!!!!!!!!
	world:changeItem(cauldron);
	
	User:increaseAtPos(SourceItem.itempos,-1); -- delete gemdust
	-- learn!
	User:learn("alchemy",6,10,100,User:increaseAttrib("essence",0));
		
end	   	