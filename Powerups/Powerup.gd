extends Area2D

var payload = null

var payloads = [
	[load("res://Powerups/Payload_Grow.tscn"),load("res://Assets/element_blue_diamond_glossy.png")]
	,[load("res://Powerups/Payload_GrowBall.tscn"),load("res://Assets/element_green_diamond_glossy.png")]
	,[load("res://Powerups/Payload_SlowBall.tscn"),load("res://Assets/element_red_diamond_glossy.png")]
	,[load("res://Powerups/Payload_AddBall.tscn"),load("res://Assets/element_yellow_diamond_glossy.png")]
]

var grav_force = 1.0
var velocity = Vector2.ZERO

func _ready():
	randomize()
	var p = randi_range(0,len(payloads)-1)
	payload = payloads[p][0]
	$Sprite2D.texture = payloads[p][1]

func _physics_process(_delta):
	position += velocity
	velocity.y += grav_force
	if position.y > Global.VP.y + 100:
		queue_free()

func _on_Powerup_body_entered(body):
	if body.name == "Paddle":
		if payload != null:
			body.powerup(payload.instantiate())
			$Sprite2D.hide()
