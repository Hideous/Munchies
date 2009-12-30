AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

ENT.aModel = "models/hideous/pill.mdl"
ENT.killme = false
ENT.touched = false

function ENT:Initialize()
	self.Entity:SetModel(self.aModel)
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	
	self.Entity:SetNotSolid(true)
	self.Entity:SetTrigger(true)
end

function ENT:GetCenterPos()
	return self:GetPos()
end

function ENT:Use(activator, caller)
	return true
end

function ENT:Touch(hitEnt)
	if (!self.Entity.active) then return end
	if (!hitEnt:IsValid()) or (!hitEnt:IsPlayer()) or (hitEnt:Team() != TEAM_RUNNER) then return end
	
	if (!self.Entity.touched) then
		hitEnt.Entity.super = true
		self.Entity.touched = true
		self.Entity.killme = true
	end
end

function ENT:Think()
	if (self.Entity.killme) then
		self:EmitSound("HealthKit.Touch")
		self:Remove()
	end
end