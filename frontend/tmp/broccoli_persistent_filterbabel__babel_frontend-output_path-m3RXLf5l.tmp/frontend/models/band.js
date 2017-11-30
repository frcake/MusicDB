define('frontend/models/band', ['exports', 'ember-data'], function (exports, _emberData) {
  'use strict';

  Object.defineProperty(exports, "__esModule", {
    value: true
  });
  exports.default = _emberData.default.Model.extend({
    //country: DS.attr('string'),
    name: _emberData.default.attr('name'),
    description: _emberData.default.attr('description')
  });
});