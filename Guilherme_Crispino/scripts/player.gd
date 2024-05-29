extends Area2D

signal hit
const SPEED := 400
@onready var screen_size = get_viewport_rect().size
@onready var anim = $anim
@onready var collision = $collision

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Input.get_vector("move_left","move_right","move_up","move_down")
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
		
	if velocity.x != 0:
		anim.play("move")
	elif velocity.y > 0:
		anim.play("move_down")
	elif  velocity.y < 0:
		anim.play("move_up")
	else:
		anim.play("idle")
			
	anim.flip_h = false if velocity.x > 0 else true
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)


#verificação de colisão bugs
func _on_body_entered(body):
	hide()
	hit.emit()
	collision.set_deferred("disabled", true)
