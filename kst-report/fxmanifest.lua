fx_version 'cerulean'

game "gta5"

author "K1anFromDK - Kstore"
version '0.0.1'

lua54 'yes'


ui_page 'html/index.html'
-- ui_page 'http://localhost:5173/' --for dev

client_script {
  --"lib/Proxy.lua", FJERN -- HVIS DU BRUGER VRP !!!
  --"lib/Tunnel.lua", FJERN -- HVIS DU BRUGER VRP !!! 
  'client/**',
}
server_script {
  -- "@vrp/lib/utils.lua", FJERN -- HVIS DU BRUGER VRP !!! 
  "server/**",
  }
shared_script {
  "shared/**",
  }

files {
  'html/**',
}
