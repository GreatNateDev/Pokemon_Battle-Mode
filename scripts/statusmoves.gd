class_name StatusMoves
#Status atk def spd eva para slp psn brn frz acc
func mov(move):
    var x = moves[move]
    return x
var moves = {
    "thunder_wave": {
        "status": "para",
        "value": 5
    },
}