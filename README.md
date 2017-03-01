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
```
{K} = require '@coffee-toolbox/Continuation'

task1 = (ret)->
	setTimeout ->
		ret 'something'
	, 100

task2 = (ret, v)->
	setTimeout ->
		ret v + ' mod1'
	, 100

task3 = new K (ret, v)->
	ret v + ' mod2'

log = (ret, v)->
	console.log v

K.compose([task1, task2, task3, log]).done()
new K(task1).c(task2).c(task3).c(log).done()
# something
# something
# something mod1 mod2
# something mod1 mod2
```
