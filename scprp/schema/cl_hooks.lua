function Schema:CharacterLoaded(character)
	self:ExampleFunction("@serverWelcome", character:GetName())
end

function Schema:OnSpawnMenuOpen()
	if not LocalPlayer():GetCharacter():HasFlags("e") then
		return false
	end
end

local staminabluramount = 0

--[[ Icons ]]--

local name = ix.util.GetMaterial("archangelscprp/icons/hud/name.png")
local job = ix.util.GetMaterial("archangelscprp/logo.png")
local money = ix.util.GetMaterial("archangelscprp/icons/hud/money.png")
local salary = ix.util.GetMaterial("archangelscprp/icons/hud/xp.png")
local hunger = ix.util.GetMaterial("archangelscprp/icons/hud/hunger.png")
local thirst = ix.util.GetMaterial("archangelscprp/icons/hud/thirst.png")

function Schema:HUDPaint()
	local ply = LocalPlayer()
	local char = ply:GetCharacter()
	local frametime = RealFrameTime()
	if (ix.StaminaBreathe == true) then
		staminabluramount = Lerp(frametime / 2, staminabluramount, 255)
	else
		staminabluramount = Lerp(frametime / 2, staminabluramount, 0)
	end
	
	ix.util.DrawBlurAt(0, 0, ScrW(), ScrH(), 5, 0.2, staminabluramount)
	
	if ply:IsValid() and ply:Alive() then
		local moneyamount = char:GetMoney()
		if moneyamount == 0 then
			moneyamount = "No Money"
		end
		
		local salaryamount = char:GetSalary()
		if salaryamount == 0 then
			salaryamount = "No Salary"
		end
		
		local hungeramount = char:GetSatiety()
		if not hungeramount then
			hungeramount = "Invalid"
		end
		
		local thirstamount = char:GetSaturation()
		if not thirstamount then
			thirstamount = "Invalid"
		end
		
		surface.SetDrawColor(Color(0, 0, 0, 190))
		surface.DrawRect(10, ScrH() - 210, ScrW() / 3, 200)
		
		if not (ix.option.Get("cheapBlur", false)) then
			ix.util.DrawBlurAt(10, ScrH() - 210, ScrW() / 3, 200)
		end
		
		surface.SetDrawColor(color_white)
		surface.DrawOutlinedRect(10, ScrH() - 210, ScrW() / 3, 200, 2)
		surface.DrawOutlinedRect(10, ScrH() - 210, ScrW() / 6, 200, 2)
		
		surface.SetDrawColor(color_white)
		
		surface.SetMaterial(name)
		surface.DrawTexturedRect(ScrW() / 6 + 20, ScrH() - 200, 25, 25)
		draw.SimpleText(ply:Nick(), "ixMediumFont", ScrW() / 6 + 50, ScrH() - 200, color_white)
		
		surface.SetMaterial(job)
		surface.DrawTexturedRect(ScrW() / 6 + 20, ScrH() - 170, 25, 25)
		draw.SimpleText(team.GetName(ply:Team()), "ixMediumFont", ScrW() / 6 + 50, ScrH() - 170, color_white)
		
		surface.SetMaterial(money)
		surface.DrawTexturedRect(ScrW() / 6 + 20, ScrH() - 140, 25, 25)
		draw.SimpleText(moneyamount, "ixMediumFont", ScrW() / 6 + 50, ScrH() - 140, color_white)
		
		surface.SetMaterial(salary)
		surface.DrawTexturedRect(ScrW() / 6 + 20, ScrH() - 110, 25, 25)
		draw.SimpleText(salaryamount, "ixMediumFont", ScrW() / 6 + 50, ScrH() - 110, color_white)
		
		surface.SetMaterial(hunger)
		surface.DrawTexturedRect(ScrW() / 6 + 20, ScrH() - 80, 25, 25)
		draw.SimpleText(hungeramount, "ixMediumFont", ScrW() / 6 + 50, ScrH() - 80, color_white)
		
		surface.SetMaterial(thirst)
		surface.DrawTexturedRect(ScrW() / 6 + 20, ScrH() - 50, 25, 25)
		draw.SimpleText(thirstamount, "ixMediumFont", ScrW() / 6 + 50, ScrH() - 50, color_white)
	end
end