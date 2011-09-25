class @Tile
	constructor: (@engine, @board, initialValue) ->
		@color = null
		@initialCount = initialValue
		if(initialValue > 0)
			@color = @board.colors
			@board.colors++
		@stack = false
		@location = [0, 0]

	draw: ->

	update: ->
