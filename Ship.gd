extends Area2D

# Declare member variables here. Examples:
export (PackedScene) var Bullet
export var speed = 400
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = 0
	$AnimatedSprite.animation = "default"
	if Input.is_action_pressed("ui_left"):
		direction += -1
	if Input.is_action_pressed("ui_right"):
		direction += 1
	if Input.is_action_just_pressed("ui_accept"):
		var bullet = Bullet.instance()
		get_node("/root").add_child(bullet)
		
		bullet.speed = 500
		bullet.direction = Vector2(0, -1)
		bullet.position = position
	
	if direction != 0:
		if direction > 0:
			$AnimatedSprite.animation = "right"
		else:
			$AnimatedSprite.animation = "left"
			
		position.x += direction * speed * delta
		position.x = clamp(position.x, 0, screen_size.x)