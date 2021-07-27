extends Node

func _ready():	
	var file = File.new()
	file.open(meta,file.READ)
	print(file.get_path_absolute())
	var content = file.get_as_text()
	var lines = content.split("\n")
	
	var files = []
	var dir = Directory.new()
	dir.open("../")
	dir.list_dir_begin()
	
	while true:
		var fil = dir.get_next()
		if fil == "":
			break
		elif not fil.begins_with("."):
			files.append(fil)
			print(fil)
	
	dir.list_dir_end()
	
	print(content)
	
	for l in lines:
		for line in l.split(";"):
			if !line.begins_with("//") and !line.begins_with(" //"):
				if !line.empty():
					var variable = line.split(":")
					
					if variable[1].begins_with("{"):
						variable[1] = variable[1].replace("{","")
						variable[1] = variable[1].replace("}","")
						var temp = variable[1].split(",")
						temp = Array(temp)
						for t in temp:
							levels.append(t.replace("\"",""))
	ready=true

var meta="../deathIsKeyLevels/_metadata"

var ready=false
var levels=[]
var nextLevel=0