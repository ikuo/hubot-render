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
parser = require('lcsv-parser')

module.exports = (robot) ->
  templates = (name) -> robot.brain.data.remember?[name]

  robot.respond /render\s+(\w+)\s+(.+)/, (msg) ->
    name = msg.match[1]
    template = templates(name)
    if template?
      parser.single(msg.match[2]).then (values) ->
        result = Mustache.render(template, values)
        msg.send result
    else
      msg.send "Unknown template `#{name}`."
