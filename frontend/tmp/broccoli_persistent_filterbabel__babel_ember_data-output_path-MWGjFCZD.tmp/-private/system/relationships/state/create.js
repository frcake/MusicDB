var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

import ManyRelationship from "./has-many";
import BelongsToRelationship from "./belongs-to";
var _get = Ember.get;


function shouldFindInverse(relationshipMeta) {
  var options = relationshipMeta.options;
  return !(options && options.inverse === null);
}

function createRelationshipFor(internalModel, relationshipMeta, store) {
  var inverseKey = void 0;
  var inverse = null;

  if (shouldFindInverse(relationshipMeta)) {
    inverse = internalModel.type.inverseFor(relationshipMeta.key, store);
  } else if (true) {
    internalModel.type.typeForRelationship(relationshipMeta.key, store);
  }

  if (inverse) {
    inverseKey = inverse.name;
  }

  if (relationshipMeta.kind === 'hasMany') {
    return new ManyRelationship(store, internalModel, inverseKey, relationshipMeta);
  } else {
    return new BelongsToRelationship(store, internalModel, inverseKey, relationshipMeta);
  }
}

var Relationships = function () {
  function Relationships(internalModel) {
    _classCallCheck(this, Relationships);

    this.internalModel = internalModel;
    this.initializedRelationships = Object.create(null);
  }

  // TODO @runspired deprecate this as it was never truly a record instance


  Relationships.prototype.has = function has(key) {
    return !!this.initializedRelationships[key];
  };

  Relationships.prototype.forEach = function forEach(cb) {
    var rels = this.initializedRelationships;
    Object.keys(rels).forEach(function (name) {
      cb(name, rels[name]);
    });
  };

  Relationships.prototype.get = function get(key) {
    var relationships = this.initializedRelationships;
    var relationship = relationships[key];
    var internalModel = this.internalModel;

    if (!relationship) {
      var relationshipsByName = _get(internalModel.type, 'relationshipsByName');
      var rel = relationshipsByName.get(key);

      if (!rel) {
        return undefined;
      }

      var relationshipPayload = internalModel.store._relationshipsPayloads.get(internalModel.modelName, internalModel.id, key);

      relationship = relationships[key] = createRelationshipFor(internalModel, rel, internalModel.store);

      if (relationshipPayload) {
        relationship.push(relationshipPayload, true);
      }
    }

    return relationship;
  };

  _createClass(Relationships, [{
    key: "record",
    get: function get() {
      return this.internalModel;
    }
  }]);

  return Relationships;
}();

export default Relationships;