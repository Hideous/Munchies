AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

ENT.aModel = "models/hideous/pill.mdl"
ENT.active = true
ENT.hide = false
ENT.touched = false

function ENT:Initialize()
	self.Entity:SetModel(self.aModel)
	//self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	
	self.Entity:SetNotSolid(true)
	self.Entity:SetTrigger(true)
	
	/*local phys = self.Entity:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end*/
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
	
	if self.Entity.touched == false then
		hitEnt:AddFrags(1)
		self.Entity.touched = true
		self.Entity.hide = true
	end
end

function ENT:Think()
	if (self.Entity.hide == true) and (self.Entity.active == true) then
		self:EmitSound("HealthKit.Touch")
		self:SetColor(255,255,255,0)
		self.Entity.active = false
		self.Entity.hide = false
	end
	
	if (self.Entity.hide == false) and (self.Entity.active == true) then
		self:SetColor(255,255,255,255)
	end
end