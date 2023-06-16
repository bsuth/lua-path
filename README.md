# lua-path

Helper functions for manipulating file paths. Works with Lua 5.1+ and LuaJIT.

Only `path.lua` is required. The source file (`path.erde`) is written in
[Erde](https://erde-lang.github.io/) and compiled to Lua.

## API

- [`path.separator`](#pathseparator)
- [`path.dedup(s)`](#pathdedups)
- [`path.join(...)`](#pathjoin)
- [`path.trim(...)`](#pathtrim)
- [`path.pad(...)`](#pathpad)
- [`path.lead(...)`](#pathlead)
- [`path.trail(...)`](#pathtrail)
- [`path.basename(s)`](#pathbasenames)
- [`path.dirname(s)`](#pathdirnames)

### `path.separator`

The path separator for the current platform.

```lua
local path = require('path')
print(path.separator) -- '/' on unix
print(path.separator) -- '\' on windows
```

### `path.dedup(s)`

Remove redundant path separators.

```lua
local path = require('path')
print(path.dedup('/////a///b')) -- /a/b
```

### `path.join(...)`

Combine multiple paths together.

```lua
local path = require('path')
print(path.join('a', 'b', 'c')) -- a/b/c
```

### `path.trim(...)`

Join paths and remove leading / trailing path separators.

```lua
local path = require('path')
print(path.trim('/a/b/')) -- a/b
print(path.trim('/a/', '/b/')) -- a/b
```

### `path.pad(...)`

Join paths and add leading / trailing path separators.

```lua
local path = require('path')
print(path.pad('a/b')) -- /a/b/
print(path.pad('a', 'b')) -- /a/b/
```

### `path.lead(...)`

Join paths, add a leading path separator, and remove trailing path separators.

```lua
local path = require('path')
print(path.lead('a/b')) -- /a/b
print(path.lead('/a/b/')) -- /a/b
print(path.lead('a', 'b')) -- /a/b
```

### `path.trail(...)`

Join paths, remove leading path separators, and add a trailing path separator.

```lua
local path = require('path')
print(path.trail('a/b')) -- a/b/
print(path.trail('/a/b/')) -- a/b/
print(path.trail('a', 'b')) -- a/b/
```

### `path.basename(s)`

Get the basename of a path.

```lua
local path = require('path')
print(path.basename('/a/b')) -- b
print(path.basename('/a/b/')) -- (empty string)
```

### `path.dirname(s)`

Get the dirname of a path.

```lua
local path = require('path')
print(path.basename('/a/b')) -- /a/
print(path.basename('/a/b/')) -- /a/b/
```
