ITEM.Name = 'Spy'
ITEM.Price = 1000
ITEM.Model = 'models/player/drpyspy/spy.mdl'

function ITEM:OnEquip(ply, modifications)
	if not ply._OldModel then
		ply._OldModel = ply:GetModel()
	end
	
	timer.Simple(1, function() ply:SetModel(self.Model) end)
end

function ITEM:OnHolster(ply)
	if ply._OldModel then
		ply:SetModel(ply._OldModel)
	end
end

function ITEM:PlayerSetModel(ply)
	ply:SetModel(self.Model)
end

if (SERVER) then
	player_manager.AddValidModel( "spy", "models/player/drpyspy/spy.mdl" )
	AddCSLuaFile( "spy.lua" )
end

list.Set( "PlayerOptionsModel",  "spy", "models/player/drpyspy/spy.mdl" )
