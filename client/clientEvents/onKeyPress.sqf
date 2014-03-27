//	@file Name: onKeyPress.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AimZ =(dp)=, [CAD] Krycek

private["_key", "_handled"];

_key     = _this select 1;
_handled = false;

switch _key do
{
    //U key
    case 22:
    {
		[] call checkCADmin;
		_handled = true;
    };

    //tilde ~ key
    case 41:
    {
        [] call loadPlayerMenu;
		_handled = true;
    };
};

_handled;