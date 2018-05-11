# Typical lobby implementation, imagine this being in /root/lobby

extends Node

# Connect all functions

var SERVER_IP = "165.227.45.244"
var SERVER_PORT = 8080
var MAX_PLAYERS = 2

var username = "Jed"

# Player info, associate ID to data
var player_info = {}
# Info we send to other players
var my_info = { 'name' : username, 'favorite_color' : Color8(255, 0, 255) }

func _ready():
	seed(OS.get_unix_time())
	
	if OS.get_environment("JED_SERVER") == "1":
		print("Running as server")
		var peer = NetworkedMultiplayerENet.new()
		peer.create_server(SERVER_PORT, MAX_PLAYERS)
		get_tree().set_network_peer(peer)
	else:
		username = NameGenerator.gen_name()
		my_info['name'] = username
	
	get_tree().connect("network_peer_connected", self, "_player_connected")
	get_tree().connect("network_peer_disconnected", self, "_player_disconnected")
	get_tree().connect("connected_to_server", self, "_connected_ok")
	get_tree().connect("connection_failed", self, "_connected_fail")
	get_tree().connect("server_disconnected", self, "_server_disconnected")

func _player_connected(id):
	pass

func _player_disconnected(id):
	if player_info.has(id):
		print("Player left: ", player_info[id], " ", id)
		
		rpc("unregister_player", id, player_info[id])
		if id in player_info.keys():
			print("Safe removal")
			player_info.erase(id)

func _connected_ok():
	rpc("register_player", get_tree().get_network_unique_id(), my_info)
	print("I'm connected, do others know about me?")

func _server_disconnected():
	print("kicked offline by server")
	rpc("unregister_player", get_tree().get_network_unique_id(), my_info)

func _connected_fail():
	print("Connection Failure")

remote func register_player(id, info):
	# Store the info
	player_info[id] = info
	# If I'm the server, let the new guy know about existing players
	if get_tree().is_network_server():
		print("Got new player: ", info['name']+  " | ", id)
	# Send my info to new player
		rpc_id(id, "register_player", 1, my_info)
		# Send the info of existing players
		for peer_id in player_info.keys():
			print("Sending: ", player_info[peer_id]['name'])
			rpc_id(id, "register_player", peer_id, player_info[peer_id])
			rpc_id(peer_id, "register_player", id, player_info[id])
	
	# Call function to update lobby UI here
	for x in $v.get_children():
		$v.remove_child(x)
	for k in player_info.keys():
		var player = player_info[k]
		var node = Label.new()
		node.name = str(id)
		node.text = player["name"]
		$v.add_child(node)

sync func unregister_player(id, _user):
	if id in player_info.keys():
		player_info.erase(id)
	remove_ui_by_name(_user['name'])
	# Call function to update lobby UI here

func _on_connect_pressed():
	if get_tree().get_network_unique_id() != 0:
		rpc("unregister_player", get_tree().get_network_unique_id(), my_info)
		get_tree().network_peer = null
	for x in $v.get_children():
		$v.remove_child(x)
	username = NameGenerator.gen_name()
	my_info['name'] = username
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client(SERVER_IP, SERVER_PORT)
	get_tree().set_network_peer(peer)
	print("As a Client, My info is: ", username, "  ", get_tree().get_network_unique_id())

func add_ui_by_name(_username):
	pass

func add_ui_from_players(players):
	for x in $v.get_children():
		$v.remove_child(x)
	for k in players.keys():
		var player = players[k]
		var node = Label.new()
		node.name = str(player['name'])
		node.text = player["name"]
		$v.add_child(node)
	
func remove_ui_by_name(_username):
	for x in $v.get_children():
		if x.text == _username:
			$v.remove_child(x)