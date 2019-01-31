#include <sourcemod>

#pragma semicolon 1
#pragma newdecls required

public Plugin myinfo = 
{
    name = "Map Checker",
    author = "B3none",
    description = "Change to random map if the map is currently in a prohibited list.",
    version = "1.0.0",
    url = "https://github.com/b3none"
};

static const char s_WhitelistedMaps[][] =
{
	"de_dust2",
	"de_mirage",
	"de_overpass",
	"de_cbble",
	"de_cache",
	"de_train",
	"de_inferno"
};

static const char s_BlacklistedMaps[][] =
{
	"de_dust",
	"de_nuke",
	"de_aztec"
}; 


public void OnMapStart()
{
	CreateTimer(5.0, CheckMap);
}

public Action CheckMap(Handle timer)
{
	char map[32];
	GetCurrentMap(map, sizeof(map));
	
	for(int i = 0; i < sizeof(s_BlacklistedMaps); i++)
	{
		if(StrEqual(map, s_BlacklistedMaps[i], false))
		{
			ServerCommand("map %s", s_WhitelistedMaps[GetRandomInt(0, 6)]);
		}
	}
}
