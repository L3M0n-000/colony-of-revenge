extends Camera2D
func _ready() -> void:
	if Global.act>0:
		position.x=572-1152
	if Global.act>1:
		position.y=322+648
	if Global.act>2:
		position.x=576
	
	pass
