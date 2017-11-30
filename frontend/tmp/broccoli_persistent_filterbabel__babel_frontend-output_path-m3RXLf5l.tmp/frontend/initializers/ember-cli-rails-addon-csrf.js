define('frontend/initializers/ember-cli-rails-addon-csrf', ['exports'], function (exports) {
  'use strict';

  Object.defineProperty(exports, "__esModule", {
    value: true
  });
  var $ = Ember.$;
  exports.default = {
    name: 'ember-cli-rails-addon-csrf',

    initialize: function initialize() {
      $.ajaxPrefilter(function (options, originalOptions, xhr) {
        var token = $('meta[name="csrf-token"]').attr('content');
        xhr.setRequestHeader('X-CSRF-Token', token);
      });
    }
  };
});