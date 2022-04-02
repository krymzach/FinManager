'use strict';
module.exports = function(app) {
  const controller = require('../controllers/controller.js');

  // Routes
  app.route('/users')
    .post(controller.add_a_user);


  app.route('/users/:userId')
    .get(controller.read_a_user)
    .put(controller.update_a_user)
    .delete(controller.delete_a_user);

  
  app.route('/users/email/:userEmail')
    .get(controller.read_a_user_by_email);
};
