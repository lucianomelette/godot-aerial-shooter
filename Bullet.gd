extends Area2D

# Declare member variables here. Examples:
export var direction = Vector2(1, 0)
export var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	$VisibilityNotifier2D.connect("screen_exited", self, "_on_screen_exited")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = direction.normalized() * speed
	position += velocity * delta
	
func _on_screen_exited():
	queue_free()