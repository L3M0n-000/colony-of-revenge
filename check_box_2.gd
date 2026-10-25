extends CheckBox
var once: bool = false
var toggle: bool = false
@onready var ant = preload("res://ant(temp)2.tscn")
@onready var ant_ally=ant.instantiate()

func _process(delta: float) -> void:
	if Global.ant2_num<=0:
		disabled=true
	else:
		disabled=false
	if Global.ant_exist2==true:
		toggle=false
		once=false
	if toggle==true:
		if once==false:
			ant_ally=ant.instantiate()
			add_sibling(ant_ally)
			once=true
	if toggle==false and Global.ant_exist2==false:
		if once==true:
			ant_ally.queue_free()
			once=false
	if Global.start==true:
		queue_free()


func _on_toggled(toggled_on: bool) -> void:
	if Global.ant_exist2==false:
		if toggle==false:
			toggle=true
		else:
			toggle=false
	else:
		toggle=true
