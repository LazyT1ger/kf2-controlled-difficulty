class CD_BasicSetting_UseReadySystem extends CD_BasicSetting
	within CD_Survival;

protected function string ReadIndicator()
{
	return Outer.UseReadySystem;
}

protected function WriteIndicator( const out string Val )
{
	Outer.UseReadySystem = Val;
	Outer.bUseReadySystem = bool( Val );
}

protected function string SanitizeIndicator( const string Raw )
{
	return string( bool( Raw ) );
}

defaultproperties
{
	OptionName="UseReadySystem"
	DefaultSettingIndicator="true"

	ChatCommandNames=("!cdusereadysystem", "!cdurs")
	ChatWriteParamHints=("true|false")
}
