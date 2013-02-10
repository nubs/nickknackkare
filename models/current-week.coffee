mongoose = require 'mongoose'

currentWeekSchema = new mongoose.Schema
  order:
    type: Number
    required: true
  name:
    type: String
    required: true
  events: [String]

module.exports = mongoose.model 'current-week', currentWeekSchema, 'current-week'
