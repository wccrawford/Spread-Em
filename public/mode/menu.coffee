class @Mode.Menu
	constructor: (@engine) ->
		@buttons = [
			new Button {
				text: "Easy"
				x: 50
				y: 50
				width: 100
				height: 50
			}
		]
		@buttons[0].click = (x, y, button) =>
			console.log "test" + x

	update: ->
		while (event = @engine.mouseEvents.pop())
			for button in @buttons
				if button.collidesWith(event.x, event.y, event.x, event.y)
					button.click(event.x - button.location[0], event.y - button.location[0], event.button)

	draw: (context, width, height) ->
		context.fillStyle = '#000'
		context.fillRect(0, 0, width, height)

		for button in @buttons
			button.draw(context)
		
