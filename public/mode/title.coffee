class @Mode.Title
	constructor: (@engine) ->

	draw: (context, width, height) ->
		bigTextHeight = height / 5
		smallTextHeight = height / 15
		border = height / 20

		context.fillStyle = "#000"
		context.fillRect(0, 0, width, height)

		context.fillStyle = "#FFF"
		context.textAlign = "center"
		context.textBaseline = "top"
		context.font = bigTextHeight + "px Arial"
		context.fillText('Spread', (width / 2), border)
		context.fillText('\'Em', (width / 2), border + bigTextHeight)

		context.textAlign = "center"
		context.textBaseline = "bottom"
		context.font = smallTextHeight + "px Arial"
		context.fillText('Press space to continue...', (width / 2), height - border)

	update: ->
		if @engine.keysDown.count > 0
			@showMenu
			return

		for event in @engine.mouseEvents
			if event.type == 'mouseup' && event.button == 0
				@showMenu()
				return
	
	showMenu: ->
		@engine.addMode new Mode.Menu(@engine)
