class CD_ProgrammableSetting_BossFP extends CD_ProgrammableSetting
	within CD_Survival;

protected function string ReadIndicator()
{
	return Outer.BossFP;
}

protected function WriteIndicator( const out string Ind )
{
	Outer.BossFP = Ind;
}

protected function float ReadValue()
{
	return float(Outer.BossFPInt);
}

protected function WriteValue( const out float Val )
{
	Outer.BossFPInt = int(Val);
}

protected function string PrettyValue( const float RawValue )
{
	return string(int(RawValue));
}

defaultproperties
{
	IniDefsArrayName="BossFPDefs"
	OptionName="BossFP"
	DefaultSettingValue=0
	MinSettingValue=0
	MaxSettingValue=32

	ChatCommandNames=("!cdbossfp")
	ChatWriteParamHintFragment="int"
}
