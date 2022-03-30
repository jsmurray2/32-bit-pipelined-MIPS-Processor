set_global_assignment -entity "pllphaseshift" -library "lib_pllphaseshift" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "pllphaseshift" -library "lib_pllphaseshift" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "pllphaseshift" -library "lib_pllphaseshift" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_pllphaseshift" -name SPD_FILE [file join $::quartus(sip_path) "pllphaseshift.spd"]

set_global_assignment -library "lib_pllphaseshift" -name MISC_FILE [file join $::quartus(sip_path) "pllphaseshift_sim/pllphaseshift.vho"]
