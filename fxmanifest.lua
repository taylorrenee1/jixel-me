fx_version 'bodacious'
game 'gta5'
lua54 'yes'
ui_page "html/index.html"
author 'Taylor + Zero'

shared_scripts {
	'@ox_lib/init.lua',
	'config.lua'
}

client_scripts {
 'client.lua'
}

server_scripts {
 'server.lua'
}


files {
 'html/*',
}
