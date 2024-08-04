extends Control
@onready var res = get_parent().get_node("Move_layer/move")
@onready var Enemypos = get_parent().get_node("Cast/Enemy/Enemy_sprite")
@onready var Playerpos = get_parent().get_node("Cast/Player/Player_sprite")
func faint(entity):
	match entity:
		"Player":
			var tweene = get_tree().create_tween()
			var tween = get_tree().create_tween()
			var pos = Playerpos.global_position.y + .1
			tween.tween_property(Playerpos,"scale",Vector2(.1,.1),.5)
			tweene.tween_property(Playerpos,"position",Vector2(Playerpos.position.x,pos),5)
			await get_tree().create_timer(.5).timeout
			Playerpos.hide()
			await get_tree().create_timer(3).timeout
		"Swap":
			var tweene = get_tree().create_tween()
			var tween = get_tree().create_tween()
			var pos = Playerpos.global_position.y - .1
			Playerpos.show()
			tween.tween_property(Playerpos,"scale",Vector2(2,2),.5)
			tweene.tween_property(Playerpos,"position",Vector2(Playerpos.position.x,pos),5)
			await get_tree().create_timer(.5).timeout
			await get_tree().create_timer(3).timeout
		"Enemy":
			var tweene = get_tree().create_tween()
			var tween = get_tree().create_tween()
			var pos = Enemypos.position.y + .1
			tween.tween_property(Enemypos,"scale",Vector2(.1,.1),.5)
			tweene.tween_property(Enemypos,"position",Vector2(Enemypos.position.x,pos),5)
			await get_tree().create_timer(.5).timeout
			Enemypos.hide()
func Animation(entity, move):
	var target: Vector2 = Enemypos.global_position if entity == "Player" else Playerpos.global_position
	var source: Vector2 = Playerpos.global_position if entity == "Player" else Enemypos.global_position
	match move:
		"Absorb":
				res.texture = load("res://assets/moves/absorb.png")
				res.scale = Vector2(2,2)
				res.show()
				var tween = get_tree().create_tween()
				res.position = target
				tween.tween_property(res,"position",source,.5)
				await get_tree().create_timer(.5).timeout
				res.hide()
				res.scale = Vector2(1,1)
		"Bite":
				res.texture = load("res://assets/moves/bite.png")
				res.scale = Vector2(2,2)
				res.hframes = 2
				res.show()
				res.frame = 1
				res.position = target
				await get_tree().create_timer(.4).timeout
				res.frame = 0
				await get_tree().create_timer(.2).timeout
				res.hide()
				res.hframes = 1
				res.scale = Vector2(1,1)
		"Watergun":
				res.texture = load("res://assets/moves/bubble.png")
				res.vframes = 3
				res.frame = 0
				res.scale = Vector2(2,2)
				res.position = source
				res.show()
				var tween = get_tree().create_tween()
				tween.tween_property(res,"position",target,.5)
				await get_tree().create_timer(.5).timeout
				res.frame = 1
				await get_tree().create_timer(.2).timeout
				res.frame = 2
				await get_tree().create_timer(.2).timeout
				res.hide()
				res.frame = 0
				res.vframes = 1
				res.scale = Vector2(2,2)
		"Ember":
				res.texture = load("res://assets/moves/ember.png")
				res.hframes = 5
				res.frame = 0
				res.scale = Vector2(2,2)
				res.position = target
				res.show()
				await get_tree().create_timer(.1).timeout
				res.frame = 1
				await get_tree().create_timer(.1).timeout
				res.frame = 2
				await get_tree().create_timer(.1).timeout
				res.frame = 3
				await get_tree().create_timer(.1).timeout
				res.frame = 4
				await get_tree().create_timer(.1).timeout
				res.hide()
				res.frame = 0
				res.hframes = 1
				res.scale = Vector2(1,1)
