fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'Kakarot'
description 'Core resource for the framework, contains all the core functionality and features'
version '2.0.0'

shared_scripts {
    '__init.lua',
    'config.lua',
    'core/utils/**/shared.lua',
}

client_scripts {
    'core/**/**/client.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'core/**/**/server.lua',
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/css/style.css',
    'html/css/drawtext.css',
    'html/js/*.js'
}

dependency 'oxmysql'