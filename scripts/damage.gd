extends Control
@onready var crit = get_parent().get_node("top_layer/CRIT") 
@onready var player = get_parent().get_node("Cast/Player/Player_sprite")
@onready var enemy = get_parent().get_node("Cast/Enemy/Enemy_sprite")
var opp
signal Damage(damage,Entity,text,type_eff)
var Type = types.new()
var Mover = Movos.new()
func Attack(Move, Entity, Stats, OStats):
	if Entity == "Player": opp = "Enemy"
	else : opp = "Player"
	print(Mover.movs)
	var mov = Mover.movs[Move]
	var type_effectiveness = getMultiplier(mov.type,OStats.type)
	var stab = 1
	if Stats.type == OStats.type: stab = 1.5
	var crit_chance = 6.25
	if mov.c !=null: crit_chance = 12.5
	var hit_chance = randi() % 100 + 1 
	if hit_chance > mov.accuracy:
		return 0
	var crit_roll = randi() % 100 + 1  # Random number between 1 and 100
	var is_critical = crit_roll <= crit_chance
	var random_number = randi() % 16 + 85
	var base_damage = ((2 * Stats.level / 5 + 2) * Stats.atk * mov.power / OStats.def) / 50 + 2
	var adjusted_damage = base_damage * stab * type_effectiveness
	var final_damage = adjusted_damage * random_number / 100
	if is_critical: 
		final_damage = final_damage * 2
		crito()
	Damage.emit(max(int(final_damage), 1),Entity,opp+mov.text,type_effectiveness)

func getMultiplier(Move_type,Entity_type):
	if Move_type in Type.typx and Entity_type in Type.typx[Move_type]:
		return Type.typx[Move_type][Entity_type]
	else:
		return 1
func crito():
	var pos
	if opp == "Player": pos = player.global_position
	else: pos = enemy.global_position
	crit.position = pos
	crit.emitting = true