extends Button
var amount = round(10*(1+(Global.Act_progress/4)))
func _process(delta: float) -> void:
	$Label.text="X"+str(round(10*(1+(Global.Act_progress/4))))


func _on_pressed() -> void:
	if Global.curreny>=50:
		Global.curreny-=50
		Global.ant_num+=amount
		Global.ant_num_m+=amount
		$AudioStreamPlayer.play()
