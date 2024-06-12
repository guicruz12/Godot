extends Node2D

@export var bug_scene : PackedScene
var score 

func _ready():
	new_game()

func game_over():
	$BugTimer.stop()
	$ScoreTimer2.stop()
	
	
func  new_game():
	$StartTimer.start()	
	$player.start_pos($StartPosition.position)
	var score = 0 
