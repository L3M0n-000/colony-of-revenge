extends Button
var price=40

func _on_pressed() -> void:
	if Global.curreny>=price:
		Global.curreny-=price
		$"../Button5".type=randi_range(0,len(Global.artifacts)-1)
		$"../Button5".show()
		$"../Button6".type=randi_range(0,len(Global.artifacts)-1)
		$"../Button6".show()
		$"../Button7".type=randi_range(0,len(Global.artifacts)-1)
		$"../Button7".show()
		price*=2

func _process(delta: float) -> void:
	text="REFRESH $"+str(price)
