Concentration Failsafe for Baldur's Gate 3
=======

https://github.com/ZerdBG3/CFS/assets/40004649/10e35497-fa54-4781-9e61-1e21b464799f

# Requirements
* This mod requires Norbyte's [BG3 Script Extender](https://github.com/Norbyte/bg3se/releases). You can install it following the instructions on its page, or install through Laughing Leader's [Mod Manager](https://github.com/LaughingLeader/BG3ModManager)

![](https://github.com/ZerdBG3/RAW/assets/40004649/cd17077f-d8da-48e9-ba20-d258266e6367)

# Discord

[![Discord Banner 4](https://discordapp.com/api/guilds/767878527634243624/widget.png?style=banner2)](https://discord.gg/FFKTbzKktj)

# Description

* Provides a toggleable passive for players that prevents casting spells that requires Concentration while concentrating in another spell.
* Toggle it off or manually stop the concentration (clicking the `X` below the portrait) to cast another concentration spell.
* Given the implementation, spells that are concentration but don't give the caster a status might result in the concentration spells being blocked even so the caster ended concentration manually (or timeout). Basically taking any action (even moving) will remove the blockage, but if nothing works, just untoggle the passive to remove the blockage.

# Compatibility

* If you're using [Zerd's Rules As Written](https://github.com/ZerdBG3/RAW), there's no need to use this mod, since `RAW` already has an option for this same feature (⚙️ `concentration_failsafe`)
* The mod adds the passive to all hero characters through the Script Extender. There is no preferred position on the load order, since it doesn't overwrite any base game entries
