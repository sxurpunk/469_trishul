extends Control

func _ready():
	$AnimationPlayer.play("RESET")

func resume():
	get_tree().pasue = false
	$AnimationPlayer.play_backwards("blur")
	
func pause():
	get_tree().pause = true
	$AnimationPlayer.play("blur")

func testEsc():
	if Input.is_action_just_pressed("Escape") and get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("Escape") and get_tree().paused:
		resume()

func _on_resume_pressed() -> void:
	resume()



func _on_restart_pressed() -> void:
	resume()
	get_tree().reload_current_scene()


func _on_quit_pressed() -> void:
	get_tree().quit()

func _process(_delta):
	testEsc()
