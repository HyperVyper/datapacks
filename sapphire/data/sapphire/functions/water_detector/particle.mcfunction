#kill too many SU-entities
execute at @s[tag=metroite.placement] run fill ~ ~ ~ ~ ~ ~ minecraft:observer[facing=up] replace minecraft:observer
execute at @s[tag=metroite.placement] run summon minecraft:armor_stand ~ ~0.5 ~ {Fire:32767s,Invulnerable:1b,Invisible:1b,NoGravity:1b,Tags:["sp.wd.fire"],Small:1b}
execute as @s[tag=metroite.placement] run kill @e[tag=metroite.placement,distance=0.5..3]
#cleanup
execute unless block ~ ~ ~ minecraft:observer[facing=up] run function sapphire:water_detector/cleanup
#effects
execute at @s[tag=!metroite.placement] if block ~ ~ ~ minecraft:observer[facing=up,powered=false] if entity @e[tag=sp.wd.fire,distance=..0.5,nbt={Fire:0s}] run fill ~ ~ ~ ~ ~ ~ minecraft:observer[facing=up,powered=true]
execute at @s[tag=!metroite.placement] if block ~ ~ ~ minecraft:observer[facing=up,powered=true] unless entity @e[tag=sp.wd.fire,distance=..0.5,nbt={Fire:0s}] run fill ~ ~ ~ ~ ~ ~ minecraft:observer[facing=up,powered=false]
execute at @s[tag=!metroite.placement] if entity @e[tag=sp.wd.fire,distance=..0.5,nbt={Fire:0s}] run scoreboard players add @s sp.wd.detector 1
execute at @s[tag=!metroite.placement] unless entity @e[tag=sp.wd.fire,distance=..0.5,nbt={Fire:0s}] run scoreboard players set @s sp.wd.detector 0
execute at @s[tag=!metroite.placement] if entity @e[tag=sp.wd.fire,distance=..0.5,nbt={Fire:0s}] run particle minecraft:dust 0.25 0.1 1 1.25 ~ ~0.5 ~ 0.3 0.3 0.3 0.05 1
execute at @s[tag=!metroite.placement,scores={sp.wd.detector=100}] run kill @e[tag=sp.wd.fire,distance=..0.5,nbt={Fire:0s}]
execute at @s[tag=!metroite.placement,scores={sp.wd.detector=100}] run summon minecraft:armor_stand ~ ~0.5 ~ {Fire:32767s,Invulnerable:1b,Invisible:1b,NoGravity:1b,Tags:["sp.wd.fire"],Small:1b}
execute at @s[tag=!metroite.placement,scores={sp.wd.detector=100}] run scoreboard players set @s sp.wd.detector 0
#remove setup
tag @s remove metroite.placement