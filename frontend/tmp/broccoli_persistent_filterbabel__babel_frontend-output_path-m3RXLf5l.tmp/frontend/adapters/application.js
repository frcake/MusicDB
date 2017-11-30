define('frontend/adapters/application', ['exports', 'ember-data'], function (exports, _emberData) {
  'use strict';

  Object.defineProperty(exports, "__esModule", {
    value: true
  });
  var _Ember$String = Ember.String,
      pluralize = _Ember$String.pluralize,
      underscore = _Ember$String.underscore;
  exports.default = _emberData.default.JSONAPIAdapter.extend({
    namespace: 'api/v1',

    pathForType: function pathForType(type) {
      return pluralize(underscore(type));
    }
  });
});