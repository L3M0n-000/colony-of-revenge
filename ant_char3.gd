extends CharacterBody2D
var mouse_in = false
var attacking= false
var in_range=false
var EIR = []
var EBA
var health = 1
var max_health = 1
var attack = 1
var once = false
var const_atk = 0
var const_hth=0
var const_hth_max=0
var once_wolf = false
@export var cooldown: float = 1
@onready var health_bar = $ProgressBar
@onready var timer = $Timer

func _ready() -> void:
	attack=Global.ant_atk_type[2]*randf_range(0.75,1.25)*Global.atk_mult*Global.ant3_atk_mult
	health=Global.ant3_num*Global.ant_type_health_ally[2]*Global.health_mult
	max_health=Global.ant3_num*Global.ant_type_health_ally[2]*Global.health_mult
	health_bar.max_value=max_health
	const_atk = attack
	const_hth = health
	const_hth_max = max_health
	health_bar.max_value=max_health
	Global.ant_exist3=true



func _physics_process(delta: float) -> void:
	if Global.wolf_act==false:
		Global.ant3_num=round((health/Global.ant_type_health_ally[2]))
	else:
		Global.ant3_num=round((health/Global.health_mult)/Global.ant_type_health_ally[2])
	if Global.start==true and once_wolf==false and Global.wolf_act==true:
		max_health=const_hth_max*Global.health_mult
		health=const_hth*Global.health_mult
		attack=const_atk*Global.atk_mult
		health_bar.max_value=max_health
		once_wolf=true
	if Global.start==false and Global.enemy1_cache==null and Global.enemy2_cache==null and Global.enemy3_cache==null:
		attack=const_atk
		health=health/Global.health_mult
		max_health=max_health/Global.health_mult
	if health<=0:
		Global.ally3_pos=Vector2(-1000,-1000)
		Global.ant_exist3=false
		queue_free()
	#print("3 ",attacking)
	$Label.text=str(Global.ant3_num)
	health_bar.value=health
	if len(EIR)>0:
		EBA=EIR[0]
	if attacking==true and once==false and EBA != null:
		if EBA != null:
			EBA.health-=attack
			once=true
			timer.start(cooldown/Global.ant3_num)
	if is_instance_valid(EBA)==false and len(EIR)>0: 
		EIR.remove_at(0)
	if health>=0:
		Global.ally3_pos=position
	else:
		Global.ally3_pos=Vector2(-1000,-1000)
	if Global.start==true and in_range==true and EBA != null:
		attacking=true
	else:
		attacking=false
	if Global.start==false and mouse_in==true and Input.is_action_just_pressed("click"):
		Global.ant_exist3=false
		queue_free()
	if Global.start==true and attacking==false:
		var distance2 = sqrt(pow((self.position.x-Global.enemy2_pos.x),2) + pow((self.position.y-Global.enemy2_pos.y),2))
		#print(distance2)
		var distance3 = sqrt(pow((self.position.x-Global.enemy3_pos.x),2) + pow((self.position.y-Global.enemy3_pos.y),2))
		#print(distance3)
		var distance1 = sqrt(pow((self.position.x-Global.enemy1_pos.x),2) + pow((self.position.y-Global.enemy1_pos.y),2))
		#print(distance1)
		if distance1<=distance2 and distance1<=distance3:
			position.x=move_toward(position.x,Global.enemy1_pos.x,1)
			position.y=move_toward(position.y,Global.enemy1_pos.y,1)
		if distance2<=distance1 and distance2<=distance3:
			position.x=move_toward(position.x,Global.enemy2_pos.x,1)
			position.y=move_toward(position.y,Global.enemy2_pos.y,1)
		if distance3<=distance1 and distance3<=distance2:
			position.x=move_toward(position.x,Global.enemy3_pos.x,1)
			position.y=move_toward(position.y,Global.enemy3_pos.y,1)
	move_and_slide()


func _on_area_2d_mouse_entered() -> void:
	mouse_in=true


func _on_area_2d_mouse_exited() -> void:
	mouse_in=false

func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		in_range=true
		EIR.append(body)


func _on_timer_timeout() -> void:
	once=false
