@tool
extends ConfirmationDialog


@export var line_edit : LineEdit

var layer_uid : Vector3i = Vector3i.ZERO
var layer_name : String = ""

static var last_position : Vector2i = Vector2i.ZERO


func _init():
	visible = false
	add_to_group("pixelpen_popup")


func _ready():
	if not PixelPen.state.need_connection(get_parent().get_window()):
		return
	if layer_uid != Vector3i.ZERO:
		var index_image = (PixelPen.state.current_project as PixelPenProject).get_index_image(layer_uid)
		if index_image == null:
			hide()
			queue_free()
		else:
			layer_name = index_image.label
	else:
		line_edit.placeholder_text = str("Layer ",(PixelPen.state.current_project as PixelPenProject).layer_index_counter + 1)
	line_edit.text = layer_name


func _on_confirmed():
	if layer_uid != Vector3i.ZERO and line_edit.text != layer_name and line_edit.text != "":
		(PixelPen.state.current_project as PixelPenProject).create_undo_layers("Layer Properties", func ():
				PixelPen.state.layer_items_changed.emit()
				PixelPen.state.project_saved.emit(false)
				)
		(PixelPen.state.current_project as PixelPenProject).get_index_image(layer_uid).label = line_edit.text
		(PixelPen.state.current_project as PixelPenProject).create_redo_layers(func ():
				PixelPen.state.layer_items_changed.emit()
				PixelPen.state.project_saved.emit(false)
				)
		PixelPen.state.layer_items_changed.emit()
		PixelPen.state.project_saved.emit(false)
	else:
		layer_name = line_edit.text
	last_position = position
	hide()
	queue_free()


func _on_canceled():
	last_position = position
	hide()
	queue_free()


func popup_in_last_position():
	if last_position != Vector2i.ZERO:
		popup(Rect2i(last_position, size))
	else:
		popup_centered()
