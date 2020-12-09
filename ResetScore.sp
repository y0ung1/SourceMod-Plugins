#include <sourcemod>
#include <cstrike>
#include <multicolors>

#pragma newdecls required

public Plugin myinfo =
{
    name =     "Reset punktow",
    author =     "y0ung",
    version =     "1.0",
    url =     "feelthegame.eu"
};

public void OnMapStart()
{
    ServerCommand("mp_backup_round_file \"\"");
    ServerCommand("mp_backup_round_file_last \"\"");
    ServerCommand("mp_backup_round_file_pattern \"\"");
    ServerCommand("mp_backup_round_auto 0");
}

public void OnClientSayCommand_Post(int client, const char[] command, const char[] sArgs)
{
    if (client && (strcmp(sArgs[1], "reset", false) == 0 || strcmp(sArgs[1], "rs", false) == 0 || strcmp(sArgs[1], "resetscore") == 0))
    {
        if (GetClientDeaths(client) || CS_GetClientContributionScore(client))
        {
            CS_SetMVPCount(client, 0);
            CS_SetClientAssists(client, 0);
            SetEntProp(client, Prop_Data, "m_iFrags", 0);
            SetEntProp(client, Prop_Data, "m_iDeaths", 0);
            CS_SetClientContributionScore(client, 0);
            
            CPrintToChat(client, "{green}Twoje punkty zostały zresetowane");
        }
        else
        {
        	CPrintToChat(client, "{green}Masz już <b>0 punktów");
        }
    }
}