extends ReferenceRect

@onready var h_box_container = $HBoxContainer
@onready var bar = $Bar

@export var color: Color
@export var refill_rate = 1
@export var increase_amount = 10
@export var decrease_amount = 10
@export var increase_delta_amount = 1
@export var decrease_delta_amount = 1

func _ready():
	var style_box = StyleBoxFlat.new()
	style_box.bg_color = color
	bar.add_theme_stylebox_override("fill", style_box)
	h_box_container.modulate = color

func _process(delta):
	bar.value = min(bar.value + refill_rate * delta, bar.max_value)


func _on_button_minus_pressed():
	bar.value = max(bar.value - decrease_amount, bar.min_value)


func _on_button_plus_pressed():
	bar.value = min(bar.value + increase_amount, bar.max_value)


func _on_button_minus_delta_pressed():
	refill_rate -= decrease_delta_amount


func _on_button_plus_delta_pressed():
	refill_rate += increase_delta_amount
