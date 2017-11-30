define('frontend/routes/frontend/bands', ['exports'], function (exports) {
  'use strict';

  Object.defineProperty(exports, "__esModule", {
    value: true
  });
  exports.default = Ember.Route.extend({
    model: function model() {
      return this.store.findAll('band');
    }
  });
});