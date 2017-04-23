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
	
	if(StrEqual(map, "de_dust"))
	{
		ServerCommand("map de_mirage");
	}
}
