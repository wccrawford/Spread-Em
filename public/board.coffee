class @Board
	constructor: ->
		@setBoard []
	
	setBoard: (@board) ->
		@width = @board.length
		if(@width > 0)
			@height = @board[0].length
		else
			@height = 0

		@board

