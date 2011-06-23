module("content.grave", package.seeall)
--UNDER CONSTRUCTION by envi--
function InitGrave()
    signTextDe={};
    signTextEn={};
    signCoo={};
    signItemId={};
    signPerception={};

	--UPDATE common SET com_script="item/signpost.lua" WHERE com_itemid=245;

    
	---------------- GRABSTEINE ----------------

    --AddGrave({X,Y,Z},german text,english text, type,0);
    --typs:
    -- 1 = east-west direction 1
    -- 2 = east-west direction 2
    -- 3 = all directions (column)
    -- 4 = coffin
    --[[
    --Cadomyr
    AddGrave({134,638,0},"","", 1,0);
    AddGrave({134,640,0},"","", 2,0);
	AddGrave({130,637,0},"","", 3,0);
	AddGrave({133,637,0},"","", 3,0);
	AddGrave({105,632,-4},"","", 4,0);
	AddGrave({106,632,-4},"","", 4,0);
	AddGrave({111,666,-4},"","", 3,0);
	AddGrave({106,663,-4},"","", 3,0);
	AddGrave({107,673,-4},"","", 3,0);
	AddGrave({113,670,-4},"","", 1,0);
	AddGrave({108,665,-4},"","", 1,0);
	AddGrave({157,668,-4},"","", 4,0);
	AddGrave({158,667,-4},"","", 3,0);
	--Cherass� Citadel
	AddGrave({572,314,0},"","", 2,0);
	AddGrave({576,314,0},"","", 3,0);
	AddGrave({569,316,0},"","", 4,0);
	AddGrave({570,316,0},"","", 4,0);
	AddGrave({571,316,0},"","", 4,0);
	AddGrave({572,316,0},"","", 4,0);
	AddGrave({573,316,0},"","", 4,0);
	AddGrave({569,318,0},"","", 4,0);
	AddGrave({570,318,0},"","", 4,0);
	AddGrave({571,318,0},"","", 4,0);
	AddGrave({572,318,0},"","", 4,0);
	AddGrave({573,318,0},"","", 4,0);
	AddGrave({581,315,0},"","", 1,0);
	AddGrave({605,327,0},"","", 1,0);
	AddGrave({605,344,0},"","", 1,0);
	AddGrave({592,355,0},"","", 3,0);
	AddGrave({585,323,0},"","", 2,0);
	AddGrave({588,326,0},"","", 3,0);
	AddGrave({630,355,0},"","", 1,0); --outside
	AddGrave({650,347,0},"","", 1,0); --outside
	--Craven cave
    AddGrave({672,386,2},"","", 4,0);
    AddGrave({671,386,2},"","", 4,0);
    AddGrave({670,386,2},"","", 4,0);
    AddGrave({669,386,2},"","", 4,0);
    AddGrave({668,386,2},"","", 4,0);
    AddGrave({667,386,2},"","", 4,0);
    AddGrave({666,386,2},"","", 4,0);
    AddGrave({665,386,2},"","", 4,0);
    AddGrave({664,386,2},"","", 4,0);
    AddGrave({663,386,2},"","", 4,0);
	--Creek Settlement
    AddGrave({187,509,0},"","", 1,0);
    AddGrave({194,505,0},"","", 3,0);
	--Cursed Place
    AddGrave({387,544,0},"","", 2,0);
    AddGrave({387,542,0},"","", 1,0);
    --Death Marsh
    AddGrave({667,366,0},"","", 3,0);
    AddGrave({686,356,0},"","", 3,0);
    AddGrave({717,354,0},"","", 3,0);
    AddGrave({725,369,0},"","", 1,0);
    AddGrave({745,369,0},"","", 3,0);
    AddGrave({773,369,0},"","", 2,0);
    AddGrave({791,353,0},"","", 2,0);--Witch's Cottage
    AddGrave({712,371,0},"","", 1,0);
    --Death's Stench
    AddGrave({805,586,0},"","", 3,0);
    --Death Swath
    AddGrave({501,462,0},"","", 1,0);
    AddGrave({504,463,0},"","", 3,0);
    AddGrave({509,467,0},"","", 3,0);
    AddGrave({521,466,0},"","", 1,0);
    AddGrave({528,476,0},"","", 1,0);
    AddGrave({530,481,0},"","", 1,0);
    AddGrave({521,490,0},"","", 3,0);
    AddGrave({525,491,0},"","", 3,0);
    AddGrave({519,494,0},"","", 1,0);
    AddGrave({529,497,0},"","", 1,0);
    AddGrave({532,489,0},"","", 1,0);
    AddGrave({532,485,0},"","", 3,0);
    AddGrave({537,492,0},"","", 1,0);
    AddGrave({536,496,0},"","", 3,0);
    AddGrave({545,501,0},"","", 3,0);
	--Elstree Plain
    AddGrave({751,378,0},"","", 1,0);
    AddGrave({720,426,0},"","", 1,0);
    --Elven Ruins
    AddGrave({549,451,0},"","", 1,0);
    AddGrave({547,439,0},"","", 1,0);
    AddGrave({547,440,0},"","", 1,0);
    --Galmair
    AddGrave({393,178,-6},"","", 1,0);--Hog Dens
    AddGrave({393,180,-6},"","", 3,0);--Hog Dens
    AddGrave({392,257,-6},"","", 3,0);--Ronagans Altar
    AddGrave({361,303,-6},"","", 3,0);--The Winged Sow Tavern        
    AddGrave({333,265,-6},"","", 1,0);--Sewers
    AddGrave({331,271,-6},"","", 1,0);--Sewers
    AddGrave({331,270,-6},"","", 1,0);--Sewers
    AddGrave({333,273,-6},"","", 3,0);--Sewers
    AddGrave({338,282,-6},"","", 1,0);--Sewers
    AddGrave({327,295,-6},"","", 3,0);--Sewers
    AddGrave({298,331,-6},"","", 3,0);--Sewers
    --Galmair hinterlands
    AddGrave({545,501,0},"","", 3,0);--Sport Hole]]--
    --Glittering Cave
    AddGrave({564,382,0},"Hier hat es sich ausgefunkelt!","Glittering is over now!", 3,0);
    --[[--Glowing Forest
    AddGrave({503,536,0},"","", 3,0);
    AddGrave({481,513,0},"","", 1,0);
    AddGrave({520,523,0},"","", 3,0);
    --Glowing Gate
    AddGrave({489,582,0},"","", 4,0);
    --Hammerfall Mine
    AddGrave({264,418,0},"","", 3,0);
	--Lighthouse
	AddGrave({536,608,0},"","", 1,0);
	AddGrave({538,615,0},"","", 1,0);
	AddGrave({532,609,0},"","", 3,0);
	AddGrave({536,659,0},"","", 1,0);
	AddGrave({539,660,0},"","", 3,0);
	AddGrave({530,668,0},"","", 1,0);
	AddGrave({528,666,0},"","", 3,0);
	AddGrave({528,660,0},"","", 3,0);
	AddGrave({528,658,0},"","", 1,0);
	AddGrave({530,660,0},"","", 1,0);
	--Lonly Island
	AddGrave({610,888,0},"","", 2,0);
    AddGrave({610,886,0},"","", 1,0);
	--Lost Building (1)
    AddGrave({252,722,0},"","", 1,0);
    AddGrave({247,728,0},"","", 3,0);
    AddGrave({256,725,0},"","", 3,0);]]--
   	--Moshran's Brood
    AddGrave({410,726,0},"Bald deines!","Soon yours!", 1,5);
    AddGrave({409,734,0},"~Als du den Grabstein n�her untersuchst vernimmst du einen schmerzerf�llten Schrei.~","~You hear a painful cry when you investigate the tomb stone.~", 3,0);
    --Mount Zotmore
    AddGrave({366,500,0},"Hier ruht Zot's Freizeit!","Zot's sparetime rests here!", 1,0);
    AddGrave({348,503,0},"Zu Ehren jenen die Zot's Opfer wurden.","To honour of Zot's victims.", 3,0);
	--[[--Nagrun's Plain
    AddGrave({519,207,0},"","", 1,0);
    AddGrave({538,250,0},"","", 1,0);
    AddGrave({555,262,0},"","", 4,0);
    AddGrave({614,259,0},"","", 2,0);
    --Pirate Cove
    AddGrave({12,516,0},"","", 3,0);
    AddGrave({30,525,0},"","", 1,0);
    AddGrave({60,548,1},"","", 1,0);
    AddGrave({57,555,1},"","", 3,0);
	--Runewick
	AddGrave({896,799,0},"","", 3,5); --slums graveyard
	AddGrave({895,803,0},"","", 3,5); --slums graveyard
	AddGrave({891,800,0},"","", 3,5); --slums graveyard
	AddGrave({889,803,0},"","", 3,5); --slums graveyard
	AddGrave({891,803,0},"","", 1,5); --slums graveyard
	AddGrave({894,801,0},"","", 1,5); --slums graveyard
	AddGrave({892,799,0},"","", 1,5); --slums graveyard
	AddGrave({908,803,-3},"","", 4,5); --tomb
	AddGrave({908,805,-3},"","", 4,5); --tomb
	AddGrave({907,803,-3},"","", 4,5); --tomb
	AddGrave({907,805,-3},"","", 4,5); --tomb
	--Runewick Hinterland
	AddGrave({925,940,0},"","", 1,5); --Twin Eyes Islands
	AddGrave({865,846,0},"","", 2,5); --Woodcutter's Hut
	AddGrave({862,847,0},"","", 3,5); --Woodcutter's Hut
	AddGrave({879,759,0},"","", 1,5); --Fire of Triumph
	--Snakehead Coast
    AddGrave({621,463,0},"","", 1,0);
    AddGrave({692,483,0},"","", 1,0); --Wilder Island
    AddGrave({714,442,0},"","", 3,0);
	--Spider's Mouth
    AddGrave({665,293,0},"","", 1,0);
    AddGrave({690,341,0},"","", 2,0);
    AddGrave({725,369,0},"","", 1,0);
    AddGrave({665,293,0},"","", 1,0);
    --The Swamp
    AddGrave({485,146,0},"","", 1,0);
    AddGrave({494,105,0},"","", 3,0);
    AddGrave({508,102,0},"","", 3,0);
    AddGrave({498,113,0},"","", 3,0);
	AddGrave({503,99,0},"","", 1,0);
    AddGrave({506,108,0},"","", 1,0);
    AddGrave({502,114,0},"","", 1,0);
	--Vrondus Farm
	AddGrave({312,574,0},"","", 1,0);
	AddGrave({308,559,0},"","", 3,0);
 	--Zumbrass Tomb
	AddGrave({331,471,0},"","", 1,0);
	AddGrave({323,467,0},"","", 3,0);]]--
	 
    
