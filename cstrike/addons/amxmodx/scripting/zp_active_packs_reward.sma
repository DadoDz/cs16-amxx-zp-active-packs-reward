#include <amxmodx>
//#include <zombie_plague/zp_packs_system>

native zp_get_user_packs(index);
native zp_set_user_packs(index, packs);

#define PLUGIN "[ZP] Active Packs Reward"
#define VERSION "1.0"
#define AUTHOR "DadoDz"

#define REWARD_TIME 300.0
#define REWARD_PACKS 5

public plugin_init()
{
    register_plugin(PLUGIN, VERSION, AUTHOR);

    set_task(REWARD_TIME, "ActiveReward", _, _, _, "b")
}

public ActiveReward()
{
	for (new i = 1;  i <= get_maxplayers(); i++)
	{
		if (!is_user_connected(i)) 
			continue;

		zp_set_user_packs(i, zp_get_user_packs(i) + REWARD_PACKS);
		client_print_color(i, print_team_default, "^x04[^x01ZP^x04]^x01 Because you are^x03 active^x01 on the server, you got^x03 +%d packs^x01.", REWARD_PACKS);
	}
}
