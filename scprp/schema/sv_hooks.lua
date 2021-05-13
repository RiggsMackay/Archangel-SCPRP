function Schema:PlayerSwitchFlashlight(ply)
	return ply:IsEmployee()
end

function Schema:PlayerTick(ply)
	ply:SetDuckSpeed(0.4)
	ply:SetUnDuckSpeed(0.4)
end