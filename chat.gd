extends Control

signal message_sent(msg)

func on_input_pressed():
	rpc("send_message", $input.text)

sync func send_message(msg):
	$log.text = $log.text + "\n" + msg