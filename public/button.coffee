class @Button
	constructor: (options) ->
		@fontSize = options['fontSize'] || 25
		@font = options['font'] || 'Arial'
		@text = options['text'] || 'Button'
		@location = [0, 0]
		@size = [1, 1]
		@location[0] = options['x'] || 0
		@location[1] = options['y'] || 0
		@size[0] = options['width'] || 1
		@size[1] = options['height'] || 1

	draw: (context) ->
		context.strokeStyle = '#FFF'
		context.strokeRect(@location[0] + 0.5, @location[1] + 0.5, @size[0], @size[1])

		if @text != null
			context.fillStyle = "#FFF"
			context.textAlign = "center"
			context.textBaseline = "middle"
			context.font = @fontSize + "px" + @font
			context.fillText(@text, @location[0] + (@size[0] / 2) + 0.5, @location[1] + (@size[1] / 2) + 0.5)
	
	click: (x, y, button) ->

	collidesWith: (x0, y0, x1, y1) ->
		localX0 = @location[0]
		localY0 = @location[1]
		localX1 = @location[0] + @size[0]
		localY1 = @location[1] + @size[1]

		if (((localX0 <= x0      <= localX1) ||
		(localX0      <= x1      <= localX1) ||
		(x0           <= localX0 <= x1) ||
		(x0           <= localX1 <= x1)) &&
		((localY0     <= y0      <= localY1) ||
		(localY0      <= y1      <= localY1) ||
		(y0           <= localY0 <= y1) ||
		(y0           <= localY1 <= y1)))
			return true
		else
			return false
		
