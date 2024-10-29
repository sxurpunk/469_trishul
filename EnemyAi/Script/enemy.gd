extends CharacterBody3D

@onready var nav_agent = $NavigationAgent3D

var SPEED = 3.0

func _physics_process(_delta): 
	var current_position = global_transform.origin
	var next_position = nav_agent.get_next_path_position()
	var new_velocity = (next_position - current_position).normalized() * SPEED

	nav_agent.set_velocity(new_velocity)


func update_target_position(target_position):
	nav_agent.set_target_position(target_position)


func _on_navigation_agent_3d_target_reached():
	print("in range")


func _on_navigation_agent_3d_velocity_computed(safe_velocity):
	velocity = velocity.move_toward(safe_velocity , .25)
	move_and_slide()
