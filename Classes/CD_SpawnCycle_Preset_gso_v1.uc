class CD_SpawnCycle_Preset_gso_v1
	extends CD_SpawnCycle_PresetBase
	implements (CD_SpawnCycle_Preset);

function GetShortSpawnCycleDefs( out array<string> sink )
{
	sink.length = 0;
}

function GetNormalSpawnCycleDefs( out array<string> sink )
{
	sink.length = 0;
}

function GetLongSpawnCycleDefs( out array<string> sink )
{
	local int i;

	i = 0;

	sink.length = 0;
	sink.length = 10;

	// Wave 01 - Simple stuff
	sink[i++] = "4CC,2CR_2CC,2CA_2GF,3CS,4CC_1BL,1CR_3GF*,2CA_1CS,4CC_1SI,2CA_2GF*,4CC_1BL,3CA_1CS,3CC_3CR,1HU,3CC_1CA*_2GF,6CS,4CC_1BL,2CA_4CC,1SI_3CC_1CA*_1GF,4CC_1BL,3CA_1CS,4CC,3CR_1HU";
	
	// Wave 02 - Scrakes start spawning
	sink[i++] = "4CR,3CA_1BL,2CS_3CR_1GF,4ST_1HU,2CC_1GF*,1SI_1BL,2SC,2CS_2GF,2CC_1CA,2CR_2GF*,4ST_2SI,1HU_2CR,1SC_2GF,1SC,3CR_3CC,1SI_1BL,2CA_2CC,2CS_3CR,2GF_2CR,2CC_1GF,2CS_2GF,2CC_1CA,2CR_2ST,1SI_1HU,4ST_2GF,4CR,2SC_1BL,2CA_2CS,3CR_1GF,4ST,1CA_2CC_1GF,1SI_1BL,2CS_2GF,2CC_1CA,2CR_2GF,3ST_1SI,3GF_1BL_2SC,3CR_1HU,4CC_1SI,2CA_2CS,3CR_1GF,3CC_1GF_1SI_1HU,2CS_2GF,3CC_1CA,2CR_2GF_4ST";
	
	// Wave 03 - Fleshpounds start spawning
	sink[i++] = "4CR,3CA_1BL,2CS_3CR_1GF,4ST_1HU,2CC_1GF*,1SI_1BL,3FP_1SC,3CC_1BL,2CA_2GF_1BL,1SC,1CA_3CR_1GF,1SC_1HU,1SI_1BL,2CA_2CC,2CS_3CR,2GF_2CR,2CC_1GF,2CS_2GF,2CC_1CA,2CR_2ST,1SI_1HU,4SC_2GF*,4CR,2SC,1BL,2CA,2CS,3CR,1GF,4ST,1FP_2CC_1GF,1SI,1BL,2CS,2GF,2CC_1CA,2CR_2GF,3ST_1SI,3GF_1BL_2SC,3CR_1HU,4CC_1SI,2CA_2CS,3CR_1GF,3CC_1GF_1SI_1HU,2CS_2GF,3CC_1CA,2CR_2GF_4ST";
	
	// Wave 04 - modified DTF wave 8
	sink[i++] = "1CS_2CA_1GF,2SC,4CR,1HU,2SI_1CS_2GF,2CA,3FP_1SC,3CC_1BL,2CA_2GF_1BL,1SC,1CA_3CR_1GF*,1SC_1HU,2CS_2CR_2GF_1SI,3CA_1CS,3ST,3CC,2CC_2GF,1SC,1BL_2SI,4CR_2FP,2GF_1CS,2CC_1CA_1GF,1SC_1HU,2CS_3GF,2CC_1CR_2ST_1BL_1SI,3GF_3CC,2SC_1FP";
	
	// Wave 05 - modified DTF wave 9
	sink[i++] = "1CS_2CA_1GF,2SC,4CR,1HU,2SI_1CS_2GF,2CA,3FP_2SC,3CC_1BL,2CA_2GF*_1BL,1SC,1CA_3CR_1GF,1SC_1HU,2CS_2CR_2GF_1SI,3CA_1CS,3ST,3CC,2FP,2CC_2GF,2SC,1BL_2SI,4CR,2GF_1CS,2CC_1CA_1GF,1SC_2HU,2CS_3GF,2CC_1CR_2ST_1BL_1SI,4GF,2SC_2FP";
	
	// Wave 06 - modified DTF wave 10
	sink[i++] = "1CS_2CA_1GF,3SC,4CR,2BL_1HU,2HU,2SI_1CS_2GF,2CA,4FP_2SC,3CC_1BL,2CA_2GF,2BL_2SC,1CA_3CR_1GF,2SC_2HU,2CS_2CR,2GF_2SI,3CA_1CS,3ST,3CC,2CC_2GF,3FP_2SC,1BL_2SI,4CR,2GF_1CS,2CC_1CA_1GF,2SC_2HU,2CS_3GF,2CC_1CR_2ST,1BL_2SI,2GF_2GF*,2FP";
	
	// Wave 07 - MiniFPs start spawning from here on out
	sink[i++] = "6MFP_2FP_2CA,4SC,4BL,4BL_2HU,4HU,2SI,2CS,2GF,2GF*,6MFP,2FP,4FP,2SC,3CC,1BL,2CA,2GF,2BL,2SC,1CA,3CR,1GF,2SC,2HU,2CS,2CR,2GF,2SI,3CA,1CS,3ST,3CC,2CC,2GF,3FP,2SC,1BL,2SI,4MFP,2GF,1CS,2CC,1CA,1GF,2MFP,2SC,2CS,3GF,2CC,1CR,2ST,1MFP,2SC,4GF,3FP";
	
	// Wave 08 - some squads spawn raged
	sink[i++] = "6MFP_2FP_2FP!,6ST_4CA,4BL,2HU,4SC,6CR,2BL,2HU,2SI,1CS,2GF,6MFP_2FP,2CA,4FP,2SC,3CC,1BL,2GF_2GF*,2BL,2SC,1CA,3CR,1GF*,4SC,4HU,2CS,2CR,2GF,2SI,3CA,1CS,3ST,3CC,2CC,2GF,3FP,2SC,3BL,2SI,4MFP,2GF,1CS,2CC,1CA,1GF,2SC,2HU,2CS,3GF,2CC,1CR,2ST,1BL,2SI,4GF,1SC,4FP";
	
	// Wave 09 - more larges and reduced trash
	sink[i++] = "6MFP_4FP!,6ST_4CA,4MFP,2HU,6SC,4CR,6ST,2HU,2SI,1CS,2GF,6MFP,2FP,2CA,4FP,2SC,3CC,1BL,2BL,2SC,1CA,3CR,1GF,4SC,4MFP,2HU,2CS,2CR,2GF,2SI,3ST,2CS,4HU,4ST,2CC,2GF,3FP,2SC,1BL_2SI,4MFP,2GF,1CS,2CC,1CA,1GF,4MFP,2FP,2SC,2HU,2CS,3GF,2CC,1CR,2ST,1BL,2SI,4GF,2SC,4FP";
	
	// Wave 10 - Significantly reduced trash, significantly increased larges, significantly increased occurance of spawnrage
	sink[i++] = "6MFP!_2FP_2FP!,4SC_4MFP!_2FP!,4FP_2SC,4FP_4MFP,8MFP_2SC,4FP!,2HU,1CA,2FP!_2SC,4MFP_2SC,2GF_2SC,4HU,6MFP_2FP!,6MFP_2FP,10ST,3GF*_2SC_4HU,2CC_2GF,3FP_2SC,1BL_2SI,4CR,2GF_1CS,1CA_1GF,2SC_8ST,2HU,4SC,4MFP_2FP,2FP,4BL_2HU_4MFP,3SC_4FP,6MFP_2FP";
}

function string GetDate()
{
	return "2018-02-04";
}

function string GetAuthor()
{
	return "Tiger";
}