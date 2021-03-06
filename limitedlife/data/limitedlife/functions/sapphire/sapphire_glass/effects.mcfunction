#calling cleanup when sapphire_glass is destroyed
execute unless block ~ ~ ~ minecraft:light_blue_stained_glass run function limitedlife:sapphire/sapphire_glass/cleanup
scoreboard players set @a sp.glass_broken 0
#effects
execute if score _global_ sp.glass_placed = 10 sp.glass_placed if entity @s[tag=!metroite.placement] run particle minecraft:dust 0.25 0.1 1 1.25 ~ ~0.5 ~ 0.15 0.15 0.15 0.05 1
execute as @a[distance=..0.5,nbt={OnGround:0b}] at @s run tp @s ~ ~1.25 ~
execute as @a[distance=..0.5,nbt={OnGround:1b}] at @s run tp @s ^ ^ ^-1.25
#remove SU-tag
tag @s remove metroite.placement
