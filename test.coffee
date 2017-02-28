{K} = require './Continuation.coffee'

gen = (k, v...)->
	setTimeout ->
		k 'test'
	, 10

mod1 = (k, v)->
	k v + ' mod1'

mod2 = (k, v)->
	setTimeout ->
		k v + ' mod2'
	, 500

mod12 = (k, v...)->
	mod1 (a)->
		mod2 k, a
	, v

mod12 console.log, 'test'

mod_1 = K.k (v)->
	v + ' mod1'

log = K.k console.log

t = K.c [mod_1, mod2, log]
K.run t, 'test'

