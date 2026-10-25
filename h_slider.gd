extends HSlider
func _ready() -> void:
	value=Global.difficulty_mod

func _process(delta: float) -> void:
	$Label2.text="DIFFICULTY "+str(value)
	Global.difficulty_mod=value
