expect = require('chai').use(require('chai-as-promised')).expect
hubot = require('hubot-mock-adapter-as-promised')

describe 'render', ->
  hubot.includeContext ->
    robot.loadFile(require('path').resolve('.', 'src'), 'render.coffee')

  context 'hello', ->
    it 'registers a respond listener', ->
      expect(hubot.text('hubot render tpl1 title:Jane, calc:25'))
        .to.eventually.match(/Jane spends 25/)
