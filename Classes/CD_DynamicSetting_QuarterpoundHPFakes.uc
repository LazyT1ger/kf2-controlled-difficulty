class CD_DynamicSetting_QuarterpoundHPFakes extends CD_DynamicSetting
	within CD_Survival;

protected function string ReadIndicator()
{
	return Outer.QuarterpoundHPFakes;
}

protected function WriteIndicator( const out string Ind )
{
	Outer.QuarterpoundHPFakes = Ind;
}

protected function float ReadValue()
{
	return float(Outer.QuarterpoundHPFakesInt);
}

protected function WriteValue( const out float Val )
{
	Outer.QuarterpoundHPFakesInt = Round(Val);
}

protected function string PrettyValue( const float RawValue )
{
	return string(Round(RawValue));
}

defaultproperties
{
	IniDefsArrayName="QuarterpoundHPFakesDefs"
	OptionName="QuarterpoundHPFakes"
	DefaultSettingValue=0
	MinSettingValue=0
	MaxSettingValue=32

	ChatCommandNames=("!cdquarterpoundhpfakes","!cdqphpf")
	ChatWriteParamHintFragment="int"
}