end

function AddWeg(Posi,dText,eText,Dir,Percept)
    local tablePos = Posi[1]..Posi[2]..Posi[3];
    PrepareTables(tablePos);
    table.insert(signCoo[tablePos],position(Posi[1],Posi[2],Posi[3]));
    table.insert(signTextDe[tablePos],dText);
    table.insert(signTextEn[tablePos],eText);
    table.insert(signPerception[tablePos],Percept);
    CheckAndPlaceItem(position(Posi[1],Posi[2],Posi[3]),DirToItemID(Dir));
end

function AddGrave(Posi,dText,eText,Type,Percept)
    local tablePos = Posi[1]..Posi[2]..Posi[3];
    PrepareTables(tablePos);
    table.insert(signCoo[tablePos],position(Posi[1],Posi[2],Posi[3]));
    table.insert(signTextDe[tablePos],dText);
    table.insert(signTextEn[tablePos],eText);
    table.insert(signPerception[tablePos],Percept);
    CheckAndPlaceItem(position(Posi[1],Posi[2],Posi[3]),DirToItemID(Type+10));
end

function AddPicture(Posi,dText,eText,Type,Percept)
    local tablePos = Posi[1]..Posi[2]..Posi[3];
    PrepareTables(tablePos);
    table.insert(signCoo[tablePos],position(Posi[1],Posi[2],Posi[3]));
    table.insert(signTextDe[tablePos],dText);
    table.insert(signTextEn[tablePos],eText);
    table.insert(signPerception[tablePos],Percept);
    CheckAndPlaceItem(position(Posi[1],Posi[2],Posi[3]),DirToItemID(Type+20));
