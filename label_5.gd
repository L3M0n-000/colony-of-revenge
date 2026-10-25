extends Label
func _ready() -> void:
	Global.cache4=round(Global.rewards[Global.Act1_level_type][3]*(1+(Global.Act_progress/4)))
	text+=str(Global.cache4)
