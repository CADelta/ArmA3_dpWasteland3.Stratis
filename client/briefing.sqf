diag_log format["*** briefing Started ***"];

player createDiarySubject ["changelog", "ChangeLog"];
player createDiarySubject ["rules", "Rules"];
player createDiarySubject ["gameplayhelp", "Gameplay / Help"];
player createDiarySubject ["website", "Website & TS3"];
player createDiarySubject ["credit", "Credit"];

player createDiaryRecord["changelog",
["404Games","
<br/>1.06<br/>
		[Fixed] Fix to make Ammo boxes moveable.(thanks to meat147).<br/>
		[Fixed] missing disabled color for money input error.(thanks to Sanjo).<br/>
		[Fixed] NV Goggles in cars and boxes.(thanks to Sanjo).<br/>
<br/>1.05<br/>
		[Added] Uniforms,Hats and Vests to the gunstore.<br/>
		[Added] Players now spawn with a backpack.<br/>
		[Fixed] Not able to get weapons out of vehicle.<br/>
		[Fixed] R3F Loading into vehicles.<br/>
		[Fixed] Gunstore locations so they cant be ran down by vehicles.<br/>
		[Fixed] Health Icon.<br/>
		[Fixed] Static helicopter spawning and no more explosions.<br/>
		[Fixed] Weapon crates can now be loaded into vehicles.<br/>
<br/>1.03<br/>
		[Added] - Light Armed Vehicle Mission (All armed cars).<br/>
		[Removed] - All armed cars from initial spawn for balance.<br/>
<br/>1.02<br/>
		[Fixed] - Respawning Vehicles<br/>
		[Fixed] - Deserted Vehicles (20Mins)<br/>
<br/>1.01<br/>
		[Fixed] - Gun Stores<br/>
		[Fixed] - Missions<br/>
		[Fixed] - General UI<br/>
		[Fixed] - Lots of other fixes<br/>
"]];

player createDiaryRecord["changelog",
["=(dp)=","
<br/>2.4.4<br/>
		[Update] Relocated gun stores<br/>
		[Update] Added a third construction store<br/>
		[Update] Added base building items<br/>
		[Update] Removed broken uniform items<br/>
<br/>2.4.3<br/>
		[Update] Tweaks for the crashes... unknown outcome!<br/>
<br/>2.4.2<br/>
		[Fixed] Fixed money bug with UAV Backpacks.<br/>
		[Fixed] Removed ammo truck.<br/>
		[Fixed] Changed wording of the abandoned vehicle mission.<br/>
		[Update] Added website name.<br/>
<br/>2.4.1<br/>
		[Fixed] Changed scanner strength out of debug, now 5 percent chance for enemies.<br/>
		[Fixed] Client side indestructible buildings.<br/>
<br/>2.4<br/>
		[Update] Added new weapons and vehicles.<br/>
		[Update] Updated missions for new vehicles.<br/>
		[Fixes] Stopped map buildings from moved.<br/>
		[Fixes] Delay with tags showing on fresh spawns.<br/>
		[Investigating] Spawn with full loadout.<br/>
<br/>2.3<br/>
		[Update] Performance tweaks.<br/>
		[Update] Reset store guys.<br/>
		[Fixes] Fatigue whilst driving.<br/>
		[Fixes] Slowed down thirst and hunger.<br/>
		[Fixes] Fixed refueling of none local vehicles.<br/>
		[Fixes] Fixed repairing of none local vehicles.<br/>
<br/>2.2<br/>
		[Update] New base building objects.<br/>
		[Update] New fatigue system.<br/>
		[Fixes] Fixed Day Cycle selection.<br/>
		[Fixes] Fixed most animations.<br/>
		[Fixes] Fixed refueling vehicles.<br/>
		[Fixes] Fixed repairing vehicles.<br/>
		[Investigating] Sinking bodies...<br/>
<br/>2.1.1<br/>
		[Fixes] Updated scanner and time change.<br/>
<br/>2.1<br/>
		[Updates] Additional Admin features and new scanner.<br/>
<br/>2.0<br/>
		[Updates] Major updates on all scripts to improve performance.<br/>
<br/>1.6<br/>
		[Updates] Optimised spawn scripts.<br/>
<br/>1.5<br/>
		[Updates] Included new missions.<br/>
		[Updates] Changed the way vehicles desertion time works.<br/>
<br/>1.4<br/>
		[Updates] Updated the vehicle classes for beta version.<br/>
		[Updates] Changed weapons in some crates.<br/>
		[Updates] Created a random spawn for vehicles after destroyed.<br/>
<br/>1.3<br/>
		[Updates] Updated the weapon classes for beta version.<br/>
		[Updates] Changed some of the prices in general store.<br/>
<br/>1.2<br/>
		[Updates] Updated the vehicle classes for beta version.<br/>
<br/>1.1<br/>
		[Added] Clean up scripts to try keep server smoother.<br/>
		[Fixed] Updated load in issue with losing ammo and scopes.<br/>
		[Update] Lots of tweaks to spawning and types of objects.<br/>
		[Update] Changed lots of scripts to keep server running smooth without need for restarts every day.<br/>
		<br/>
<br/>1.0<br/>
		[Note] Added and modified lots of issues, some things might not be so obvious.<br/>
		<br/>
"]];

player createDiaryRecord["changelog",
["[CAD]","
<br/>3.0<br/>
		[Added] Revive System.<br/>
		[Added] Territory System.<br/>
		[Added] Day/Night cycle.<br/>
		[Added] IgiLoad Logistics System.<br/>
		[Added] Cargo Containers for more convenient storage and transport with R3F and IgiLoad Logistics Systems.<br/>
		[Added] New sound clip for the Scanner.<br/>
		[Added] New categories in the Stores.<br/>
		[Added] Two more Buildings to the Construction Store.<br/>
		[Added] Two new Planes (Wipeout and Neophron) and the new Tempest Trucks.<br/>
		[Added] Promote to leader in Group Management.<br/>
		[Added] New Player Menu GUI.<br/>
		[Added] New Artwork to the main HUD and some color changes.<br/>
		[Added] Two small towns.<br/>
		[Added] 12.7mm APDS Ammo to the Gun Store.<br/>
		[Added] Fuel-Feed to all the Gas Pumps.<br/>
		[Added] New super effective Cleanup system.<br/>
		[Added] Two new Mission Objectives categories.<br/>
		[Added] Ability to rotate objects 45, 90 and 180 degrees.<br/>
		[Added] Moderator ability too instantly remove all hacked in vehicles.<br/>
		[Added] New super effective Cleanup system.<br/>
		[Added] Overall major code optimizations and changes, should give better performance.<br/><br/>
		[Update] Removed fatigue system. You can now run forever without getting fatigued.<br/>
		[Update] New spawn area to prevent spawn-island killing.<br/>
		[Update] Players are now allowed on Xiros ('Spawn Island').<br/><br/>
		[Fixed] No more Dialog errors.<br/>
		[Fixed] Independent players no longer receive negative score for killing other Independent players.<br/>
		[Fixed] Jerry Can was reusable while refueling for extra effect.<br/>
		[Fixed] Syphon fuel now works as intended, no more getting a full Jerry Can from almost empty vehicles.<br/>
		[Fixed] Ammo Crates can no longer despawn while in vehicle content.<br/>
		[Fixed] Corpses (player) no longer despawn right under your nose.<br/>
		[Fixed] Non-burning vehicles no longer despawn right in front of you.<br/>
		[Fixed] Towed vehicles no longer despawn.<br/>
		[Fixed] Buildings and Crates loaded in vehicles now sync. for everyone.<br/>
<br/>2.5.5<br/>
		[Fixed] MX SW and MXM had switched names in the Gun Store.<br/>
		[Fixed] Briefing on the map screen got duplicated again and again after respawning.<br/>
		[Update] Prices on Grenades have been reduced a bit and Stone is now called Decoy Grenade (which it is).<br/>
<br/>2.5.4<br/>
		[Added] New Content Vehicles: FV-720 Mora (APC), MBT-52 Kuma (MBT) and WY-55 Hellcat (Armed and Unarmed Helis).<br/>
		[Added] New Content Weaponry: Black variants of all the MX Rifles, LRPS Sniper Optics and IR Hand Grenades.<br/>
		[Update] No more getting score for driving over AIs.<br/>
		[Update] Immobile Civilian Helicopter moved to Side Objective.<br/>
		[Update] Toned back the thirst and hunger speed 50%.<br/>
		[Fixed] Vehicles should no longer blow up as easily.<br/>
		[Fixed] Removed Show Chat, since the latest ArmA update seems to have fixed the chat again.<br/>
		[Fixed] Issues reported concerning scoring, should be fixed now.<br/>
		[Fixed] Immobile Armed Helicopter now only has Armed Helis.<br/>
		[Fixed] Money Glitch in the General Store.<br/>
		[Fixed] Server Addons moved to addons root directory. The Server should now show as green when browsing for servers.<br/>
		[Testing] Not same mission in row (Plz report if it still happens).<br/>
		[Confirmed] New AI Addon works perfectly. Now Firefights against AI will be more fair.<br/>
<br/>2.5.3<br/>
		[Fixed] You should now finally be able to Load stuff in vehicles again without a 'ghost' version stays behind to interact with.<br/>
		[Fixed] Forcing the briefing.sqf at a second stage, so you should now be able to read this changelog ingame.<br/>
		[Fixed] H-barrier Watchtower was not Load-In capable.<br/>
		[Added] 4th Gun Store south of Air Station Mike26.<br/>
		[Added] AI AT Soldiers now carry a Backpack and have two different RPG Rockets.<br/>
		[Testing] Change in the Cleanup Scripts to try and fix Load In vehicle glitch (Plz report any bugs and/or Issues).<br/>
		[Testing] Zeus AI Addon, which hopefully wont make the AIs so insane at aiming (Plz report any bugs and/or Issues).<br/>
		[Update] Starting loadout back to colored caps, belt, 9mm Pistol and yes a Backpack.<br/>
		[Update] Decrease in cost of simple structures from the Construction Store to encourage more base building.<br/>
		[Update] Removed the UAV Terminal again from starting loadout, but its now very cheap and so is the UAV itself.<br/>
		[Update] Slight price increase on the Zafir and 7.62 150rnd Ammo.<br/>
		[Update] Better crates now spawn at missions again.<br/>
		[Update] More speedboats, less Zodiacs and no SDVs.<br/>
		[Update] Removed A-143 Buzzard AA from the JET Mission.<br/>
		[Update] Doubled the scanner recharge time.<br/>
		[Update] Double the speed of thirst and hunger, so it becomes a survival issue again.<br/>
<br/>2.5.2<br/>
		[Fixed] Refuel jerry Can at Gas Station makes the Jerry Can disappear.<br/>
		[Added] The ability to buy a moveable Gas Pump from the Construction Store.<br/>
		[Added] Additional two small Gas Stations on the map.<br/>
		[Added] A new General Store and Construction Store to the middle of the map.<br/>
		[Added] Players now start with the UAV Terminal.<br/>
		[Added] Original Icons to the Logistic addon.<br/>
<br/>2.5.1<br/>
		[Update] Player starting gear. More Personal Armour, better Gun and no Backpack.<br/>
		[Update] Construction prices lower again. Now go build some awesome bases.<br/>
		[Fixed] Vehicle capacity should now be fixed, HEMTT Box is now able to carry most.<br/>
		[Fixed] Minor issue with the Moderator Panel.<br/>
		[Fixed] Tow distance should now be better. No more vehicles inside each other.<br/>
<br/>2.5<br/>
		[Removed] Quadbikes, Cars and Trucks for the Abandoned Vehicle Mission.<br/>
		[Update] New Convoy Route.<br/>
		[Update] Lower possibility for MRAP spawns.<br/>
		[Fixed] Ammo and Weapon-attachments disappearing after moving an object.<br/>
		[Fixed] Crates and Vehicles spawns. Now fewer Crates and Vehicles get instantly destroyed on spawn.<br/>
		[Fixed] H-barrier Watchtower added back in, since BIS have fixed it.<br/>
		[Added] Pictures for all Structures in the Construction Store (credit goes to: ot0_m0t0 for providing the pictures).<br/>
		[Added] Diver Goggles to the Gun Store, so you finally can see clearly underwater.<br/>
		[Added] New Mission: Jets added to the Primary Objective.<br/>
		[Added] New Mission: Armed Boats added to Side Objective.<br/>
		[Added] New random Boat (non-armed) spawns around Stratis coastline.<br/>
		[Added] Large Helis can now lift the Altis Cargo Tower.<br/>
		[Added] More abilities for Moderators to find and eliminate potential cheaters/hackers.<br/>
		[Added] Server Side code, which makes it near impossible for many kind of hacks.<br/>
<br/>2.4.5.5<br/>
		[Rollback] Version 2.4.6 rolled back a bit since there was a few issues. Stores and Spawns are now at their old position again.<br/>
		[Added] One new building from Altis have been added to test out. Go buy it at the Construction Store. OBS. Only largest vehicles can carry it.<br/>
		[Update] Convoy starting village also know as Abbyville, has been removed to decrease server strain and to fix convoy not getting stuck at its spawn area.<br/>
		[Update] Starting Sidearm changed back to Rook40.<br/>
		[Update] Price changes to better match given item. Some have been toned down a bit again.<br/>
		[Update] Vehicle Storage Capacity changed to better match what would be realistic for the given vehicle.<br/>
		[Update] Also Construction Objects carry size better match the given Object.<br/>
		[Update] Starting Backpack Camo changed to match the uniform a bit more.<br/>
		[Update] Most vehicles now spawn with very low fuel. Instead Players start with a full Jerry Can.<br/>
		[Removed] Running Vault Ability have been removed again, since it had a few issues.<br/>
<br/>2.4.5<br/>
		[Added] New Weapons, Optics, Uniforms and Vests.<br/>
		[Added] New Running Vault Ability (Use: Press C Key twice.<br/>
		[Fixed] Spawning in Underwear, on other players screen, should now be fixed.<br/>
		[Update] A lot of the Price Tags on Weapons, Gear and Construction have been changed.<br/>
		[Testing] Spawn with new Uniform (only Blufor) and Sidearm (Everyone).<br/>
"]];

player createDiaryRecord["rules",
["General Rules","
<br/>
Rule 1:<br/>
- Anyone caught running cheat scripts will be Banned (we share Ban-lists with other servers).<br/>
<br/>
Rule 2:<br/>
- Do not grief a fellow team mate by stealing loot from his kills. Punishment for doing so ranges from removal of weapons and/or cash, to being Slayed, Kicked or Banned.<br/>
<br/>
Rule 3:<br/>
- Do not intentionally Teamkill. Punishment for doing so ranges from removal of weapons and/or cash, to being Slayed, Kicked or Banned.<br/>
<br/>
Rule 4:<br/>
- Do not talk in global unless it is an emergency, type but do not talk! Shout (CAPS) only when its very important and you want an Admins attention. Failing to obey these rules will be warned, repeat offences will result in Kick and/or Ban.<br/>
<br/>
Rule 5:<br/>
- Do not spam any chat channel. Anyone doing so will be warned, repeat offences will result in Kick and/or Ban.<br/>
<br/>
Rule 6:<br/>
- Only talk and type English in Side and Global, if you want to use your native language then simply make a Group. Anyone not following this rule will be warned, repeat offences will result in Kick and/or Ban.<br/>
<br/>
Rule 7:<br/>
- Again do not grief or abuse team mates. Result will be Kick and/or Ban.<br/>
"]];

player createDiaryRecord["rules",
["Important","
<br/>
Be respectful to Admins and they will be the same.<br/>
Remember the Admins are gamers and want to game in the server too.<br/>
If you feel you have a valid reason to appeal a Ban you can get in touch with the Admin team by either registering on our website or stop by on our Public Teamspeak 3 Server.<br/>
<br/>
dp-clan.enjin.com<br/>
"]];

player createDiaryRecord["gameplayhelp",
["Game Play - Standard","
<br/>
Please register on our website at dp-clan.enjin.com and join dp Wasteland Community to find out what we are up to and what our future plans for the Servers are. Suggestions for future versions of dp Wasteland are always welcome<br/><br/>
General Game Play:<br/>
- Each player starts with the following in their player menu: 1 food, 1 water, 1 single use Medkit, 1 single use Repair kit and 1 full Jerry Can.<br/>
- Jerry cans can be filled at the gas station, the general stores, green oil barrels found around the island or by syphoning fuel from vehicles.<br/>
- Loot dead bodies for money and players gear. Items are no longer stored in the lame brown sack.<br/>
- To give someone an item you must stand close to them and use the player menu to give the selected item to the select player.<br/>
- The general store sells, food, water, single use Medkits and repair kits and fuel.<br/>
- There are usually 58 ground vehicles, 8 Helis, 12 ammo/weapons crates, 12 survival items (food sacks, water containers) in the game at any one time.<br/>
- Vehicles with mounted guns, wheeled APCs, tracked armour, armed Helis and extra ammo/weapons crates can be obtained by completing the regular in-game objectives.<br/>
- Only the lower powered guns can be found in vehicles. Higher powered guns and launchers can be found in ammo/weapons crates or bought at the Gun stores.<br/>
- Gun stores sell a full range of Weaponry and Ammo.<br/>
- To build a base buy items from the Construction Store make sure to leave space for the objects to spawn in, vehicles and sandbags dont mix well.<br/>
- The Scanner will detect the enemy and display their coloured tag above their head. This is only a 5% chance for a second. The scanner will also display team mates tags if the Admin has disabled them for a hardcore game.<br/>
"]];

player createDiaryRecord["gameplayhelp",
["Game Play - Hardcore","
<br/>
Hardcore Mode:<br/>
- The dp Wasteland mod allows the Admin to disable player tags and/or disable groups to give a harder more tactical game play (This has had good feedback apart for the odd troll).<br/>
- This is not difficult to understand or get use too, so please give it a go and dont whine.<br/>
- Tags are disabled for everyone, Blufor, Opfor and Independents. Use your scanner to identify players (sometimes the coloured cap are a decoy).<br/>
- Think before shooting, even with tags off excessive team killing can result in a Kick from the server.<br/>
- Try stay in cover and even talk over direct chat and engage with the other player.<br/>
- Remember Independents vs Independents so dont complain if everyone kills you, if groups are disabled they are disabled for everyone.<br/>
"]];

player createDiaryRecord["website",
["Community","
<br/>
dp-clan.enjin.com<br/>
<br/>
Feel free to register on our website and use the forum.<br/>
By request of several players we have added a donation module to the website.<br/>
"]];

player createDiaryRecord["website",
["Teamspeak 3 Server","
<br/>
144.76.96.181:9987<br/>
<br/>
Feel free to join our 512 slot public Teamspeak 3 server.<br/>
"]];

player createDiaryRecord["credit",
["Credits","
<br/>
	Credit due to the 404 Team who worked on the mod before I made my changes:<br/><br/>
	Deadbeat<br/>
	Costlyy<br/>
	Pulse<br/>
	Domuk<br/>
	Many others...<br/>
<br/>
	Credit due to whoever created the anti-hack used on most other mods...<br/>
<br/>
	Credit goes to Conroy and Terox for the Zeus AI Addon.<br/>
<br/>
	Credit to =(dp)= AimZ for providing the foundation for now the best Wasteland Mod around :D.<br/>
<br/>
	Much credit goes towards the guys working on A3 Wasteland. MercyfulFate and AgentRev thank you for continuing looking in on this mod from time to time. :)<br/>
<br/>
	Last, but diffentiently not least, a huge thanks to the ArmA 3 Community and especially the 'Arma Script Makers' Skype channel. You have been a great help keeping my hair attached to my head.<br/>
<br/>
	Best Regards,<br/>
	[CAD] Krycek<br/>
<br/>
"]];

diag_log format["*** briefing Finished ***"];
