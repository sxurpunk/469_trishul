extends Node

var patrolPoints
var patrolIndex = 0 
var actualTarget
export(int) var wanderRange = 10

@onready var spriteIcon = get_parent().get_parent().get_node("Sprite3D")
var enemyPosition: Vector3
var target

var moveSpeed = 5

func enter():
	var randomPoint = Vector3(randf_range(-wanderRange,wanderRange), 0, randf_range(-wanderRange, wanderRange))
	var targetPoint = randomPoint+startPosition
	print(randomPoint)
	
	path = Environment.get_simple_path(enemy.get_translation(),targetPoint)
	pathNode = 0 
	
	var finalPoint = path.size()-1
	actualTarget = path(finalPoint)
	sprite.global_transform.origin = actualTarget
	
func update(_delta):
	if enemy.get_translation().distance_to(actualTarget) < 2:
		emit_signal("finished", "idle")
	followPath(moveSpeed)
