fx_version 'cerulean'

game "gta5"

author "K1anFromDK - Kstore"
version '0.0.1'

lua54 'yes'


ui_page 'html/index.html'
-- ui_page 'http://localhost:5173/' --for dev

client_script {
  --"lib/Proxy.lua", FJERN -- HVIS DU BRUGER VRP !!! BLIVER IKKE BRUGT LIGE PT
  --"lib/Tunnel.lua", FJERN -- HVIS DU BRUGER VRP !!! BLIVER IKKE BRUGT LIGE PT
  'client/**',
}
server_script {
  -- "@vrp/lib/utils.lua", FJERN -- HVIS DU BRUGER VRP !!! BLIVER IKKE BRUGT LIGE PT
  "server/**",
  }
shared_script {
  "shared/**",
  }

files {
  'html/**',
}
