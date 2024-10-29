extends Node3D

@onready var player = $Player

@onready var pause_menu = $PauseMenu
var paused = false 

func _physics_process(_delta):
	get_tree().call_group("enemies", "update_target_position", player.global_transform.origin)

func _process(_delta):
	if Input.is_action_just_pressed("Pause"):
		pauseMenu()
		
func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
		
	paused = !paused
