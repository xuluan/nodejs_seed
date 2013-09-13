###
  Requires
###
env = process.env.NODE_ENV || 'development'

express = require 'express'
fs = require('fs')
assets  = require 'connect-assets'
path  = require 'path'
http  = require 'http'
coffee  = require 'coffee-script'

config = require('./config/config')[env]
mongoose = require 'mongoose'
db = mongoose.connect config.db

# models_path = config.root + '/app/models'
# fs.readdirSync(models_path).forEach (file) ->
#   require models_path + '/' + file
    

server  = express()

require('./config/express')(server, config)

require('./config/routes')(server, config)

http.createServer(server).listen '3000', ->
  console.log "Express server listening on port " + '3000'