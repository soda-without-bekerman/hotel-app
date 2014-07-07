flatiron = require("flatiron")
path = require("path")
app = flatiron.app
app.config.file file: path.join(__dirname, "config", "config.json")
app.use flatiron.plugins.http

fs = require "fs"
swig = require "swig"


app.router.get "/", ->

  templ = fs.readFileSync "#{__dirname}/template/layout.swig", "utf-8"
  @res.end swig.render templ


app.start 3000