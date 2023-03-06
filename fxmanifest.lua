fx_version 'adamant'
game 'gta5'

lua54 'yes'

files {
	"html/index.html",
	"html/main.js",
	"html/style.css",
	"html/img/*.png"
}

ui_page 'html/index.html'

client_scripts {
	'@es_extended/imports.lua',
	"settings.lua",
	"client/cl_main.lua"
}

server_scripts {
	'@es_extended/imports.lua',
	"settings.lua",
	"@oxmysql/lib/MySQL.lua",
	"server/sv_main.lua"
}