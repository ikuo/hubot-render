expect = require('chai').use(require('chai-as-promised')).expect
hubot = require('hubot-mock-adapter-as-promised')

describe 'render', ->
  hubot.includeContext ->
    robot.loadFile(require('path').resolve('.', 'src'), 'render.coffee')

  context 'valid template and values', ->
    it 'sends rendered template', ->
      expect(hubot.text('hubot render tpl1 title:Joe, calc:6'))
        .to.eventually.match(/Joe spends 6/)
