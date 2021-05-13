
--[[ Base Config ]]--

FACTION.name = "SCP"
FACTION.description = [[Name: SCP
Description: Someone that has been trusted to become a researcher
in the SCP Facility.]]
FACTION.color = Color(250, 100, 100)

--[[ Additional Config ]]--

FACTION.models = {
	"models/player/group02/male_02",
	"models/player/group02/male_04",
	"models/player/group02/male_06",
	"models/player/group02/male_08",
}

FACTION.isGloballyRecognized = true
FACTION.isDefault = false

FACTION.payTime = 600
FACTION.pay = 0

--[[ Do not change! ]]--

FACTION_SCP = FACTION.index