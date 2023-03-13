extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocitat := 200
var MaxJmp := -600
var MinJmp := -200
var moviment := Vector2.ZERO
var gravetat := Vector2.DOWN * 750
var salt = Vector2.UP
var time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	
	moviment += gravetat * delta
	
	if is_on_floor():
		moviment.x = Input.get_axis("ves_esquerra","ves_dreta") * velocitat
	
	if Input.is_action_pressed("ves_amunt") and is_on_floor():
		time += delta
		if time >= 0.1:
			time = 0.1
			if Input.is_action_just_released("ves_amunt"):
				moviment.y += MaxJmp
				time = 0
		
	if Input.is_action_just_released("ves_amunt") and is_on_floor():
		moviment.y = ((MaxJmp - MinJmp)*(time/0.1) + MinJmp)
		time = 0
#
	
	moviment = move_and_slide(moviment, Vector2.UP)
	
#	var direccio := Vector2.ZERO
#	if Input.is_action_pressed("ves_dreta"):
#		direccio += Vector2.RIGHT
#	if Input.is_action_pressed("ves_esquerra"):
#		direccio += Vector2.LEFT
#	if Input.is_action_pressed("ves_amunt"):
#		direccio += Vector2.UP
