extends Area2D
var placeable = false
var placed = false
var count = 0
@onready var ant = preload("res://ant2.tscn")

func _ready() -> void:
	self.modulate=Color(0.7,0.131,0.255,0.54)

func _process(delta: float) -> void:
	if placed==false:
		self.position.x=get_global_mouse_position().x
		self.position.y=get_global_mouse_position().y
	if placeable==true and Input.is_action_just_pressed("click"):
		placed=true
		self.modulate=Color(0,0,0,1)
		var ant_self = ant.instantiate()
		add_sibling(ant_self)
		ant_self.position=self.position
		queue_free()



func _on_area_entered(area: Area2D) -> void:
	if placed==false:
		if area.is_in_group("non placable area"):
			count+=1
			placeable=false
			self.modulate=Color(0.7,0.131,0.255,0.54)


func _on_area_exited(area: Area2D) -> void:
	if placed==false:
		if area.is_in_group("non placable area"):
			count-=1
			if count==1:
				placeable=true
				self.modulate=Color(0.255, 0.131, 0.7, 0.54)

func _on_body_entered(body: Node2D) -> void:
	if placed==false:
		if body.is_in_group("non placable area"):
			count+=1
			placeable=false
			self.modulate=Color(0.7,0.131,0.255,0.54)


func _on_body_exited(body: Node2D) -> void:
	if placed==false:
		if body.is_in_group("non placable area"):
			count-=1
			if count==1:
				placeable=true
				self.modulate=Color(0.255, 0.131, 0.7, 0.54)
