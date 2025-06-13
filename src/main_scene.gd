extends Node2D

@onready var tab_container = $CanvasLayer/TabContainer
@onready var delta_button = %DeltaButton

var tab_scene = preload("res://src/tab.tscn")

var delta_amounts = [
	"5",
	"10"
]
var current_delta = 0

func _ready():
	delta_button.text = delta_amounts[current_delta]

func _on_add_tab_button_pressed():
	var new_node = tab_scene.instantiate()
	var zeros = "00"
	var i = 10
	var num = 0
	if tab_container.get_child_count() > 0:
		num = int(tab_container.get_child(tab_container.get_child_count() - 1).name)
	while i <= num + 1:
		zeros = zeros.left(-1)
		if zeros.length() == 0:
			break
		i *= 10
	new_node.name = zeros + str(num + 1)
	tab_container.add_child(new_node)
	tab_container.get_child(-1).change_delta(int(delta_amounts[current_delta]))


func _on_remove_tab_button_pressed():
	tab_container.remove_child(tab_container.get_child(tab_container.current_tab))


func _on_delta_button_pressed():
	current_delta = (current_delta + 1) % delta_amounts.size()
	delta_button.text = delta_amounts[current_delta]
	for tab in tab_container.get_children():
		tab.change_delta(int(delta_amounts[current_delta]))
