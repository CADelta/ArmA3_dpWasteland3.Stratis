//	@file Name: initSurvival.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, TAW_Tonic (original), AimZ =(dp)=, [CAD] Krycek

diag_log format["*** initSurvival Started ***"];

while {true} do
{
	sleep 1;
	while {format ["%1", player getVariable "BTC_need_revive"] == "1"} do
	{
	    sleep 10;
	};
	_thirstLevel = player getVariable "thirst";
	_hungerLevel = player getVariable "hunger";

	_thirstLevel = _thirstLevel - 0.035;			//CAD - (0.02)
	if (_thirstLevel < 5) then {_thirstLevel = 0};
	player setVariable["thirst", _thirstLevel, true];

	switch (true) do
	{
		case (_thirstLevel <= 10 && _thirstLevel >= 5): {hint parseText format["<t size='2' color='#ff0000'>Warning</t><br/><br/>You are now suffering from severe dehydration find something to drink quickly!", _thirstLevel];};
		/*case (_thirstLevel <= 20 && _thirstLevel >= 15): {hintSilent parseText format["<t size='2' color='#ff0000'>Warning</t><br/><br/>You haven't drank anything in along time, you should find something to drink soon or you'll start to die from dehydration!", _thirstLevel];};
		case (_thirstLevel <= 30 && _thirstLevel >= 25): {hintSilent format["You haven't drank anything in awhile, your thirst level is %1\n\nYou should find something to drink soon.", _thirstLevel];};
		case (_thirstLevel <= 50 && _thirstLevel >= 45): {hintSilent format["You haven't drank anything in awhile, your thirst level is %1", _thirstLevel];};*/
	};

	_hungerLevel = _hungerLevel - 0.025;		//CAD - (0.015)
	if (_hungerLevel < 5) then {_hungerLevel = 0};
	player setVariable["hunger",_hungerLevel,true];

	switch (true) do
	{
		case (_hungerLevel <= 10 && _hungerLevel >= 5): {hint parseText format["<t size='2' color='#ff0000'>Warning</t><br/><br/>You are now starving to death, you will slowly lose health, find something to eat quickly!", _hungerLevel];};
		/*case (_hungerLevel <= 20 && _hungerLevel >= 15): {hintSilent parseText format["<t size='2' color='#ff0000'>Warning</t><br/><br/>You are starting to starve, you need to find something to eat otherwise you will start to lose health!", _hungerLevel];};
		case (_hungerLevel <= 30 && _hungerLevel >= 25): {hintSilent format["You haven't eaten anything in awhile, your hunger level is currently: %1\n\n You should find something to eat soon!", _hungerLevel];};
		case (_hungerLevel <= 50 && _hungerLevel >= 45): {hintSilent format["You haven't eaten anything in awhile, your hunger level is currently: %1\n\n You should find something to eat soon!", _hungerLevel];};*/
	};

	if (_hungerLevel < 2 || _thirstLevel < 2) then
	{
		_damage = damage player;
		_damage = _damage + 0.01337;

		if (_damage > 0.9) then {_damage = 1.1337};
		player setDamage _damage;

		if (_hungerLevel < 2 && _thirstLevel < 2) then
		{
			hint parseText "<t size='2' color='#ff0000'>Warning</t><br/><br/>You are dying from starvation and dehydration.";
		}
		else
		{
			if (_hungerLevel < 2) then
			{
				hint parseText "<t size='2' color='#ff0000'>Warning</t><br/><br/>You are dying from starvation.";
			};
			if (_thirstLevel < 2) then
			{
				hint parseText "<t size='2' color='#ff0000'>Warning</t><br/><br/>You are dying from dehydration.";
			};
		};
	};
};

diag_log format["*** initSurvival Finished ***"];