class @Game
	constructor: ->
		@engine = new Engine
		@engine.addMode(new Mode.Title(@engine))

		@engine.main()
