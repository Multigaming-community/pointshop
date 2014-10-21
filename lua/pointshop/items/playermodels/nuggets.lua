ITEM.Name = 'Pedobear-Carton'
ITEM.Price = 1000
ITEM.Model = 'models/player/nuggets.mdl'

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
	player_manager.AddValidModel( "nuggets", "models/player/nuggets.mdl" )
	AddCSLuaFile( "nuggets.lua" )
end

list.Set( "PlayerOptionsModel",  "nuggets", "models/player/nuggets.mdl" )
