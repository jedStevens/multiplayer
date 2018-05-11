extends Control

signal message_sent(msg)

func on_input_pressed():
	rpc("send_message", $input.text)

sync func send_message(msg):
	print("loop")
	rpc("log_text", msg)

sync func log_text(msg):
	print("log")
	$log.text = $log.text + "\n" + msg

func _on_send_pressed():
	print("signal")
	send_message($input.text)
