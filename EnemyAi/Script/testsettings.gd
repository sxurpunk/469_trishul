extends Control

@onready var main_settings = $MainSettings
@onready var input_settings = $InputSettings
@onready var fullscreen_checkbox = $MainSettings/PanelContainer/MarginContainer/VBoxContainer/FullscreenCheck
@onready var screen_shake_checkbox = $MainSettings/PanelContainer/MarginContainer/VBoxContainer/ScreenShakeCheck
@onready var master_volume_slider = $MainSettings/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/MasterVolumeSlider
@onready var sfx_volume_slider = $MainSettings/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer2/SfxVolumeSlider

func _ready() -> void:
	var video_settings = ConfigFileHandler.load_video_settings()
	fullscreen_checkbox.button_pressed = video_settings.fullscreen 
	screen_shake_checkbox.button_pressed = video_settings.screen_shake
	
	var audio_settings = ConfigFileHandler.load_audio_settings()
	master_volume_slider.value = min(audio_settings.master_volume, 1.0) * 100
	sfx_volume_slider.value = min(audio_settings.sfx_volume, 1.0) * 100

func _on_fullscreen_check_toggled(toggled_on: bool) -> void:
	ConfigFileHandler.save_video_setting("fullscreen", toggled_on)


func _on_screen_shake_check_toggled(toggled_on: bool) -> void:
	ConfigFileHandler.save_video_setting("screen_shake", toggled_on)


func _on_master_volume_slider_drag_ended(value_changed: bool) -> void:
	if value_changed:
		ConfigFileHandler.save_audio_settings("master_volume", master_volume_slider.value / 100)


func _on_sfx_volume_slider_drag_ended(value_changed: bool) -> void:
	if value_changed:
		ConfigFileHandler.save_audio_settings("sfx_volume", master_volume_slider.value / 100)
