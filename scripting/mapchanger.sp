/*
/ Code written by B3none http://steamcommunity.com/profiles/76561198028510846
*/

#include <sourcemod>
#include <sdktools>
#pragma newdecls required

public Plugin myinfo = 
{
    name =            "Map Checker",
    author =          "B3none",
    description =     "Changes map if it is de_dust.",
    version =         "0.0.1",
    url =             "www.voidrealitygaming.co.uk"
};

public void OnMapStart()
{
	char map[32];
	Format(map, sizeof(map), "%s", GetCurrentMap(map, sizeof(map)));
	
	if(StrEqual(map, "de_dust") || StrEqual(map, "de_aztec") || StrEqual(map, "de_nuke"))
	{
		PrintToChatAll("[\x0CB3none_MapChecker\x01] Eek! This is %s, the map will be changed!", map);
		ServerCommand("map de_mirage");
	}
}
