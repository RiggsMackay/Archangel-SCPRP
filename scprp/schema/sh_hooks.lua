function Schema:CanDrive(client, entity)
	return false
end

ix.StaminaBreathe = false

function Schema:PlayerTick(ply)
	if not ply.NextStaminaBreathe or ply.NextStaminaBreathe <= CurTime() then
		local stamina = ply:GetNetVar("stm", 100)
		if stamina <= 10 then
			ply:EmitSound("player/heartbeat1.wav", 60)
			ply:EmitSound("player/breathe1.wav", 60)
			ix.StaminaBreathe = true
			timer.Simple(3.9, function()
				ply:StopSound("player/heartbeat1.wav")
				ply:StopSound("player/breathe1.wav")
				ix.StaminaBreathe = false
			end)
			ply.NextStaminaBreathe = CurTime() + 4
		end
	end
end