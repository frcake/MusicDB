'use strict';

define('frontend/tests/app.lint-test', [], function () {
  'use strict';

  QUnit.module('ESLint | app');

  QUnit.test('adapters/application.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'adapters/application.js should pass ESLint\n\n');
  });

  QUnit.test('app.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'app.js should pass ESLint\n\n');
  });

  QUnit.test('models/album.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'models/album.js should pass ESLint\n\n');
  });

  QUnit.test('models/artist.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'models/artist.js should pass ESLint\n\n');
  });

  QUnit.test('models/band.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'models/band.js should pass ESLint\n\n');
  });

  QUnit.test('models/song.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'models/song.js should pass ESLint\n\n');
  });

  QUnit.test('models/user.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'models/user.js should pass ESLint\n\n');
  });

  QUnit.test('resolver.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'resolver.js should pass ESLint\n\n');
  });

  QUnit.test('router.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'router.js should pass ESLint\n\n');
  });

  QUnit.test('routes/frontend/artists.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'routes/frontend/artists.js should pass ESLint\n\n');
  });

  QUnit.test('routes/frontend/bands.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'routes/frontend/bands.js should pass ESLint\n\n');
  });

  QUnit.test('routes/frontend/songs.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'routes/frontend/songs.js should pass ESLint\n\n');
  });

  QUnit.test('routes/frontend/users.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'routes/frontend/users.js should pass ESLint\n\n');
  });
});
define('frontend/tests/helpers/destroy-app', ['exports'], function (exports) {
  'use strict';

  Object.defineProperty(exports, "__esModule", {
    value: true
  });
  exports.default = destroyApp;
  function destroyApp(application) {
    Ember.run(application, 'destroy');
  }
});
define('frontend/tests/helpers/module-for-acceptance', ['exports', 'qunit', 'frontend/tests/helpers/start-app', 'frontend/tests/helpers/destroy-app'], function (exports, _qunit, _startApp, _destroyApp) {
  'use strict';

  Object.defineProperty(exports, "__esModule", {
    value: true
  });

  exports.default = function (name) {
    var options = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {};

    (0, _qunit.module)(name, {
      beforeEach: function beforeEach() {
        this.application = (0, _startApp.default)();

        if (options.beforeEach) {
          return options.beforeEach.apply(this, arguments);
        }
      },
      afterEach: function afterEach() {
        var _this = this;

        var afterEach = options.afterEach && options.afterEach.apply(this, arguments);
        return Promise.resolve(afterEach).then(function () {
          return (0, _destroyApp.default)(_this.application);
        });
      }
    });
  };

  var Promise = Ember.RSVP.Promise;
});
define('frontend/tests/helpers/resolver', ['exports', 'frontend/resolver', 'frontend/config/environment'], function (exports, _resolver, _environment) {
  'use strict';

  Object.defineProperty(exports, "__esModule", {
    value: true
  });


  var resolver = _resolver.default.create();

  resolver.namespace = {
    modulePrefix: _environment.default.modulePrefix,
    podModulePrefix: _environment.default.podModulePrefix
  };

  exports.default = resolver;
});
define('frontend/tests/helpers/start-app', ['exports', 'frontend/app', 'frontend/config/environment'], function (exports, _app, _environment) {
  'use strict';

  Object.defineProperty(exports, "__esModule", {
    value: true
  });
  exports.default = startApp;
  function startApp(attrs) {
    var attributes = Ember.merge({}, _environment.default.APP);
    attributes = Ember.merge(attributes, attrs); // use defaults, but you can override;

    return Ember.run(function () {
      var application = _app.default.create(attributes);
      application.setupForTesting();
      application.injectTestHelpers();
      return application;
    });
  }
});
define('frontend/tests/test-helper', ['frontend/tests/helpers/resolver', 'ember-qunit', 'ember-cli-qunit'], function (_resolver, _emberQunit, _emberCliQunit) {
  'use strict';

  (0, _emberQunit.setResolver)(_resolver.default);
  (0, _emberCliQunit.start)();
});
define('frontend/tests/tests.lint-test', [], function () {
  'use strict';

  QUnit.module('ESLint | tests');

  QUnit.test('helpers/destroy-app.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'helpers/destroy-app.js should pass ESLint\n\n');
  });

  QUnit.test('helpers/module-for-acceptance.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'helpers/module-for-acceptance.js should pass ESLint\n\n');
  });

  QUnit.test('helpers/resolver.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'helpers/resolver.js should pass ESLint\n\n');
  });

  QUnit.test('helpers/start-app.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'helpers/start-app.js should pass ESLint\n\n');
  });

  QUnit.test('test-helper.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'test-helper.js should pass ESLint\n\n');
  });

  QUnit.test('unit/adapters/application-test.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'unit/adapters/application-test.js should pass ESLint\n\n');
  });

  QUnit.test('unit/models/album-test.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'unit/models/album-test.js should pass ESLint\n\n');
  });

  QUnit.test('unit/models/artist-test.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'unit/models/artist-test.js should pass ESLint\n\n');
  });

  QUnit.test('unit/models/band-test.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'unit/models/band-test.js should pass ESLint\n\n');
  });

  QUnit.test('unit/models/song-test.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'unit/models/song-test.js should pass ESLint\n\n');
  });

  QUnit.test('unit/models/user-test.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'unit/models/user-test.js should pass ESLint\n\n');
  });

  QUnit.test('unit/routes/frontend/artists-test.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'unit/routes/frontend/artists-test.js should pass ESLint\n\n');
  });

  QUnit.test('unit/routes/frontend/bands-test.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'unit/routes/frontend/bands-test.js should pass ESLint\n\n');
  });

  QUnit.test('unit/routes/frontend/songs-test.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'unit/routes/frontend/songs-test.js should pass ESLint\n\n');
  });

  QUnit.test('unit/routes/frontend/users-test.js', function (assert) {
    assert.expect(1);
    assert.ok(true, 'unit/routes/frontend/users-test.js should pass ESLint\n\n');
  });
});
define('frontend/tests/unit/adapters/application-test', ['ember-qunit'], function (_emberQunit) {
  'use strict';

  (0, _emberQunit.moduleFor)('adapter:application', 'Unit | Adapter | application', {
    // Specify the other units that are required for this test.
    // needs: ['serializer:foo']
  });

  // Replace this with your real tests.
  (0, _emberQunit.test)('it exists', function (assert) {
    var adapter = this.subject();
    assert.ok(adapter);
  });
});
define('frontend/tests/unit/models/album-test', ['ember-qunit'], function (_emberQunit) {
  'use strict';

  (0, _emberQunit.moduleForModel)('album', 'Unit | Model | album', {
    // Specify the other units that are required for this test.
    needs: []
  });

  (0, _emberQunit.test)('it exists', function (assert) {
    var model = this.subject();
    // let store = this.store();
    assert.ok(!!model);
  });
});
define('frontend/tests/unit/models/artist-test', ['ember-qunit'], function (_emberQunit) {
  'use strict';

  (0, _emberQunit.moduleForModel)('artist', 'Unit | Model | artist', {
    // Specify the other units that are required for this test.
    needs: []
  });

  (0, _emberQunit.test)('it exists', function (assert) {
    var model = this.subject();
    // let store = this.store();
    assert.ok(!!model);
  });
});
define('frontend/tests/unit/models/band-test', ['ember-qunit'], function (_emberQunit) {
  'use strict';

  (0, _emberQunit.moduleForModel)('band', 'Unit | Model | band', {
    // Specify the other units that are required for this test.
    needs: []
  });

  (0, _emberQunit.test)('it exists', function (assert) {
    var model = this.subject();
    // let store = this.store();
    assert.ok(!!model);
  });
});
define('frontend/tests/unit/models/song-test', ['ember-qunit'], function (_emberQunit) {
  'use strict';

  (0, _emberQunit.moduleForModel)('song', 'Unit | Model | song', {
    // Specify the other units that are required for this test.
    needs: []
  });

  (0, _emberQunit.test)('it exists', function (assert) {
    var model = this.subject();
    // let store = this.store();
    assert.ok(!!model);
  });
});
define('frontend/tests/unit/models/user-test', ['ember-qunit'], function (_emberQunit) {
  'use strict';

  (0, _emberQunit.moduleForModel)('user', 'Unit | Model | user', {
    // Specify the other units that are required for this test.
    needs: []
  });

  (0, _emberQunit.test)('it exists', function (assert) {
    var model = this.subject();
    // let store = this.store();
    assert.ok(!!model);
  });
});
define('frontend/tests/unit/routes/frontend/artists-test', ['ember-qunit'], function (_emberQunit) {
  'use strict';

  (0, _emberQunit.moduleFor)('route:frontend/artists', 'Unit | Route | frontend/artists', {
    // Specify the other units that are required for this test.
    // needs: ['controller:foo']
  });

  (0, _emberQunit.test)('it exists', function (assert) {
    var route = this.subject();
    assert.ok(route);
  });
});
define('frontend/tests/unit/routes/frontend/bands-test', ['ember-qunit'], function (_emberQunit) {
  'use strict';

  (0, _emberQunit.moduleFor)('route:frontend/bands', 'Unit | Route | frontend/bands', {
    // Specify the other units that are required for this test.
    // needs: ['controller:foo']
  });

  (0, _emberQunit.test)('it exists', function (assert) {
    var route = this.subject();
    assert.ok(route);
  });
});
define('frontend/tests/unit/routes/frontend/songs-test', ['ember-qunit'], function (_emberQunit) {
  'use strict';

  (0, _emberQunit.moduleFor)('route:frontend/songs', 'Unit | Route | frontend/songs', {
    // Specify the other units that are required for this test.
    // needs: ['controller:foo']
  });

  (0, _emberQunit.test)('it exists', function (assert) {
    var route = this.subject();
    assert.ok(route);
  });
});
define('frontend/tests/unit/routes/frontend/users-test', ['ember-qunit'], function (_emberQunit) {
  'use strict';

  (0, _emberQunit.moduleFor)('route:frontend/users', 'Unit | Route | frontend/users', {
    // Specify the other units that are required for this test.
    // needs: ['controller:foo']
  });

  (0, _emberQunit.test)('it exists', function (assert) {
    var route = this.subject();
    assert.ok(route);
  });
});
require('frontend/tests/test-helper');
EmberENV.TESTS_FILE_LOADED = true;
//# sourceMappingURL=tests.map
