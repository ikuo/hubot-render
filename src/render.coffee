# Description
#   A hubot script to render template.
#   Templates should be written in [mustache](https://mustache.github.io/)
#   and be stored by hubot-remember-multiline module.
#
# Commands:
#   hubot render <name> - show the template
#   hubot render <name> key1:value1, key2:value2, ... - render the template
#
# Notes:
#
# Author:
#   Ikuo Matsumura <makiczar@gmail.com>

Mustache = require('mustache')

module.exports = (robot) ->
  robot.respond /render\s+(.+)/, (msg) ->
    values = msg.match[1]
    result = Mustache.render("{{title}} spends {{calc}}", title: values, calc: 50)
    msg.send result
