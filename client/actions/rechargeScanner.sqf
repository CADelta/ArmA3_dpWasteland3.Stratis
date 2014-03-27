//  @file Name: rechargeScanner.sqf
//  @file Author: Aimz =(dp)=, [CAD] Krycek

scannerBattery = 100;
scanningInProgress = false;

while {true} do
{
	if (scannerBattery < 100 && !scanningInProgress) then
	{
		scannerBattery = scannerBattery + 2;
		if (scannerBattery > 100) then {scannerBattery = 100;};
	};
	sleep 4;
};