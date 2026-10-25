extends Node
var start = false
var enemy1_pos = Vector2(-1000,-1000)
var enemy2_pos = Vector2(-1000,-1000)
var enemy3_pos = Vector2(-1000,-1000)
var ally1_pos = Vector2(-1000,-1000)
var ally2_pos = Vector2(-1000,-1000)
var ally3_pos = Vector2(-1000,-1000)
var ant_exist = false
var ant_exist2 = false
var ant_exist3 = false
var ant_num:float = 0
var ant2_num:float = 0
var ant3_num:float = 0
var ant_num_m:float = 0
var ant2_num_m:float = 0
var ant3_num_m:float = 0
var Act_progress: float=1
var Act1_level_type=0
var cache1
var cache2
var cache3
var cache4
var enemy1_cache
var enemy2_cache
var enemy3_cache
var curreny = 200
var other_path = false
var ant_atk_type = [2,3,1]
var ant_atk_type_enemy = [2,3,1,3,2]
var difficulty_mod = 3
var artifacts_on = [false,false,false,false,false,false,false,false,false,false]
var artifacts = ["Royal Honey","Dung Beetle Shell","Mitosis serum","Glass canon","Wolf Tooth","Tax documents","Rose Thorn","Rallying Banner","Super potion","Inspiring Speech"]
var artifacts_desc = [" Drinking it seems to make your\nCarpenter ants more powerful","Hard shell that can be used by turtle ants\nbut it seems too heavy to deal damage with","Can duplicate your fire ants\nbut requires blood from you other 2","Doubles your units attack\nbut halves their health","+50% damage and health if only\none type of unit on the field","Tax your units and\nget money after each room","Cause your enemies to take damage\nwhen attacking your units","Gets some units to join you","combines all the fire ants into one\ncombining their stats and multiplies it by 1.25\nbut you can no longer gain any fire ants","ants deal more damage the more they are"]
var artifacts_cost = [140,100,110,125,130,200,130,175,250,130]
var dung_atk =false
var wolf_on = false
var wolf_count = 0
var wolf_act = false
var atk_mult = 1
var health_mult = 1
var taxation = 0
var taxed = false
var thorn_on = false
var thorn_cnt = 0
var only_one = false
var inspiration = false
var ant_atk_mult:float = 1
var ant2_atk_mult:float = 1
var ant3_atk_mult:float = 1
var insp_cnt = 0
var act = 0
@onready var map_generation = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
@onready var Act1_lvl_antnum = [[15,-1,-1],[10,10,-1],[10,-1,-1],[10,-1,-1],[10,5,-1],[5,5,-1],[5,10,-1],[2,7,-1]]
@onready var Act1_lvl_anttype = [[0],[0,0],[1],[2],[0,1],[1,1],[2,0],[2,1]]
@onready var Act1_positions = [[Vector2(578,153)],[Vector2(359,146),Vector2(855,146)],[Vector2(578,103)],[Vector2(578,153)],[Vector2(870,90),Vector2(467,213)],[Vector2(300,90),Vector2(850,90)],[Vector2(577,219),Vector2(850,100)],[Vector2(577,219),Vector2(577,90)]]
@onready var ant_type_health = [9,3,15,15,9]
@onready var ant_type_health_ally = [9,3,15]
@onready var rewards = [[40,10,0,0],[45,10,0,0],[40,0,5,0],[40,0,0,5],[50,7,2,0],[50,0,7,0],[50,5,0,5],[40,0,4,2]]


