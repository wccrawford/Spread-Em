{ Board } = require 'board'

describe 'board', ->
	beforeEach ->
		@board = new Board

	it 'should instantiate', ->
		expect(@board).toBeDefined()
		expect(@board.board).toEqual([])
		expect(@board.width).toEqual(0)
		expect(@board.height).toEqual(0)

	it 'should allow setting of a new board', ->
		board = [
			[ 0, 2, 2 ]
			[ 0, 2, 0 ]
		]
		@board.setBoard(board)
		expect(@board.board).toEqual(board)
		expect(@board.width).toEqual(2)
		expect(@board.height).toEqual(3)
	
	it 'should reject invalid boards', ->
		board = [
			[ 1, 2, 3 ]
			[ 4, 5, 6 ]
		]
		@board.setBoard(board)
		expect(@board.board).toEqual([])

	it 'should accept valid boards', ->
		board = [
			[ 0, 2, 2 ]
			[ 0, 2, 0 ]
		]
		@board.setBoard(board)
		expect(@board.board).toEqual(board)

