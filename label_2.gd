extends Label
func _ready() -> void:
	Global.cache1=round(Global.rewards[Global.Act1_level_type][0])
	text+=str(Global.cache1)
	