end

function AddPennant(Posi,dText,eText,Type,Percept)
    local tablePos = Posi[1]..Posi[2]..Posi[3];
    PrepareTables(tablePos);
    table.insert(signCoo[tablePos],position(Posi[1],Posi[2],Posi[3]));
    table.insert(signTextDe[tablePos],dText);
    table.insert(signTextEn[tablePos],eText);
    table.insert(signPerception[tablePos],Percept);
    CheckAndPlaceItem(position(Posi[1],Posi[2],Posi[3]),DirToItemID(Type+30));
end

function AddTree(Posi,dText,eText,Type,Percept)
    local tablePos = Posi[1]..Posi[2]..Posi[3];
    PrepareTables(tablePos);
    table.insert(signCoo[tablePos],position(Posi[1],Posi[2],Posi[3]));
    table.insert(signTextDe[tablePos],dText);
    table.insert(signTextEn[tablePos],eText);
    table.insert(signPerception[tablePos],Percept);
    CheckAndPlaceItem(position(Posi[1],Posi[2],Posi[3]),DirToItemID(Type+40));
end

function AddPillar(Posi,dText,eText,Type,Percept)
    local tablePos = Posi[1]..Posi[2]..Posi[3];
    PrepareTables(tablePos);
    table.insert(signCoo[tablePos],position(Posi[1],Posi[2],Posi[3]));
    table.insert(signTextDe[tablePos],dText);
    table.insert(signTextEn[tablePos],eText);
    table.insert(signPerception[tablePos],Percept);
    CheckAndPlaceItem(position(Posi[1],Posi[2],Posi[3]),DirToItemID(Type+50));
