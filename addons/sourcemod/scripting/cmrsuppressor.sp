#include <sourcemod>
#pragma newdecls required
#pragma semicolon 1

Address gA_PatchAddress;
int gI_PatchRestore[100];
int gI_PatchRestoreBytes;
GameData gd;

public Plugin myinfo =
{
	name = "CMultiplayRules Console Suppressor",
	author = "zer0.k",
	description = "Surpress CMultiplayRules constructor messages in console",
	version = "1.0",
	url = "https://github.com/zer0k-z/CMRSuppressor"
};


public void OnPluginStart()
{
	gd = LoadGameConfigFile("cmrsuppressor.games");

	PatchSetConVarDefaultValue();
}

public void OnPluginEnd()
{
	UnpatchSetConVarDefaultValue();
}

void PatchSetConVarDefaultValue()
{
	Address addr = GameConfGetAddress(gd, "ConVarSetDefaultValue");
	if (addr == Address_Null)
	{
		delete gd;
		SetFailState("Failed to find ConVarSetDefaultValue's address.");
	}

	int offset = GameConfGetOffset(gd, "ConVarSetDefaultValue");
	if (offset == -1)
	{
		delete gd;
		SetFailState("Failed to get offset for ConVarSetDefaultValue.");
	}
	addr += view_as<Address>(offset);
	gA_PatchAddress = addr;
	gI_PatchRestoreBytes = GameConfGetOffset(gd, "ConVarMsg");
	if (gI_PatchRestoreBytes == -1)
	{
		delete gd;
		SetFailState("Failed to get offset for ConVarSetDefaultValue.");
	}
	delete gd;

	for (int i = 0; i < gI_PatchRestoreBytes; i++)
	{
		gI_PatchRestore[i] = LoadFromAddress(addr, NumberType_Int8);

		StoreToAddress(addr, 0x90, NumberType_Int8);
		addr++;
	}
}

void UnpatchSetConVarDefaultValue()
{
	if (gA_PatchAddress != Address_Null)
	{
		for (int i = 0; i < gI_PatchRestoreBytes; i++)
		{
			StoreToAddress(gA_PatchAddress + view_as<Address>(i), gI_PatchRestore[i], NumberType_Int8);
		}
	}
}