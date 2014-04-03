//	@file Version: 1.0
//	@file Name: getPublicVar.sqf
//	@file Author: AgentRev
//  @file Usage: Territory System

private ["_varName", "_defaultValue", "_varValue"];
_varName = _this select 0;
_defaultValue = _this select 1;

_varValue = missionNamespace getVariable [_varName, _defaultValue];

if (typeName _varValue == "CODE") then
{
	call _varValue
}
else
{
	_varValue
};
