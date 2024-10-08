extends Control
@onready var res = get_parent().get_node("Move_layer/item")
@onready var player = get_parent().get_node("Cast/Player/Player_sprite")
@onready var enemy = get_parent().get_node("Cast/Enemy/Enemy_sprite")
@onready var star = get_parent().get_node("Move_layer/star")
@onready var caughtsfx = get_parent().get_node("SFX/caught")
@onready var Audio = get_parent().get_node("SFX/Audio")
@onready var pkmn = pokemon.new()
signal anim_text(text)
signal caught()
signal failed()
func Item_anim(item, e):
	match item:
		"poke_ball":
			res.position = player.global_position
			res.texture = load("res://assets/items/poke_ball.png")
			res.scale = Vector2(2,2)
			res.show()
			var tween = get_tree().create_tween()
			tween.tween_property(res,"position",enemy.global_position,1)
			var tweene = get_tree().create_tween()
			tweene.tween_property(res,"rotation",360,1)
			await get_tree().create_timer(1).timeout
			var x = enemy.get_rect().size.x
			x = x / 2
			var y = enemy.get_rect().size.y
			y = y / 2
			res.hide()
			enemy.hide()
			await get_tree().create_timer(.2).timeout
			res.position = res.position - Vector2(x,y)
			res.rotation = 0
			res.show()
			var tweenw = get_tree().create_tween()
			tweenw.tween_property(res,"position",Vector2(res.position.x,res.position.y + 100),1)
			await get_tree().create_timer(1).timeout
			var R = pkmn.pkmn[e.sprite]
			#print("hp: "+str(e.hp)+" max_hp: "+str(e.max_hp)+" crate: "+str(R.catch)+" state: "+str(e.stat))
			var base_capture_rate = ((3 * e.max_hp - 2 * e.hp) * R.catch) / (3 * e.max_hp)
			var modified_capture_rate = base_capture_rate * 1
			#print(base_capture_rate)
			var final_capture_rate = modified_capture_rate * e.stat
			#print(final_capture_rate)
			var probability = final_capture_rate /255.0
			var breaker
			for i in range(4):  
				if randf() > probability:
					breaker = true
					break
				res.skew = 50
				await get_tree().create_timer(.2).timeout
				res.skew = -50
				await get_tree().create_timer(.2).timeout
				res.skew = 0
				await get_tree().create_timer(.5).timeout
			if breaker != true:
				breaker = false
			match breaker:
				true:
					anim_text.emit("Aww the pokemon escaped you will get him next time!")
					failed.emit()
					res.hide()
					res.scale = Vector2(1,1)
					enemy.show()
				false:
					anim_text.emit("You caught the pokemon!")
					Audio.stop()
					caughtsfx.play()
					caught.emit()
					await get_tree().create_timer(4).timeout
					res.hide()
					res.scale = Vector2(1,1)
