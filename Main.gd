extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Sprite.position.y += 100 * delta
	$Sprite2.position.y += 100 * delta
	
	if Input.is_action_pressed("ui_left"):
		$Sprite.position.x += 30 * delta
		$Sprite2.position.x += 30 * delta
	if Input.is_action_pressed("ui_right"):
		$Sprite.position.x -= 30 * delta
		$Sprite2.position.x -= 30 * delta
	
	if $Sprite.position.y > 610:
		$Sprite.position.y = $Sprite2.position.y - 640
	if $Sprite2.position.y > 610:
		$Sprite2.position.y = $Sprite.position.y - 640