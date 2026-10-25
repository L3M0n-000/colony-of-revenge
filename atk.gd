extends Button
@onready var cost=$"..".cost

func _process(delta: float) -> void:
	$Label.text="ATK: "+str(Global.ant_atk_type[0])
func _on_pressed() -> void:
	if Global.curreny>=$"..".cost:
		Global.curreny-=$"..".cost
		$"..".cost=$"..".cost*2
		Global.ant_atk_type[0]+=1
