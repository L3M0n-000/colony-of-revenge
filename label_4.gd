extends Label
func _ready() -> void:
	Global.cache3=round(Global.rewards[Global.Act1_level_type][2]*(1+(Global.Act_progress/4)))
	text+=str(Global.cache3)
