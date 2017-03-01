class K
	constructor: (@f)->
		undefined

	c: (n)->
		K.compose [this, n]

	@compose: (l)->
		l.reduce (s, e)->
			if s instanceof Function
				s = new K s
			if e instanceof Function
				e = new K e
			new K (k, v...)->
				s.f (a...)->
					e.f k, a...
				, v...

	done: ->
		@f K.id

	@id: (a)->
		a

module.exports =
	K: K
