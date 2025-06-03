extends ProgressBar

@export var color: Color
@export var refill_rate = 10
@export var increase_amount = 10
@export var decrease_amount = 10

func _ready():
	modulate = color

func _process(delta):
	value = min(value + refill_rate * delta, max_value)

func increase_value():
	value = min(value + increase_amount, max_value)

func decrease_value():
	value = max(value - decrease_amount, min_value)


func _on_button_minus_pressed():
	decrease_value()


func _on_button_plus_pressed():
	increase_value()
