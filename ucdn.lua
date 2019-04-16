-- scaffold geniefile for ucdn

ucdn_script = path.getabsolute(path.getdirectory(_SCRIPT))
ucdn_root = path.join(ucdn_script, "ucdn")

ucdn_includedirs = {
	path.join(ucdn_script, "config"),
	ucdn_root,
}

ucdn_libdirs = {}
ucdn_links = {}
ucdn_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { ucdn_includedirs }
	end,

	_add_defines = function()
		defines { ucdn_defines }
	end,

	_add_libdirs = function()
		libdirs { ucdn_libdirs }
	end,

	_add_external_links = function()
		links { ucdn_links }
	end,

	_add_self_links = function()
		links { "ucdn" }
	end,

	_create_projects = function()

project "ucdn"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		ucdn_includedirs,
	}

	defines {}

	files {
		path.join(ucdn_script, "config", "**.h"),
		path.join(ucdn_root, "**.h"),
		path.join(ucdn_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
