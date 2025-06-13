extends HBoxContainer

@onready var bars = [
	%"Bar1-1",
	%"Bar1-2",
	%"Bar2-1",
	%"Bar2-2"
]

@export var delta = 5

func change_delta(to: int):
	for bar in bars:
		bar.increase_amount = to
		bar.decrease_amount = to
