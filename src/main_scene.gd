extends Node2D

@onready var tab_container = $CanvasLayer/TabContainer

var tab_scene = preload("res://src/tab.tscn")


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


func _on_remove_tab_button_pressed():
	tab_container.remove_child(tab_container.get_child(tab_container.current_tab))
