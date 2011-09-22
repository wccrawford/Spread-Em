class @Engine
	constructor: ->
		@modes = []
		@sounds = []
		@keysDown = []
		@fps = 0
		@lastFps = 0
		
		@framerate = 60
		@framelapse = 1000 / @framerate

		date = new Date
		@time = date.getTime()
		@fpsTime = date.getTime()

		@canvas = document.getElementById('canvas')

	addMode: (mode) ->
		@modes.push mode
	
	removeMode: ->
		if (@modes.length > 0)
			@modes.pop
		else
			null
	
	currentMode: ->
		if (@modes.length > 0)
			@modes[@modes.length - 1]
		else
			null

	pause: =>
		if (@loopRef != null)
			clearTimeout(@loopRef)
			@loopRef = null

	start: =>
		if(@loopRef == null)
			@loopRef = setTimeout =>
				@main()
			, 1

	getKeys: (event) =>
		if @keysDown.indexOf(event.keyCode) == -1
			@keysDown.push event.keyCode
	
	clearKeys: (event) =>
		index = @keysDown.indexOf(event.keyCode)
		if index != -1
			@keysDown[index..index] = []

	main: ->
		date = new Date()
		if ((date.getTime() - @time) >= @framelapse)
			@currentMode().draw(@canvas.getContext('2d'), @canvas.width, @canvas.height)
			@time += @framerate

			@fps++
			if ((date.getTime() - @fpsTime) >= 1000)
				@fpsTime += 1000
				@lastFps = @fps
				@fps = 0

		@currentMode().update(@keysDown)

		@loopRef = setTimeout =>
			@main()
		, 1

	play: (sound) ->
		if(@audio[sound] != undefined)
			@audio[sound].play()
