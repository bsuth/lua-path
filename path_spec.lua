local path = require('path')

spec('dedup', function()
  assert.are.equal('a', path.dedup('a'))

  assert.are.equal('/a', path.dedup('/a'))
  assert.are.equal('/a', path.dedup('///a'))
  assert.are.equal('/a/b/c', path.dedup('//a/b///c'))

  assert.are.equal('a/', path.dedup('a/'))
  assert.are.equal('a/', path.dedup('a///'))
  assert.are.equal('a/b/c/', path.dedup('a/b///c//'))

  assert.are.equal('/a/', path.dedup('/a/'))
  assert.are.equal('/a/', path.dedup('/a///'))
  assert.are.equal('/a/', path.dedup('///a/'))
  assert.are.equal('/a/b/c/', path.dedup('/a/b///c//'))
  assert.are.equal('/a/b/c/', path.dedup('//a/b///c/'))
end)

spec('join', function()
  assert.are.equal('', path.join())
  assert.are.equal('a', path.join('a'))

  assert.are.equal('/a', path.join('/a'))
  assert.are.equal('a/', path.join('a/'))
  assert.are.equal('/a/', path.join('/a/'))

  assert.are.equal('a/b', path.join('a', 'b'))
  assert.are.equal('/a/b', path.join('/a', 'b'))
  assert.are.equal('a/b', path.join('a/', 'b'))
  assert.are.equal('/a/b', path.join('/a/', 'b'))

  assert.are.equal('a/b', path.join('a', '/b'))
  assert.are.equal('/a/b', path.join('/a', '/b'))
  assert.are.equal('a/b', path.join('a/', '/b'))
  assert.are.equal('/a/b', path.join('/a/', '/b'))

  assert.are.equal('a/b/', path.join('a', 'b/'))
  assert.are.equal('/a/b/', path.join('/a', 'b/'))
  assert.are.equal('a/b/', path.join('a/', 'b/'))
  assert.are.equal('/a/b/', path.join('/a/', 'b/'))

  assert.are.equal('a/b/', path.join('a', '/b/'))
  assert.are.equal('/a/b/', path.join('/a', '/b/'))
  assert.are.equal('a/b/', path.join('a/', '/b/'))
  assert.are.equal('/a/b/', path.join('/a/', '/b/'))

  assert.are.equal('a/b/c', path.join('a', '//b/', '//c'))
end)

spec('trim', function()
  assert.are.equal('', path.trim())
  assert.are.equal('a', path.trim('a'))

  assert.are.equal('a', path.trim('/a'))
  assert.are.equal('a', path.trim('///a'))
  assert.are.equal('a/b/c', path.trim('//a/b///c'))

  assert.are.equal('a', path.trim('a/'))
  assert.are.equal('a', path.trim('a///'))
  assert.are.equal('a/b/c', path.trim('a/b///c//'))

  assert.are.equal('a', path.trim('/a/'))
  assert.are.equal('a', path.trim('/a///'))
  assert.are.equal('a', path.trim('///a/'))
  assert.are.equal('a/b/c', path.trim('/a/b///c//'))
  assert.are.equal('a/b/c', path.trim('//a/b///c/'))

  assert.are.equal('a/b/c', path.trim('a', 'b', 'c'))
end)

spec('pad', function()
  assert.are.equal('/', path.pad())
  assert.are.equal('/a/', path.pad('a'))

  assert.are.equal('/a/', path.pad('/a'))
  assert.are.equal('/a/', path.pad('///a'))
  assert.are.equal('/a/b/c/', path.pad('//a/b///c'))

  assert.are.equal('/a/', path.pad('a/'))
  assert.are.equal('/a/', path.pad('a///'))
  assert.are.equal('/a/b/c/', path.pad('a/b///c//'))

  assert.are.equal('/a/', path.pad('/a/'))
  assert.are.equal('/a/', path.pad('/a///'))
  assert.are.equal('/a/', path.pad('///a/'))
  assert.are.equal('/a/b/c/', path.pad('/a/b///c//'))
  assert.are.equal('/a/b/c/', path.pad('//a/b///c/'))

  assert.are.equal('/a/b/c/', path.pad('a', 'b', 'c'))
end)

spec('lead', function()
  assert.are.equal('/', path.lead())
  assert.are.equal('/a', path.lead('a'))

  assert.are.equal('/a', path.lead('/a'))
  assert.are.equal('/a', path.lead('///a'))
  assert.are.equal('/a/b/c', path.lead('//a/b///c'))

  assert.are.equal('/a', path.lead('a/'))
  assert.are.equal('/a', path.lead('a///'))
  assert.are.equal('/a/b/c', path.lead('a/b///c//'))

  assert.are.equal('/a', path.lead('/a/'))
  assert.are.equal('/a', path.lead('/a///'))
  assert.are.equal('/a', path.lead('///a/'))
  assert.are.equal('/a/b/c', path.lead('/a/b///c//'))
  assert.are.equal('/a/b/c', path.lead('//a/b///c/'))

  assert.are.equal('/a/b/c', path.lead('a', 'b', 'c'))
end)

spec('trail', function()
  assert.are.equal('/', path.trail())
  assert.are.equal('a/', path.trail('a'))

  assert.are.equal('a/', path.trail('/a'))
  assert.are.equal('a/', path.trail('///a'))
  assert.are.equal('a/b/c/', path.trail('//a/b///c'))

  assert.are.equal('a/', path.trail('a/'))
  assert.are.equal('a/', path.trail('a///'))
  assert.are.equal('a/b/c/', path.trail('a/b///c//'))

  assert.are.equal('a/', path.trail('/a/'))
  assert.are.equal('a/', path.trail('/a///'))
  assert.are.equal('a/', path.trail('///a/'))
  assert.are.equal('a/b/c/', path.trail('/a/b///c//'))
  assert.are.equal('a/b/c/', path.trail('//a/b///c/'))

  assert.are.equal('a/b/c/', path.trail('a', 'b', 'c'))
end)

spec('basename', function()
  assert.are.equal('a', path.basename('a'))
  assert.are.equal('a', path.basename('/a'))
  assert.are.equal('', path.basename('a/'))
  assert.are.equal('', path.basename('/a/'))

  assert.are.equal('b', path.basename('a/b'))
  assert.are.equal('b', path.basename('/a/b'))
  assert.are.equal('', path.basename('a/b/'))
  assert.are.equal('', path.basename('/a/b/'))
end)

spec('dirname', function()
  assert.are.equal('', path.dirname('a'))
  assert.are.equal('/', path.dirname('/a'))
  assert.are.equal('a/', path.dirname('a/'))
  assert.are.equal('/a/', path.dirname('/a/'))

  assert.are.equal('a/', path.dirname('a/b'))
  assert.are.equal('/a/', path.dirname('/a/b'))
  assert.are.equal('a/b/', path.dirname('a/b/'))
  assert.are.equal('/a/b/', path.dirname('/a/b/'))
end)
