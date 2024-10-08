extends Control

# Signals
signal Mov_return(mov)
signal return_lvlup_mov(mov)

var totodile = ["Watergun", "Tackle"]
var mudkip = ["Watergun", "Tackle"]
var squirtle = ["Watergun", "Tackle"]
var lotad = ["Tackle","Watergun"]
var wingull = ["Watergun", "Tackle"]
var treecko = ["Absorb"]
var bulbasaur = ["Absorb", "Tackle"]
var chikorita = ["Absorb", "Tackle"]
var seedot = ["Absorb", "Tackle"]
var shroomish = ["Tackle", "Absorb"]
var torchic = ["Ember"]
var charmander = ["Ember"]
var cyndaquil = ["Ember", "Tackle"]
var zigzagoon = ["Bite", "Tackle"]
var slackoth = ["Tackle", "Watergun"]
var caterpie = ["Tackle"]
var poochyena = ["Tackle","Bite"]
var taillow = ["Tackle"]
var ralts = ["Tackle"]
var surskit = ["Watergun", "Tackle"]
var jigglypuff = ["Tackle"]
var slakoth = ["Tackle"] #fix moves he cant learn these
var nincada = ["Tackle"] #fix moves he cant learn these
var whismur = ["Watergun"]
var makuhita = ["Bite"]
var azurill = ["Watergun", "Tackle"]
var nosepass = ["Tackle", "Rockthrow"]
var skitty = ["Tackle"]
var sableye = ["Tackle"]
var pkmn = {
	"zigzagoon": zigzagoon,
	"treecko": treecko,
	"mudkip": mudkip,
	"torchic": torchic,
	"totodile": totodile,
	"bulbasaur": bulbasaur,
	"charmander": charmander,
	"squirtle": squirtle,
	"cyndaquil": cyndaquil,
	"chikorita": chikorita,
	"caterpie": caterpie,
	"poochyena": poochyena,
	"lotad": lotad,
	"seedot": seedot,
	"taillow": taillow,
	"wingull": wingull,
	"shroomish": shroomish,
	"ralts": ralts,
	"surskit": surskit,
	"jigglypuff": jigglypuff,
	"slakoth": slakoth,
	"nincada": nincada,
	"whismur": whismur,
	"makuhita": makuhita,
	"azurill": azurill,
	"nosepass": nosepass,
	"skitty": skitty,
	"sableye": sableye
}

func RandMov(mon):
	var value = pkmn[mon]
	var used_moves = []
	for i in range(4):
		var available_moves = value.filter(func(mov):
			return not used_moves.has(mov)
		)
		if available_moves.size() == 0:
			Mov_return.emit("")
		else:
			var rand = randi() % available_moves.size()
			var output = available_moves[rand]
			used_moves.append(output)
			Mov_return.emit(output)

func _on_main_window_get_new_move(data) -> void:
	var index = data.level / 3
	index = int(index)
	var mon = data.name
	if index >= 0 and index < pkmn[mon].size():
		var move = pkmn[mon][index]
		return_lvlup_mov.emit(move)
