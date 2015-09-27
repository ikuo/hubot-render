expect = require('chai').use(require('chai-as-promised')).expect
hubot = require('hubot-mock-adapter-as-promised')

describe 'render', ->
  hubot.includeContext ->
    robot.loadFile(require('path').resolve('.', 'src'), 'render.coffee')

  context 'with single-line template', ->
    beforeEach ->
      robot.brain.set('remember', tpl1: '{{title}} spends {{calc}}')

    it 'rendereds the template', ->
      expect(hubot.text('hubot render tpl1 title:Joe, calc:6'))
        .to.eventually.match(/Joe spends 6/)

  context 'with multi-line template', ->
    beforeEach ->
      robot.brain.set('remember', tpl1: "{{title}} spends\n{{calc}} dollars.")

    it 'rendereds the template', ->
      expect(hubot.text('hubot render tpl1 title:Joe, calc:6'))
        .to.eventually.match(/Joe spends\n6 dollars./)

  context 'with non-existent template', ->
    it 'notifies non-existent template', ->
      expect(hubot.text('hubot render tpl1 title:Joe, calc:6'))
        .to.eventually.match(/Unknown template `tpl1`/)
