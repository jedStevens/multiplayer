extends Control

signal message_sent(msg)

func on_input_pressed():
	rpc("send_message", $input.text)

sync func send_message(msg):
	rpc("log_text", msg)

sync func log_text(msg, id_from):
	var header = $log.text + "\n" + get_parent().player_info[from_id]['name'].to_upper()
	$log.text = header + ":  " +msg

func _on_send_pressed():
	send_message($input.text)
