extends Area2D
var place = -1
var once: bool = false
@onready var ant = preload("res://ant.tscn")

func _process(delta: float) -> void:
	if place==-1 and area_entered:
		place=place*-1
		var ant_ally=ant.instantiate()
		if once==false:
			add_child(ant_ally)
			once==true
		
