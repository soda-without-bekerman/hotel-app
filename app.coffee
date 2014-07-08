flatiron = require("flatiron")
path = require("path")
app = flatiron.app
app.config.file file: path.join(__dirname, "config", "config.json")
app.use flatiron.plugins.http

fs = require "fs"
swig = require "swig"

serveStatic = require "serve-static"

app.http.before.push serveStatic "public", "index": ["index.html"] 

app.router.get "/", ->
  templ = fs.readFileSync "#{__dirname}/template/layout.swig", "utf-8"
  @res.end swig.render templ

app.router.get "/v1", ->
  templ = fs.readFileSync "#{__dirname}/template/layout.swig", "utf-8"
  @res.end swig.render templ

app.router.get "/v2", ->
  templ = fs.readFileSync "#{__dirname}/template/layout1.swig", "utf-8"
  @res.end swig.render templ

app.router.get "/v3", ->
  templ = fs.readFileSync "#{__dirname}/template/layout2.swig", "utf-8"
  @res.end swig.render templ



app.start 3000
