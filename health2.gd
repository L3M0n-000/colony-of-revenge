extends Button
@onready var cost=$"..".cost

func _process(delta: float) -> void:
	$Label.text="HEALTH: "+str(Global.ant_type_health_ally[1])

func _on_pressed() -> void:
	if Global.curreny>=$"..".cost:
		Global.curreny-=$"..".cost
		$"..".cost=$"..".cost*2
		Global.ant_type_health_ally[1]+=3
