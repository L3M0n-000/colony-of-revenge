extends Label
func _ready() -> void:
	Global.cache2=round(Global.rewards[Global.Act1_level_type][1]*(1+(Global.Act_progress/4)))
	text+=str(Global.cache2)
