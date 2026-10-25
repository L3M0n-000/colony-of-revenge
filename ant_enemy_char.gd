extends CharacterBody2D
@onready var attacking = $Area2D3.attacking
@onready var health:float = 1
@onready var max_health:float = 1

func _physics_process(delta: float) -> void:
	if health<=0:
		queue_free()
	
	attacking=$Area2D3.attacking
	if Global.start==true and attacking==false:
		var distance2 = sqrt(pow((self.position.x-Global.ally2_pos.x),2) + pow((self.position.y-Global.ally2_pos.y),2))
		var distance3 = sqrt(pow((self.position.x-Global.ally3_pos.x),2) + pow((self.position.y-Global.ally3_pos.y),2))
		var distance1 = sqrt(pow((self.position.x-Global.ally1_pos.x),2) + pow((self.position.y-Global.ally1_pos.y),2))
		if distance1<=distance2 and distance1<=distance3:
			position.x=move_toward(position.x,Global.ally1_pos.x,1)
			position.y=move_toward(position.y,Global.ally1_pos.y,1)
		if distance2<=distance1 and distance2<=distance3:
			position.x=move_toward(position.x,Global.ally2_pos.x,1)
			position.y=move_toward(position.y,Global.ally2_pos.y,1)
		if distance3<=distance1 and distance3<=distance2:
			position.x=move_toward(position.x,Global.ally3_pos.x,1)
			position.y=move_toward(position.y,Global.ally3_pos.y,1)
	move_and_slide()
