function data()
return {
	info = {
		minorVersion = 0,
		severityAdd = "NONE",
		severityRemove = "WARNING",
		name = _("mod_name"),
		description = _("mod_desc"),
		authors = {
		    {
		        name = "ModWerkstatt",
		        role = "CREATOR",
		    },
		    {
		        name = "Kaleut",
		        role = "CREATOR",
		    },
		},
		tags = { "europe", "deutschland", "germany", "schweiz", "db", "waggon", "goods", "Intermodal", },
		minGameVersion = 0,
		dependencies = { },
		url = { "" },
	  
		params = {
			{
				key = "sggmrs104fake",
				name = _("Fake_sggmrs104_wagen"),
				values = { "No", "Yes", },
				tooltip = _("option_fake_wagen_desc"),
				defaultIndex = 0,
			},	
        },
	},
	options = {
	},
	
	runFn = function (settings, modParams)
	local params = modParams[getCurrentModId()]

        local hidden = {
			["aae_fake.mdl"] = true,
			["db_fake.mdl"] = true,
			["db2_fake.mdl"] = true,
			["kombi_fake.mdl"] = true,
			["kombi2_fake.mdl"] = true,
        }

		local modelFilter = function(fileName, data)
			local modelName = fileName:match('/sggmrs104_([^/]*.mdl)')
			return (modelName==nil or hidden[modelName]~=true)
		end

        if modParams[getCurrentModId()] ~= nil then
			local params = modParams[getCurrentModId()]
			if params["sggmrs104fake"] == 0 then
				addFileFilter("model/vehicle", modelFilter)
			end
		else
			addFileFilter("model/vehicle", modelFilter)
		end
		
		addModifier( "loadModel", metadataHandler )
	end
	}
end
