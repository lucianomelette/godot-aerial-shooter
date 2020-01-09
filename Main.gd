extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var bg_stars_far_speed = 50
export var bg_stars_close_speed = 150

var screen_size = Vector2()
var bg_height

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport().size
	bg_height = $Stars_Far/Stars_Far_0.texture.get_height()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	# Background parallax effect
	update_bg_position($Stars_Far/Stars_Far_0, $Stars_Far/Stars_Far_1, bg_stars_far_speed, delta)
	update_bg_position($Stars_Far/Stars_Far_1, $Stars_Far/Stars_Far_0, bg_stars_far_speed, delta)
	
	update_bg_position($Stars_Close/Stars_Close_0, $Stars_Close/Stars_Close_1, bg_stars_close_speed, delta)
	update_bg_position($Stars_Close/Stars_Close_1, $Stars_Close/Stars_Close_0, bg_stars_close_speed, delta)
		
func update_bg_position(primary_bg, secondary_bg, speed, delta):
	primary_bg.position.y += speed * delta
	
	if primary_bg.position.y > screen_size.y:
		primary_bg.position.y = secondary_bg.position.y - bg_height