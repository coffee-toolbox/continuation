class K

	@c: (list)->
		list.reduce (s, e)->
			(k, v...)->
				s (a)->
					e k, a
				, v...

	@k: (f)->
		(k, v...)->
			k f v...

	@id: (a)->
		a

	@run: (f, v...)->
		f K.id, v...

module.exports =
	K: K
