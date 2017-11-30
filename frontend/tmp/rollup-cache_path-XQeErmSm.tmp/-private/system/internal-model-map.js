var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

import InternalModel from './model/internal-model';

/**
 `InternalModelMap` is a custom storage map for internalModels of a given modelName
 used by `IdentityMap`.

 It was extracted from an implicit pojo based "internalModel map" and preserves
 that interface while we work towards a more official API.

 @class InternalModelMap
 @private
 */

var InternalModelMap = function () {
  function InternalModelMap(modelName) {
    _classCallCheck(this, InternalModelMap);

    this.modelName = modelName;
    this._idToModel = Object.create(null);
    this._models = [];
    this._metadata = null;
  }

  /**
   *
   * @param id
   * @returns {InternalModel}
   */


  InternalModelMap.prototype.get = function get(id) {
    return this._idToModel[id];
  };

  InternalModelMap.prototype.has = function has(id) {
    return !!this._idToModel[id];
  };

  InternalModelMap.prototype.set = function set(id, internalModel) {
    (true && !(id) && Ember.assert('You cannot index an internalModel by an empty id\'', id));
    (true && !(internalModel instanceof InternalModel) && Ember.assert('You cannot set an index for an internalModel to something other than an internalModel', internalModel instanceof InternalModel));
    (true && !(this.contains(internalModel)) && Ember.assert('You cannot set an index for an internalModel that is not in the InternalModelMap', this.contains(internalModel)));
    (true && !(!this.has(id) || this.get(id) === internalModel) && Ember.assert('You cannot update the id index of an InternalModel once set. Attempted to update ' + id + '.', !this.has(id) || this.get(id) === internalModel));


    this._idToModel[id] = internalModel;
  };

  InternalModelMap.prototype.add = function add(internalModel, id) {
    (true && !(!this.contains(internalModel)) && Ember.assert('You cannot re-add an already present InternalModel to the InternalModelMap.', !this.contains(internalModel)));


    if (id) {
      this._idToModel[id] = internalModel;
    }

    this._models.push(internalModel);
  };

  InternalModelMap.prototype.remove = function remove(internalModel, id) {
    delete this._idToModel[id];

    var loc = this._models.indexOf(internalModel);

    if (loc !== -1) {
      this._models.splice(loc, 1);
    }
  };

  InternalModelMap.prototype.contains = function contains(internalModel) {
    return this._models.indexOf(internalModel) !== -1;
  };

  /**
   An array of all models of this modelName
   */


  /**
   Destroy all models in the internalModelTest and wipe metadata.
    @method clear
   */
  InternalModelMap.prototype.clear = function clear() {
    var models = this._models;
    this._models = [];

    for (var i = 0; i < models.length; i++) {
      var model = models[i];
      model.unloadRecord();
    }

    this._metadata = null;
  };

  _createClass(InternalModelMap, [{
    key: 'length',
    get: function get() {
      return this._models.length;
    }
  }, {
    key: 'models',
    get: function get() {
      return this._models;
    }

    /**
     * meta information about internalModels
     */

  }, {
    key: 'metadata',
    get: function get() {
      return this._metadata || (this._metadata = Object.create(null));
    }

    /**
     deprecated (and unsupported) way of accessing modelClass
      @deprecated
     */

  }, {
    key: 'type',
    get: function get() {
      throw new Error('InternalModelMap.type is no longer available');
    }
  }]);

  return InternalModelMap;
}();

export default InternalModelMap;