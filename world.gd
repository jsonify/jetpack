extends Node2D

@onready var ground1 = $Ground/Ground1
@onready var ground2 = $Ground/Ground2
@onready var ground_width := $Ground/Ground1/Sprite2D
@onready var obsticle_timer := $ObsticleTimer
@onready var score_timer := $ScoreTimer

var pinky := preload("res://pinky.tscn")
var yeller := preload("res://yeller.tscn")
var speed := 80
var obsticles := [pinky, yeller]
var score = 0
		

func _ready():
	obsticle_timer.start()
	score_timer.start()

func _process(delta):
	move_ground(delta)
	keep_score()
	

func create_obsticle():
	var rand_obsticle = obsticles.pick_random()
	var obsticle = rand_obsticle.instantiate()
	obsticle.position = Vector2(500, randi_range(50, 150))
	add_child(obsticle)
	obsticle_timer.start()
	score_timer.start()
	

func move_ground(delta):
	ground1.position.x -= speed * delta
	ground2.position.x -= speed * delta
	if ground1.position.x <= -ground_width.texture.get_width():
		ground1.position.x = ground_width.texture.get_width()
	if ground2.position.x <= -ground_width.texture.get_width():
		ground2.position.x = ground_width.texture.get_width()
	
func keep_score():
	$Control/Score.text = str(score)

func _on_obsticle_timer_timeout():
	create_obsticle()


func _on_score_timer_timeout():
	score += 10
	print(score)
