extends Control

@onready var main = get_parent()


func _on_resume_pressed():
	if main and main.has_method("pauseMenu"):
		main.pauseMenu()

func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()

func _on_quit_pressed():
	get_tree().quit()
