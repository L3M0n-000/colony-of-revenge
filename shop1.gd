extends Button
var type=0
func _ready() -> void:
	type=randi_range(0,len(Global.artifacts)-1)
	text+=str(Global.artifacts_cost[type])
func _process(delta: float) -> void:
	$Label.text=Global.artifacts[type]
	text="BUY $"+str(Global.artifacts_cost[type])


func _on_pressed() -> void:
	if Global.curreny>=Global.artifacts_cost[type]:
		Global.curreny-=Global.artifacts_cost[type]
		Global.artifacts_on[type]=true
		$AudioStreamPlayer.play()
		hide()


func _on_mouse_entered() -> void:
	$Label2.text=Global.artifacts_desc[type]
	$Label2.show()


func _on_mouse_exited() -> void:
	$Label2.hide()
