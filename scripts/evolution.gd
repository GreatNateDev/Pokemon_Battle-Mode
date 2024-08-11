extends Control

signal evo(mon)

var lvl = {
	"bulbasaur": 16,
	"ivysaur": 32,
	"charmander": 16,
	"charmeleon": 36,
	"squirtle": 16,
	"wartortle": 36,
	"treecko": 16,
	"grovyle": 36,
	"torchic": 16,
	"combusken": 36,
	"mudkip": 16,
	"marshtomp": 36,
	"poochyena": 18,
	"zigzagoon": 20,
	"wurmple": 7,
	"silcoon": 10,
	"cascoon": 10,
	"lotad": 14,
	"lombre": 36,
	"seedot": 14,
	"nuzleaf": 36,
	"taillow": 22,
	"wingull": 25,
	"ralts": 20,
	"kirlia": 30,
	"surskit": 22,
	"shroomish": 23,
	"slakoth": 18,
	"vigoroth": 36,
	"nincada": 20,
	"whismur": 20,
	"loudred": 40,
	"makuhita": 24,
	"azurill": 18,
	"nosepass": 40,
	"skitty": 18,
	"sableye": 40,
	"mawile": 40,
	"aron": 32,
	"lairon": 42,
	"meditite": 37,
	"electrike": 26,
	"plusle": 40,
	"minun": 40,
	"volbeat": 40,
	"illumise": 40,
	"roselia": 40,
	"gulpin": 26,
	"carvanha": 30,
	"wailmer": 40,
	"numel": 33,
	"torkoal": 40,
	"spoink": 32,
	"spinda": 40,
	"trapinch": 35,
	"vibrava": 45,
	"cacnea": 32,
	"swablu": 35,
	"zangoose": 40,
	"seviper": 40,
	"lunatone": 40,
	"solrock": 40,
	"barboach": 30,
	"corphish": 30,
	"baltoy": 36,
	"lileep": 40,
	"anorith": 40,
	"feebas": 40,
	"castform": 40,
	"kecleon": 40,
	"shuppet": 37,
	"duskull": 37,
	"tropius": 40,
	"chimecho": 40,
	"absol": 40,
	"snorunt": 42,
	"spheal": 32,
	"sealeo": 44,
	"clamperl": 40,
	"bagon": 30,
	"shelgon": 50,
	"beldum": 20,
	"metang": 45
}

var evos = {
	"bulbasaur": "ivysaur",
	"ivysaur": "venusaur",
	"charmander": "charmeleon",
	"charmeleon": "charizard",
	"squirtle": "wartortle",
	"wartortle": "blastoise",
	"treecko": "grovyle",
	"grovyle": "sceptile",
	"torchic": "combusken",
	"combusken": "blaziken",
	"mudkip": "marshtomp",
	"marshtomp": "swampert",
	"poochyena": "mightyena",
	"zigzagoon": "linoone",
	"wurmple": "silcoon",
	"silcoon": "beautifly",
	"cascoon": "dustox",
	"lotad": "lombre",
	"lombre": "ludicolo",
	"seedot": "nuzleaf",
	"nuzleaf": "shiftry",
	"taillow": "swellow",
	"wingull": "pelipper",
	"ralts": "kirlia",
	"kirlia": "gardevoir",
	"surskit": "masquerain",
	"shroomish": "breloom",
	"slakoth": "vigoroth",
	"vigoroth": "slaking",
	"nincada": "ninjask",
	"whismur": "loudred",
	"loudred": "exploud",
	"makuhita": "hariyama",
	"azurill": "marill",
	"nosepass": "probopass",
	"skitty": "delcatty",
	"sableye": "mega_sableye",
	"mawile": "mega_mawile",
	"aron": "lairon",
	"lairon": "aggron",
	"meditite": "medicham",
	"electrike": "manectric",
	"plusle": "mega_plusle",
	"minun": "mega_minun",
	"volbeat": "mega_volbeat",
	"illumise": "mega_illumise",
	"roselia": "roserade",
	"gulpin": "swalot",
	"carvanha": "sharpedo",
	"wailmer": "wailord",
	"numel": "camerupt",
	"torkoal": "mega_torkoal",
	"spoink": "grumpig",
	"spinda": "mega_spinda",
	"trapinch": "vibrava",
	"vibrava": "flygon",
	"cacnea": "cacturne",
	"swablu": "altaria",
	"zangoose": "mega_zangoose",
	"seviper": "mega_seviper",
	"lunatone": "mega_lunatone",
	"solrock": "mega_solrock",
	"barboach": "whiscash",
	"corphish": "crawdaunt",
	"baltoy": "claydol",
	"lileep": "cradily",
	"anorith": "armaldo",
	"feebas": "milotic",
	"castform": "mega_castform",
	"kecleon": "mega_kecleon",
	"shuppet": "banette",
	"duskull": "dusclops",
	"tropius": "mega_tropius",
	"chimecho": "mega_chimecho",
	"absol": "mega_absol",
	"snorunt": "glalie",
	"spheal": "sealeo",
	"sealeo": "walrein",
	"clamperl": "huntail",
	"bagon": "shelgon",
	"shelgon": "salamence",
	"beldum": "metang",
	"metang": "metagross"
}

func _on_main_window_evolve(mon: String, level: int) -> void:
	if lvl.has(mon) and lvl[mon] == level:
		evo.emit(evos[mon])