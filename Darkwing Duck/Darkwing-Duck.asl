
state("mesen", "0.9.8.0")
{
	byte level:       "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0xD9;
	byte boss_hp:     "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0xEE;
	byte music:       "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x410;
}

state("mesen", "0.9.9.0")
{
	byte level:       "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0xD9;
	byte boss_hp:     "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0xEE;
	byte music:       "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x410;
}

state("fceux", "2.2.3")
{
	byte level:       0x3B1388, 0x00D9;
	byte boss_hp:     0x3B1388, 0x00EE;
	byte music:       0x3B1388, 0x0410;
}

state("nestopia", "1.40")
{
	byte level:      "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x141;
	byte boss_hp:    "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x156;
	byte music:      "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x478;
}

init
{
	version = modules.First().FileVersionInfo.FileVersion;
}

startup
{
	settings.Add("boss_before", false, "Split before boss fight");
	settings.Add("boss_delim", false, "-- CHECK ONLY ONE OF:");
	settings.Add("boss_die", false, " - Split on boss die");
	settings.Add("boss_music", false, " - Split on stop music");
	settings.Add("boss_black", true, " - Split on black screen after boss");
}

reset
{
	return (current.level == 240 && old.level == 240);
}

split
{	

	if (current.level == 15 && old.level == 10) {
		vars.last_boss = true;
	}

	if (settings["boss_before"] && current.level == 15 && old.level >= 4 && old.level <= 10) {
		return true;
	}	

	if (settings["boss_die"]) {
		if (current.level == 15 && current.boss_hp >= 16 && old.boss_hp < 16) return true;
	} 

	if (settings["boss_music"]) {
		if (current.level == 2 && current.boss_hp >= 16 && current.music == 43 && old.music == 42) return true;
	} 

	if (settings["boss_black"]) {
		if (current.level == 3 && old.level == 2) return true;
	}

	if (vars.last_boss && current.boss_hp >= 16 && old.boss_hp < 16) return true;

}

start
{
	if (current.level == 1 && old.level == 242) {
		vars.last_boss = false;
		return true;
	}
}
