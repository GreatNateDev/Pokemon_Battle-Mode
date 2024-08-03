extends Control
class_name pokemon
signal pkmn_data(pkmn)
@export var zigzagoon = {
	"type": "Normal",
	"catch" : 255
}
@export var mudkip = {
	"type" : "Water",
	"catch" : 45
}
@export var torchic = {
	"type" : "Fire",
	"catch" : 45
}
@export var treecko = {
	"type" : "Grass",
	"catch" : 45
}
@export var pkmn = {
	"zigzagoon": zigzagoon,
	"treecko": treecko,
	"mudkip": mudkip,
	"torchic": torchic,
}

func _on_main_window_type_requester(pokemoner):
	var data = pkmn.get(pokemoner)
	pkmn_data.emit(data.type)
