
state("mesen", "0.9.8.0")
{
    byte left:             "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x7B;
    byte control:          "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0xA4;
    byte location:         "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x99;
    byte locks:            "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x8D;
    byte control2:         "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0xD6;
    sbyte boss_hp:         "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x5D2;
    sbyte final_boss_hp:   "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x5D3;
}

state("mesen", "0.9.9.0")
{
    byte left:             "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x7B;
    byte control:          "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0xA4;
    byte location:         "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x99;
    byte locks:            "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x8D;
    byte control2:         "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0xD6;
    sbyte boss_hp:         "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x5D2;
    sbyte final_boss_hp:   "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x5D3;
}

state("fceux", "2.2.3")
{
    byte left:               0x3B1388, 0x007B;
    byte control:            0x3B1388, 0x00A4;
    byte location:           0x3B1388, 0x0099;
    byte locks:              0x3B1388, 0x008D;
    byte control2:           0x3B1388, 0x00D6;
    sbyte boss_hp:           0x3B1388, 0x05D2;
    sbyte final_boss_hp:     0x3B1388, 0x05D3;
}

state("nestopia", "1.40")
{
    byte left:             "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0xE3;
    byte control:          "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x10C;
    byte location:         "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x101;
    byte locks:            "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0xF5;
    byte control2:         "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x13E;
    sbyte boss_hp:         "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x63A;
    sbyte final_boss_hp:   "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x63B;
}

init
{
	version = modules.First().FileVersionInfo.FileVersion;
}

reset
{
    return (current.location == 0 && current.locks == 0 && current.control == 0);
}

start
{
    return (current.location == 0 && current.locks == 6 && current.control == 3);
}

split
{
    if (current.location == 0 && current.locks == 0 && old.locks == 1) return true;
    if (current.location == 5 && current.locks == 0 && old.locks == 1) return true;
    if (current.location == 9 && current.locks == 0 && old.locks == 1) return true;
    if (current.location == 11 && current.locks == 0 && old.locks == 1) return true;
    if (current.location == 15 && current.locks == 0 && old.locks == 1) return true;
    if (current.location == 19 && current.locks == 0 && old.locks == 1) return true;
    if (current.location == 21 && current.locks == 0 && old.locks == 1) return true;
    if (current.location == 25 && current.left == 9 && current.boss_hp <= 0 && current.control2 == 0 && old.control2 == 3) return true;
    if (current.location == 28 && current.left == 8 && current.boss_hp <= 0 && current.control2 == 0 && old.control2 == 3) return true;
    if (current.location == 31 && current.left == 13 && current.final_boss_hp <= 0 && current.control2 == 0 && old.control2 == 3) return true;
}
