/*
/ Code written by B3none http://steamcommunity.com/profiles/76561198028510846
*/

#include <sourcemod>
#include <sdktools>
#pragma newdecls required

#define TAG_MESSAGE "[\x0CB3none_MapChecker\x01]"

public Plugin myinfo = 
{
    name =            "Map Checker",
    author =          "B3none",
    description =     "Changes map if it is de_dust.",
    version =         "0.0.1",
    url =             "www.voidrealitygaming.co.uk"
};

static const char s_MapList[][] =
{
	"de_dust2",
	"de_mirage",
	"de_overpass",
	"de_cbble",
	"de_cache",
	"de_train",
	"de_inferno"
}; 

public void OnMapStart()
{
	CreateTimer(5.0, CheckMap);
}

public Action CheckMap(Handle timer)
{
	char map[32];
	GetCurrentMap(map, sizeof(map));
	
	if(StrEqual(map, "de_dust", false) || StrEqual(map, "de_nuke", false) || StrEqual(map, "de_aztec", false))
	{
		PrintToChatAll("%s Eek! This is %s, the map will be changed!", TAG_MESSAGE, map);
		ServerCommand("map %s", s_MapList[GetRandomInt(0, 6)]);
	}
	
	else
	{
		PrintToChatAll("%s This map is %s, enjoy the game!", TAG_MESSAGE, map);
	}
}
