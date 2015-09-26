# Description
#   A hubot script to render template.
#   Templates should be written in [mustache](https://mustache.github.io/)
#   and be stored by hubot-remember-multiline module.
#
# Commands:
#   hubot render <name> - show content of a template
#   hubot render <name> key1:value1, key2:value2, ... - render a template
#
# Author:
#   Ikuo Matsumura <makiczar@gmail.com>

Mustache = require('mustache')
parser = require('csv-map-parser')

module.exports = (robot) ->
  robot.respond /render\s+(\w+)\s+(.+)/, (msg) ->
    name = msg.match[1]
    # TODO: find template from brain by name
    parser.single(msg.match[2]).then (values) ->
      result = Mustache.render("{{title}} spends {{calc}}", values)
      msg.send result
