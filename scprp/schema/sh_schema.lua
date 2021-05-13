--[[ Schema Base Config ]]--

Schema.name = "SCP Serious Roleplay"
Schema.description = "A Serious Roleplay Server, with custom content."
Schema.community = "Archangel Community"

Schema.author = "Riggs"
Schema.developers = "Riggs"

--[[ Schema Config ]]--

Schema.MainColor = Color(50, 100, 200)
Schema.MainColorSelect = Color(100, 150, 200)

Schema.ButtonClick = Sound("ui/buttonclick.wav")
Schema.ButtonHover = Sound("ui/buttonrollover.wav")

--[[ Schema Includes ]]--

ix.util.Include("cl_schema.lua")
ix.util.Include("sv_schema.lua")

ix.util.Include("cl_hooks.lua")
ix.util.Include("sh_hooks.lua")
ix.util.Include("sv_hooks.lua")

ix.util.Include("sh_anims.lua")

ix.util.Include("meta/sh_character.lua")
ix.util.Include("meta/sh_player.lua")