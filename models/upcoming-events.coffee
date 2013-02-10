mongoose = require 'mongoose'

upcomingEventSchema = new mongoose.Schema
  order:
    type: Number
    required: true
  event:
    type: String
    required: true

module.exports = mongoose.model 'upcoming-event', upcomingEventSchema
