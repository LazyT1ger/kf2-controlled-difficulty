class CD_BasicSetting_EnableReadySystem extends CD_BasicSetting
	within CD_Survival;

protected function string ReadIndicator()
{
	return Outer.EnableReadySystem;
}

protected function WriteIndicator( const out string Val )
{
	Outer.EnableReadySystem = Val;
	Outer.bEnableReadySystem = bool( Val );
}

protected function string SanitizeIndicator( const string Raw )
{
	return string( bool( Raw ) );
}

defaultproperties
{
	OptionName="EnableReadySystem"
	DefaultSettingIndicator="true"

	ChatCommandNames=("!cdEnableReadySystem", "!cders")
	ChatWriteParamHints=("true|false")
}
