class @Board
	constructor: ->
		@setBoard []
	
	setBoard: (board) ->
		if @isValidBoard(board)
			size = @getBoardSize(board)
			@width = size[0]
			@height = size[1]
			@board = board
		else
			@width = 0
			@height = 0
			@board = []

	isValidBoard: (board) ->
		total = 0
		for row in board
			for column in row
				total = total + column

		size = @getBoardSize(board)
		if (total == (size[0] * size[1]))
			true
		else
			false
	
	getBoardSize: (board) ->
		width = board.length
		if(width > 0)
			height = board[0].length
		else
			height = 0

		return [width, height]
		
