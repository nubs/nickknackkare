mongoose = require 'mongoose'

headerSchema = new mongoose.Schema
  key:
    type: String
    required: true
  text:
    type: String
    required: true

module.exports = mongoose.model 'headers', headerSchema, 'headers'
