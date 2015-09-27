# hubot-render

[![npm version](https://badge.fury.io/js/hubot-render.svg)](http://badge.fury.io/js/hubot-render)
[![Build Status](https://travis-ci.org/ikuo/hubot-render.svg?branch=master)](https://travis-ci.org/ikuo/hubot-render)

A hubot script to render [mustache](https://mustache.github.io/) templates.

See [`src/render.coffee`](src/render.coffee) for full documentation.

## Installation

In hubot project repo, run:

```shell
npm install hubot-remember-multiline --save
npm install hubot-render --save
```

Then add **hubot-render** to your `external-scripts.json`:

```json
[
  "hubot-remember-multiline",
  "hubot-render"
]
```

## Sample Interaction

```shell
user1>> hubot remember tmpl1 is
{{title}} spends {{calc}}
user1>> hubot render tmpl1 title:Joe, calc:6
hubot>> Joe spends 6
```

See [./test/*.coffee](./test) for more examples.
