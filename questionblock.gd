extends Area2D


enum State { UNBUMPED, BUMPED }
var state: int = State.UNBUMPED
var original_position: Vector2

func _ready():
	original_position = position
	
# signal handler for on_body_entered
func _on_body_entered(body):
	if body.is_in_group("Player") and state == State.UNBUMPED:
		bump_block()
		
	# logic for bumping block
func bump_block():
	state = State.BUMPED
	$Sprite2D.frame = 1
	Global.spawn_beer_bottle(self.global_position + Vector2(0, -20))
	bump_upwards()
	var timer = get_tree().create_timer(20)
	await timer.timeout
	return_to_original_position()
	
	
	
# function to move block upwards
func bump_upwards():
		position.y -= 10
		
# function to move block back to original position
func return_to_original_position():
		position = original_position
