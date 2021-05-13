local CHAR = ix.meta.character

function CHAR:IsClassD()
	return self:GetFaction() == FACTION_CLASSD
end

function CHAR:IsEmployee()
	return self:GetFaction() == FACTION_SCIENTIST
end

function CHAR:GetSalary()
	local faction = self:GetFaction()

	local factionTab = ix.faction.indices[faction]

	if not factionTab then
		return 0
	end

	if not factionTab.pay then
		return 0
	end

	return factionTab.pay
end