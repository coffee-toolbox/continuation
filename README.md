# Continuation
Handle callbacks in continuation

### NOTE
Do NOT download from npm!

Just add the dependency that use https git repo url as a version.

    "@coffee-toolbox/continuation": "https://github.com/coffee-toolbox/continuation.git"

npm is evil that it limit the publish of more than one project.
And its restriction on version number is terrible for fast development that
require local reference. (npm link sucks!)
[why npm link sucks](https://github.com/webpack/webpack/issues/554)

It ruined my productivity for a whole three days!

For any one who values his life, please be away from npm.

----

Example:
```coffeescript
{K} = require '@coffee-toolbox/continuation'

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
# something
# something
# something mod1 mod2
# something mod1 mod2
```
