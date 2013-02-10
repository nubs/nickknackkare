express = require 'express'
app = express()
app.set 'view engine', 'hbs'

mongoose = require 'mongoose'
mongoose.connect process.env.MONGOHQ_URL

app.use express.logger 'dev'
app.use express.static "#{__dirname}/public"

app.get '/scripts/mixpanel.js', (req, res) ->
  res.setHeader 'Content-Type', 'application/javascript'
  res.render 'scripts/mixpanel.js.hbs', mixpanelKey: process.env.MIXPANEL_KEY, layout: false

app.get '/', (req, res) ->
  CurrentWeek = require './models/current-week'
  CurrentWeek.find().sort('order').exec (err, week) ->
    UpcomingEvents = require './models/upcoming-events'
    UpcomingEvents.find().sort('order').exec (err, upcomingEvents) ->
      res.render 'index.hbs', currentWeek: week, upcomingEvents: upcomingEvents

port = process.env.PORT ? 8000
app.listen port, ->
  console.log 'Listening on ' + port
