'use strict';
const mongoose = require('mongoose');
var Schema = mongoose.Schema;

var UserSchema = new Schema({
  full_name: {
    type: String,
  },
  email: {
    type: String,
  },
  password: {
    type: String,
  },
  wealth: {
    type: Number,
  },
  daily_wealth_over_past_year: {
    type: Array,
  },
  tickers: {
    type: Array,
  },
  expenses: {
    type: Array,
  },
  incomes: {
    type: Array,
  }
});

module.exports = mongoose.model('Users', UserSchema);