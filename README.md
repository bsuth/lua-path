# lua-path

Helper functions for manipulating file paths. Works with Lua 5.1+ and LuaJIT.

Only `path.lua` is required. The source file (`path.erde`) is written in
[Erde](https://erde-lang.github.io/) and compiled to Lua.

## API

- [`path.separator`](#pathseparator)
- [`path.dedup(s)`](#pathdedups)
- [`path.format(s, left, right)`](#pathformats-left-right)
- [`path.trim(s, ltrim = true, rtrim = true)`](#pathtrims-ltrim--true-rtrim--true)
- [`path.pad(s, lpad = true, rpad = true)`](#pathpads-lpad--true-rpad--true)
- [`path.join(...)`](#pathjoin)
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

### `path.format(s, left, right)`

Enforce leading / trailing path separators.

```lua
local path = require('path')
print(path.format('a/b', false, false)) -- a/b
print(path.format('a/b', false, true)) -- a/b/
print(path.format('a/b', true, false)) -- /a/b
print(path.format('a/b', true, true)) -- /a/b/
```

### `path.trim(s, ltrim = true, rtrim = true)`

Remove leading / trailing path separators

```lua
local path = require('path')
print(path.trim('/a/b/')) -- a/b
print(path.trim('/a/b/', false)) -- /a/b
print(path.trim('/a/b/', true, false)) -- a/b/
```

### `path.pad(s, lpad = true, rpad = true)`

Add leading / trailing path separators

```lua
local path = require('path')
print(path.pad('a/b')) -- /a/b/
print(path.pad('a/b', false)) -- a/b/
print(path.pad('a/b', true, false)) -- /a/b
```

### `path.join(...)`

Combine multiple paths together.

```lua
local path = require('path')
print(path.join('a', 'b', 'c')) -- a/b/c
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
