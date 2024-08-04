extends Control
class_name types
var typx = {
	"Normal": {"Normal": 1, "Fire": 1, "Water": 1, "Rock": .5, "Steel": .5, "Ghost":0 , "Electric": 1, "Grass": 1, "Ice": 1, "Fighting": 1, "Poison": 1, "Ground": 1, "Flying": 1, "Psychic": 1, "Bug": 1, "Dragon": 1, "Dark": 1, "Fairy": 1},
	"Fire": {"Normal": 1, "Fire": .5, "Water": .5, "Rock": .5, "Steel": 2, "Ghost": 1, "Electric": 1, "Grass": 2, "Ice": 2, "Fighting": 1, "Poison": 1, "Ground": 1, "Flying": 1, "Psychic": 1, "Bug": 2, "Dragon": .5, "Dark": 1, "Fairy": 1},
	"Water": {"Normal": 1, "Fire": 2, "Water": .5, "Rock": 2, "Steel": 1, "Ghost": 1, "Electric": 1, "Grass": .5, "Ice": 1, "Fighting": 1, "Poison": 1, "Ground": 2, "Flying": 1, "Psychic": 1, "Bug": 1, "Dragon": .5, "Dark": 1, "Fairy": 1},
	"Electric": {"Normal": 1, "Fire": 1, "Water": 2, "Rock": 1, "Steel": 1, "Ghost": 1, "Electric": .5, "Grass": .5, "Ice": 1, "Fighting": 1, "Poison": 1, "Ground": 0, "Flying": 2, "Psychic": 1, "Bug": 1, "Dragon": .5, "Dark": 1, "Fairy": 1},
	"Grass": {"Normal": 1, "Fire": .5, "Water": 2, "Rock": 2, "Steel": .5, "Ghost": 1, "Electric": 1, "Grass": .5, "Ice": 1, "Fighting": 1, "Poison": .5, "Ground": 2, "Flying": .5, "Psychic": 1, "Bug": .5, "Dragon": .5, "Dark": 1, "Fairy": 1},
	"Ice": {"Normal": 1, "Fire": .5, "Water": .5, "Rock": 1, "Steel": .5, "Ghost": 1, "Electric": 1, "Grass": 2, "Ice": .5, "Fighting": 1, "Poison": 1, "Ground": 2, "Flying": 2, "Psychic": 1, "Bug": 1, "Dragon": 2, "Dark": 1, "Fairy": 1},
	"Fighting": {"Normal": 2, "Fire": 1, "Water": 1, "Rock": 2, "Steel": 2, "Ghost":0 , "Electric": 1, "Grass": 1, "Ice": 2, "Fighting": 1, "Poison": .5, "Ground": 1, "Flying": .5, "Psychic": .5, "Bug": .5, "Dragon": 1, "Dark": 2, "Fairy": .5},
	"Poison": {"Normal": 1, "Fire": 1, "Water": 1, "Rock": .5, "Steel":0 , "Ghost": .5, "Electric": 1, "Grass": 2, "Ice": 1, "Fighting": 1, "Poison": .5, "Ground": .5, "Flying": 1, "Psychic": 1, "Bug": 1, "Dragon": 1, "Dark": 1, "Fairy": 2},
	"Ground": {"Normal": 1, "Fire": 2, "Water": 1, "Rock": 2, "Steel": 2, "Ghost": 1, "Electric": 2, "Grass": .5, "Ice": 1, "Fighting": 1, "Poison": 2, "Ground": 1, "Flying":0 , "Psychic": 1, "Bug": .5, "Dragon": 1, "Dark": 1, "Fairy": 1},
	"Flying": {"Normal": 1, "Fire": 1, "Water": 1, "Rock": .5, "Steel": .5, "Ghost": 1, "Electric": .5, "Grass": 2, "Ice": 1, "Fighting": 2, "Poison": 1, "Ground": 1, "Flying": 1, "Psychic": 1, "Bug": 2, "Dragon": 1, "Dark": 1, "Fairy": 1},
	"Psychic": {"Normal": 1, "Fire": 1, "Water": 1, "Rock": 1, "Steel": .5, "Ghost": 1, "Electric": 1, "Grass": 1, "Ice": 1, "Fighting": 2, "Poison": 2, "Ground": 1, "Flying": 1, "Psychic": .5, "Bug": 1, "Dragon": 1, "Dark": 0, "Fairy": 1},
	"Bug": {"Normal": 1, "Fire": .5, "Water": 1, "Rock": 1, "Steel": .5, "Ghost": .5, "Electric": 1, "Grass": 2, "Ice": 1, "Fighting": .5, "Poison": .5, "Ground": 1, "Flying": .5, "Psychic": 2, "Bug": 1, "Dragon": 1, "Dark": 2, "Fairy": .5},
	"Rock": {"Normal": 1, "Fire": 2, "Water": 1, "Rock": 1, "Steel": .5, "Ghost": 1, "Electric": 1, "Grass": 1, "Ice": 2, "Fighting": .5, "Poison": 1, "Ground": .5, "Flying": 2, "Psychic": 1, "Bug": 2, "Dragon": 1, "Dark": 1, "Fairy": 1},
	"Ghost": {"Normal": 0, "Fire": 1, "Water": 1, "Rock": 1, "Steel": 1, "Ghost": 2, "Electric": 1, "Grass": 1, "Ice": 1, "Fighting": 1, "Poison": 1, "Ground": 1, "Flying": 1, "Psychic": 2, "Bug": 1, "Dragon": 1, "Dark": .5, "Fairy": 1},
	"Dragon": {"Normal": 1, "Fire": 1, "Water": 1, "Rock": 1, "Steel": .5, "Ghost": 1, "Electric": 1, "Grass": 1, "Ice": 1, "Fighting": 1, "Poison": 1, "Ground": 1, "Flying": 1, "Psychic": 1, "Bug": 1, "Dragon": 2, "Dark": 1, "Fairy":0 },
	"Dark": {"Normal": 1, "Fire": 1, "Water": 1, "Rock": 1, "Steel": 1, "Ghost": 2, "Electric": 1, "Grass": 1, "Ice": 1, "Fighting": .5, "Poison": 1, "Ground": 1, "Flying": 1, "Psychic": 2, "Bug": 1, "Dragon": 1, "Dark": .5, "Fairy": .5},
	"Fairy": {"Normal": 1, "Fire": .5, "Water": 1, "Rock": 1, "Steel": .5, "Ghost": 1, "Electric": 1, "Grass": 1, "Ice": 1, "Fighting": 2, "Poison": .5, "Ground": 1, "Flying": 1, "Psychic": 1, "Bug": 1, "Dragon": 2, "Dark": 2, "Fairy": 1},
	"Steel": {"Normal": 1, "Fire": .5, "Water": .5, "Rock": 2, "Steel": .5, "Ghost": 1, "Electric": .5, "Grass": 1, "Ice": 2, "Fighting": 1, "Poison": 1, "Ground": 1, "Flying": 1, "Psychic": 1, "Bug": 1, "Dragon": 1, "Dark": 1, "Fairy": 2},
}
