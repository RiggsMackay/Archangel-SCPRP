
PLUGIN.name = "Primary Needs"
PLUGIN.author = "Bilwin"
PLUGIN.schema = "Any"
PLUGIN.license = [[
    This is free and unencumbered software released into the public domain.
    Anyone is free to copy, modify, publish, use, compile, sell, or
    distribute this software, either in source code form or as a compiled
    binary, for any purpose, commercial or non-commercial, and by any
    means.
    In jurisdictions that recognize copyright laws, the author or authors
    of this software dedicate any and all copyright interest in the
    software to the public domain. We make this dedication for the benefit
    of the public at large and to the detriment of our heirs and
    successors. We intend this dedication to be an overt act of
    relinquishment in perpetuity of all present and future rights to this
    software under copyright law.
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
    EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
    IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
    OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
    ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
    OTHER DEALINGS IN THE SOFTWARE.
    For more information, please refer to <http://unlicense.org/>
]]

do
    ix.char.RegisterVar("saturation", {
        field = "saturation",
        fieldType = ix.type.number,
        isLocal = true,
        bNoDisplay = true,
        default = 60
    })

    ix.char.RegisterVar("satiety", {
        field = "satiety",
        fieldType = ix.type.number,
        isLocal = true,
        bNoDisplay = true,
        default = 60
    })
end

ix.util.Include("sv_hooks.lua", "server")
ix.util.Include("sh_meta.lua", "shared")
ix.util.Include("sh_config.lua", "shared")
ix.util.Include("sh_commands.lua", "shared")
ix.util.Include("cl_bars.lua", "client")

local extendedfood = {
	["water"] = {
		["name"] = "Water Can",
		["model"] = "models/props_junk/PopCan01a.mdl",
		["desc"] = "Water Can.",
		["width"] = 1,
		["height"] = 2,
		
		["useSound"] = "ambient/weather/rain_drip2.wav", -- use sounds, open sound menu in console 'SoundMenu_Open'
		["RestoreSaturation"] = 10, -- thirst
		["RestoreSatiety"] = 0, -- hunger
		["RemainingDefault"] = 3 -- uses (thirst/hunger will be halfed by this number e.g. 2 % 10 = 5 thirst/hunger each use)
	},
}

for k, v in pairs(extendedfood) do
	local ITEM = ix.item.Register(k, "base_foods", false, nil, true)
	ITEM.name = v.name or "An Undefined Name, please configue drift-needings/sh_plugins.lua in the plugins folder."
	ITEM.description = v.desc or "An Undefined Description, please configue drift-needings/sh_plugins.lua in the plugins folder."
	ITEM.model = v.model or "models/hunter/plates/plate025x025.mdl"
	ITEM.width = v.width or 1
	ITEM.height = v.height or 1
	ITEM.price = v.price or 10
	ITEM.category = "Food Items"
	ITEM.noBusiness = true
	
	ITEM.base = "base_foods"
	
	ITEM.useSound = v.useSound or "npc/barnacle/barnacle_crunch3.wav"
	ITEM.RestoreSaturation = v.RestoreSaturation or 10
	ITEM.RestoreSatiety = v.RestoreSatiety or 10
	ITEM.RemainingDefault = v.RemainingDefault or 2

	function ITEM:GetDescription()
		return self.description
	end
end