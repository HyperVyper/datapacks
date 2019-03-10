#make sure every player has a score in wop.extend
execute as @a[limit=1,sort=random] unless score @s wop.extend >= 0 wop.extend run scoreboard players add @s wop.extend 0
#data merge @e item
execute at @a as @e[type=minecraft:item,distance=..4,nbt=!{Item:{tag:{wopdone:1b}}}] run function worseoldpvp:wopdone
#effects when holding wopdone in mainhand
execute as @a[nbt={SelectedItem:{tag:{wopdone:1b}}}] at @s run function worseoldpvp:selected
scoreboard players set @a wop.usecarrot 0
scoreboard players remove @a[scores={wop.extend=1..}] wop.extend 1
#remove the carrot_on_a_sticks
clear @a[nbt=!{SelectedItem:{tag:{wopsword:1b}}}] minecraft:carrot_on_a_stick{wopcarrot:1b}
kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:carrot_on_a_stick",tag:{wopcarrot:1b}}}]
#pigs should get their AI back
execute as @e[type=minecraft:pig,tag=wop.noai] at @s run function worseoldpvp:pigs/ai