func _process(delta: float) -> void:
	if artifacts_on[0]==true:
		ant_atk_type[1]=ant_atk_type[1]*2
		ant_atk_type[2]=round(ant_atk_type[2]/2)
		ant_atk_type[0]=round(ant_atk_type[0]/2)
		artifacts_on[0]=false
	if artifacts_on[1]==true:
		dung_atk=true
		ant_type_health_ally[2]=ant_type_health_ally[2]*2
		ant_atk_type[2]=0
		artifacts_on[1]=false
	if artifacts_on[2]==true:
		ant_num = ant_num*2
		ant2_num = round(ant2_num/2)
		ant3_num = round(ant3_num/2)
		ant_num_m = ant_num_m*2
		ant2_num_m = round(ant2_num_m/2)
		ant3_num_m = round(ant3_num_m/2)
		artifacts_on[2]=false
	if artifacts_on[3]==true:
		ant_atk_type[0]=ant_atk_type[0]*2
		ant_atk_type[1]=ant_atk_type[1]*2
		ant_atk_type[2]=ant_atk_type[2]*2
		ant_type_health_ally[0]=round(ant_type_health_ally[0]/2)
		ant_type_health_ally[1]=round(ant_type_health_ally[1]/2)
		ant_type_health_ally[2]=round(ant_type_health_ally[2]/2)
		artifacts_on[3]=false
	if artifacts_on[4]==true:
		wolf_count+=1
		wolf_on=true
		artifacts_on[4]=false
	if artifacts_on[5]==true:
		taxed=true
		taxation+=10
		artifacts_on[5]=false
	if artifacts_on[6]==true:
		thorn_on=true
		thorn_cnt+=1
		artifacts_on[6]=false
	if artifacts_on[7]==true:
		ant_num=round(ant_num*1.25)
		ant_num_m=round(ant_num_m*1.25)
		ant2_num=round(ant2_num*1.25)
		ant2_num_m=round(ant2_num_m*1.25)
		ant3_num=round(ant3_num*1.25)
		ant3_num_m=round(ant3_num_m*1.25)
		artifacts_on[7]=false
	if artifacts_on[8]==true:
		ant_atk_type[0]=round(ant_atk_type[0]*ant_num*1.25)
		ant_type_health_ally[0]=round(ant_type_health_ally[0]*ant_num*1.25)
		ant_num=1
		only_one=true
		artifacts_on[8]=false
	if artifacts_on[9]==true:
		insp_cnt+=1
		inspiration=true
		artifacts_on[9]=false
	if only_one==true:
		if ant_num!=1:
			ant_num=1
	if wolf_on==true:
		if ((ant_exist==true and (ant_exist2==false and ant_exist3==false)) or (ant_exist2==true and (ant_exist==false and ant_exist3==false)) or (ant_exist3==true and (ant_exist2==false and ant_exist==false))) and start==true:
			atk_mult=(0.5*wolf_count)+1
			health_mult=(0.5*wolf_count)+1
			wolf_act=true
		else:
			atk_mult=1
			health_mult=1
			wolf_act=false
	if inspiration==true:
		ant_atk_mult=1+ant_num*insp_cnt/100
		ant2_atk_mult=1+ant2_num*insp_cnt/100
		ant3_atk_mult=1+ant3_num*insp_cnt/100
	#print(ant_atk_mult)
	#print(atk_mult)
	#print(health_mult)
	#print(ant_exist)
	#print(ant_type_health_ally)
	if ant_atk_type[0]<1:
		ant_atk_type[0]=1
	if ant_atk_type[1]<1:
		ant_atk_type[1]=1
	if ant_atk_type[2]<1 and dung_atk==false:
		ant_atk_type[2]=1
	if ant_type_health_ally[0]<1:
		ant_type_health_ally[0]=1
	if ant_type_health_ally[1]<1:
		ant_type_health_ally[1]=1
	if ant_type_health_ally[2]<1:
		ant_type_health_ally[2]=1
	if ant_num<0:
		ant_num=0
	if ant2_num<0:
		ant2_num=0
	if ant3_num<0:
		ant3_num=0
	if start==false:
		if act==0:
			Act1_lvl_antnum = [[15,-1,-1],[10,10,-1],[10,-1,-1],[10,-1,-1],[10,5,-1],[5,5,-1],[5,10,-1],[2,7,-1]]
		if act==1:
			Act1_lvl_antnum = [[15,5,5],[20,10,-1],[10,10,10],[20,-1,-1],[20,-1,-1],[10,10,-1],[10,5,-1],[10,10,10]]
			Act1_lvl_anttype = [[0,1,1],[2,1],[1,0,2],[3],[4],[4,3],[4,1],[0,0,0]]
			Act1_positions = [[Vector2(578,246),Vector2(385,90),Vector2(850,90)],[Vector2(580,260),Vector2(580,136)],[Vector2(575,100),Vector2(343,224),Vector2(880,224)],[Vector2(578,153)],[Vector2(578,153)],[Vector2(300,90),Vector2(850,90)],[Vector2(577,219),Vector2(850,100)],[Vector2(290,220),Vector2(577,220),Vector2(850,220)]]
			rewards = [[60,20,10,0],[70,0,20,0],[50,10,10,10],[60,3,3,3],[60,3,3,3],[70,6,6,6],[60,0,10,0],[60,30,0,0]]
		if act==2:
			Act1_lvl_antnum = [[10,10,15],[15,15,10],[15,10,10],[10,10,10],[10,10,10],[20,10,10],[20,10,10],[10,10,10]]
			Act1_lvl_anttype = [[1,1,4],[3,3,3],[2,4,1],[1,1,1],[4,4,4],[1,3,4],[2,1,1],[2,2,2]]
			Act1_positions = [[Vector2(334,90),Vector2(850,90),Vector2(580,250)],[Vector2(350,240),Vector2(580,240),Vector2(850,240)],[Vector2(575,240),Vector2(745,174),Vector2(380,90)],[Vector2(258,90),Vector2(580,90),Vector2(860,90)],[Vector2(350,240),Vector2(580,240),Vector2(850,240)],[Vector2(300,90),Vector2(580,200),Vector2(750,160)],[Vector2(577,219),Vector2(850,100),Vector2(300,100)],[Vector2(350,240),Vector2(580,240),Vector2(850,240)]]
			rewards = [[80,0,20,0],[90,10,20,10],[90,0,15,15],[80,0,30,0],[90,10,10,10],[100,6,20,6],[90,0,20,10],[70,0,0,30]]
		if act>=3:
			Act1_lvl_antnum = [[10,10,15],[15,15,10],[15,10,10],[10,10,10],[10,10,10],[20,10,10],[20,10,10],[10,10,10],[-1,-1,-1]]
			Act1_lvl_anttype = [[1,1,4],[3,3,3],[2,4,1],[1,1,1],[4,4,4],[1,3,4],[2,1,1],[2,2,2],[]]
			Act1_positions = [[Vector2(334,90),Vector2(850,90),Vector2(580,250)],[Vector2(350,240),Vector2(580,240),Vector2(850,240)],[Vector2(575,240),Vector2(745,174),Vector2(380,90)],[Vector2(258,90),Vector2(580,90),Vector2(860,90)],[Vector2(350,240),Vector2(580,240),Vector2(850,240)],[Vector2(300,90),Vector2(580,200),Vector2(750,160)],[Vector2(577,219),Vector2(850,100),Vector2(300,100)],[Vector2(350,240),Vector2(580,240),Vector2(850,240)],[]]
			rewards = [[80,0,20,0],[90,10,20,10],[90,0,15,15],[80,0,30,0],[90,10,10,10],[100,6,20,6],[90,0,20,10],[70,0,0,30],[0,0,0,0]]
		var ally1_pos = Vector2(-1000,-1000)
		var ally2_pos = Vector2(-1000,-1000)
		var ally3_pos = Vector2(-1000,-1000)
	if ant_exist==false:
		ally1_pos = Vector2(-1000,-1000)
	if ant_exist2==false:
		ally2_pos = Vector2(-1000,-1000)
	if ant_exist3==false:
		ally3_pos = Vector2(-1000,-1000)
	if ant_exist==false and ant_exist2==false and ant_exist3==false and start==true:
		enemy1_pos = Vector2(-1000,-1000)
		enemy2_pos = Vector2(-1000,-1000)
		enemy3_pos = Vector2(-1000,-1000)
		ally1_pos = Vector2(-1000,-1000)
		ally2_pos = Vector2(-1000,-1000)
		ally3_pos = Vector2(-1000,-1000)
		ant_exist = false
		ant_exist2 = false
		ant_exist3 = false
		ant_num = 0
		ant2_num = 0
		ant3_num = 0
		ant_num_m = 0
		ant2_num_m = 0
		ant3_num_m = 0
		Act_progress=1
		Act1_level_type=0
		cache1
		cache2
		cache3
		cache4
		enemy1_cache
		enemy2_cache
		enemy3_cache
		curreny = 200
		other_path = false
		ant_atk_type = [2,3,1]
		ant_atk_type_enemy = [2,3,1,2,2]
		difficulty_mod = 2
		artifacts_on = [false,false,false,false,false,false,false,false,false,false]
		artifacts = ["Royal Honey","Dung Beetle Shell","Mitosis serum","Glass canon","Wolf Tooth","Tax documents","Rose Thorn","Rallying Banner","Super potion","Inspiring Speech"]
		artifacts_desc = [" Drinking it seems to make your\nCarpenter ants more powerful","Hard shell that can be used by turtle ants\nbut it seems too heavy to deal damage with","Can duplicate your fire ants\nbut requires blood from you other 2","Doubles your units attack\nbut halves their health","+50% damage and health if only\none type of unit on the field","Tax your units and\nget money after each room","Cause your enemies to take damage\nwhen attacking your units","Gets some units to join you","combines all the fire ants into one\ncombining their stats and multiplies it by 1.25\nbut you can no longer gain any fire ants","ants deal more damage the more they are"]
		artifacts_cost = [140,100,110,125,130,200,130,175,250,130]
		dung_atk =false
		wolf_on = false
		wolf_count = 0
		wolf_act = false
		atk_mult = 1
		health_mult = 1
		taxation = 0
		taxed = false
		thorn_on = false
		thorn_cnt = 0
		only_one = false
		inspiration = false
		ant_atk_mult = 1
		ant2_atk_mult = 1
		ant3_atk_mult = 1
		insp_cnt = 0
		act = 0
		map_generation = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
		Act1_lvl_antnum = [[15,-1,-1],[10,10,-1],[10,-1,-1],[10,-1,-1],[10,5,-1],[5,5,-1],[5,10,-1],[2,7,-1]]
		Act1_lvl_anttype = [[0],[0,0],[1],[2],[0,1],[1,1],[2,0],[2,1]]
		Act1_positions = [[Vector2(578,153)],[Vector2(359,146),Vector2(855,146)],[Vector2(578,103)],[Vector2(578,153)],[Vector2(870,90),Vector2(467,213)],[Vector2(300,90),Vector2(850,90)],[Vector2(577,219),Vector2(850,100)],[Vector2(577,219),Vector2(577,90)]]
		ant_type_health = [9,3,15,6,9]
		ant_type_health_ally = [9,3,15]
		rewards = [[40,10,0,0],[45,10,0,0],[40,0,5,0],[40,0,0,5],[50,7,2,0],[50,0,7,0],[50,5,0,5],[40,0,4,2]]
