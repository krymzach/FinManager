'use strict';

const hashjs = require('../../hash.js');

const mongoose = require('mongoose');
const User = require('../models/user.js');


exports.add_a_user = function(req, res) {
  var new_user = new User(req.body);
  new_user.password = hashjs.hashString(new_user.password);
  new_user.save(function(err, user) {
    if (err)
      res.send(err);
    res.json(user);
  });
}

exports.read_a_user = function(req, res) {
  User.findById(req.params.userId, function(err, user) {
    if (err)
      res.send(err);
    res.json(user);
  });
}

exports.read_a_user_by_email = function(req, res) {
  User.findOne({email: req.params.userEmail}, function(err, user) {
    if (err)
      res.send(err);
    res.json(user);
  });
}

exports.update_a_user = function(req, res) {
  User.findOneAndUpdate({_id: req.params.userId}, req.body, {new: true}, function(err, user) {
    if (err)
      res.send(err);
    res.json(user);
  });
};

exports.delete_a_user = function(req, res) {
  User.deleteOne({
    _id: req.params.userId
  }, function(err, user) {
    if (err)
      res.send(err);
    res.json({ message: 'User successfully deleted' });
  });
};