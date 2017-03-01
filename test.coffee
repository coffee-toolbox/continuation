{K} = require './Continuation.coffee'

task1 = (ret)->
	setTimeout ->
		ret 'something'
	, 100

task2 = new K (ret, v)->
	console.log v
	setTimeout ->
		ret v + ' mod1'
	, 100

mod2 = (v)->
	v + ' mod2'

log = (ret, v)->
	console.log v

K.compose([task1, task2.map(mod2), log]).done()
new K(task1).c(task2).map(mod2).c(log).done(console.log)
