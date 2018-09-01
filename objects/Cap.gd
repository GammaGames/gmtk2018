extends "res://Removable.gd"

func check_exit():
	return !$"..".cap

func grab():
	$"..".cap = false
