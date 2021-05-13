local PLAYER = FindMetaTable("Player")

function PLAYER:IsClassD()
	return self:Team() == FACTION_CLASSD
end

function PLAYER:IsEmployee()
	return self:Team() == FACTION_SCIENTIST
end