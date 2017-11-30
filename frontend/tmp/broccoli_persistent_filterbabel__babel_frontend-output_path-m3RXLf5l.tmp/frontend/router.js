define('frontend/router', ['exports', 'frontend/config/environment'], function (exports, _environment) {
  'use strict';

  Object.defineProperty(exports, "__esModule", {
    value: true
  });


  var Router = Ember.Router.extend({
    location: _environment.default.locationType,
    rootURL: _environment.default.rootURL
  });

  Router.map(function () {
    this.route('frontend', function () {
      this.route('bands');
      this.route('artists');
      this.route('songs');
      this.route('users');
    });
  });

  exports.default = Router;
});