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
		expect(@board.board).toEqual([])
		board = [
			[ 1, 2, 3 ]
			[ 4, 5, 6 ]
		]
		@board.setBoard(board)
		expect(@board.board).toEqual(board)
		expect(@board.width).toEqual(2)
		expect(@board.height).toEqual(3)
