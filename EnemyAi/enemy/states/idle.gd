extends Node3D

var time: float
var minTime = 1
var maxTime = 7 

func enter():
	time = round(randf_range(minTime,maxTime))
	timer.set_wait_time(time)
	timer.start()
	
func handle_input(_event):
	pass
	
func update(_delta):
	pass
	
func _on_Timer_timeout():
	emit_signal("finished", "patrol")