end

function AddChimney(Posi,dText,eText,Type,Percept)
    local tablePos = Posi[1]..Posi[2]..Posi[3];
    PrepareTables(tablePos);
    table.insert(signCoo[tablePos],position(Posi[1],Posi[2],Posi[3]));
    table.insert(signTextDe[tablePos],dText);
    table.insert(signTextEn[tablePos],eText);
    table.insert(signPerception[tablePos],Percept);
    CheckAndPlaceItem(position(Posi[1],Posi[2],Posi[3]),DirToItemID(Type+60));
end

function AddMirror(Posi,dText,eText,Type,Percept)
    local tablePos = Posi[1]..Posi[2]..Posi[3];
    PrepareTables(tablePos);
    table.insert(signCoo[tablePos],position(Posi[1],Posi[2],Posi[3]));
    table.insert(signTextDe[tablePos],dText);
    table.insert(signTextEn[tablePos],eText);
    table.insert(signPerception[tablePos],Percept);
    CheckAndPlaceItem(position(Posi[1],Posi[2],Posi[3]),DirToItemID(Type+70));
end


function CheckAndPlaceItem(Posi,ItemID)
    if world:isItemOnField(Posi) then
        if ( world:getItemOnField(Posi).id ~= ItemID ) then
            world:createItemFromId(ItemID,1,Posi,true,333,0);
        end
    else
        world:createItemFromId(ItemID,1,Posi,true,333,0);
    end
end

function PrepareTables(TablePos)
    if (signCoo[TablePos] == nil) then
        signCoo[TablePos] = {};
        signTextDe[TablePos] = {};
        signTextEn[TablePos] = {};
        signPerception[TablePos] = {};
    end
end

-- DirToItemID converts item IDs into local type values for the Add functions to work with

function DirToItemID(Value)
    if (Value==0) then
        return 3081
    elseif (Value==2) then
        return 3084
    elseif (Value==4) then
        return 3082
    elseif (Value==6) then
        return 3083
    elseif (Value==11) then
        return 519
    elseif (Value==12) then
        return 521
    elseif (Value==13) then
        return 520
    elseif (Value==14) then
	    return 337
    elseif (Value==21) then
        return 1914
    elseif (Value==22) then
        return 1915
    elseif (Value==23) then
        return 264
    elseif (Value==24) then
        return 265
    elseif (Value==25) then
        return 748
    elseif (Value==26) then
        return 749
    elseif (Value==27) then
        return 750
    elseif (Value==28) then
        return 751
    elseif (Value==31) then
        return 2046
    elseif (Value==32) then
        return 2069
    elseif (Value==33) then
        return 512
    elseif (Value==34) then
        return 2924
    elseif (Value==35) then
        return 2925
    elseif (Value==36) then
        return 2926
    elseif (Value==37) then
        return 2927
    elseif (Value==41) then
        return 308
    elseif (Value==42) then
        return 586
    elseif (Value==43) then
        return 1804
    elseif (Value==44) then
        return 1807
    elseif (Value==45) then
        return 1808
    elseif (Value==46) then
        return 1809
    elseif (Value==47) then
        return 1817
    elseif (Value==51) then
        return 2805
    elseif (Value==52) then
        return 272
    elseif (Value==53) then
        return 692
    elseif (Value==54) then
        return 693
    elseif (Value==55) then
        return 694
    elseif (Value==56) then
        return 695
    elseif (Value==57) then
        return 440
    elseif (Value==58) then
        return 441
    elseif (Value==59) then
        return 442
    elseif (Value==60) then
        return 443
    elseif (Value==61) then
		return 268
	elseif (Value==62) then
		return 269
	elseif (Value==71) then
		return 2873
	elseif (Value==72) then
		return 2874
	end
end
