extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_again_pressed():
	Global.total_coins = 0
	Global.player_lives =  3
	get_tree().change_scene_to_file("res://world.tscn")


func _on_quit_pressed():
	get_tree().quit()
