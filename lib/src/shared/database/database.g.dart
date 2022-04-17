// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  GameDao? _gameDaoInstance;

  CoverDao? _coverDaoInstance;

  ScreenshotDao? _screenshotDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `game` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `summary` TEXT, `cover` INTEGER, `category` TEXT NOT NULL, `status` TEXT, `screenshots` TEXT, `similar_games` TEXT, `url` TEXT NOT NULL, FOREIGN KEY (`cover`) REFERENCES `cover` (`id`) ON UPDATE NO ACTION ON DELETE CASCADE, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `cover` (`id` INTEGER NOT NULL, `url` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `screenshot` (`id` INTEGER NOT NULL, `url` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  GameDao get gameDao {
    return _gameDaoInstance ??= _$GameDao(database, changeListener);
  }

  @override
  CoverDao get coverDao {
    return _coverDaoInstance ??= _$CoverDao(database, changeListener);
  }

  @override
  ScreenshotDao get screenshotDao {
    return _screenshotDaoInstance ??= _$ScreenshotDao(database, changeListener);
  }
}

class _$GameDao extends GameDao {
  _$GameDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _gameEntityInsertionAdapter = InsertionAdapter(
            database,
            'game',
            (GameEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'summary': item.summary,
                  'cover': item.cover,
                  'category': item.category,
                  'status': item.status,
                  'screenshots': item.screenshots,
                  'similar_games': item.similarGames,
                  'url': item.url
                }),
        _gameEntityUpdateAdapter = UpdateAdapter(
            database,
            'game',
            ['id'],
            (GameEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'summary': item.summary,
                  'cover': item.cover,
                  'category': item.category,
                  'status': item.status,
                  'screenshots': item.screenshots,
                  'similar_games': item.similarGames,
                  'url': item.url
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<GameEntity> _gameEntityInsertionAdapter;

  final UpdateAdapter<GameEntity> _gameEntityUpdateAdapter;

  @override
  Future<List<GameEntity>> findGames(int limit) async {
    return _queryAdapter.queryList('SELECT * FROM game Limit ?1',
        mapper: (Map<String, Object?> row) => GameEntity(
            id: row['id'] as int,
            name: row['name'] as String,
            summary: row['summary'] as String?,
            cover: row['cover'] as int?,
            category: row['category'] as String,
            status: row['status'] as String?,
            screenshots: row['screenshots'] as String?,
            similarGames: row['similar_games'] as String?,
            url: row['url'] as String),
        arguments: [limit]);
  }

  @override
  Future<GameEntity?> findGameById(int id) async {
    return _queryAdapter.query('SELECT * FROM game WHERE id = ?1',
        mapper: (Map<String, Object?> row) => GameEntity(
            id: row['id'] as int,
            name: row['name'] as String,
            summary: row['summary'] as String?,
            cover: row['cover'] as int?,
            category: row['category'] as String,
            status: row['status'] as String?,
            screenshots: row['screenshots'] as String?,
            similarGames: row['similar_games'] as String?,
            url: row['url'] as String),
        arguments: [id]);
  }

  @override
  Future<void> insertGame(GameEntity game) async {
    await _gameEntityInsertionAdapter.insert(game, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertAllGames(List<GameEntity> games) async {
    await _gameEntityInsertionAdapter.insertList(
        games, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateGame(GameEntity game) async {
    await _gameEntityUpdateAdapter.update(game, OnConflictStrategy.abort);
  }
}

class _$CoverDao extends CoverDao {
  _$CoverDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _coverEntityInsertionAdapter = InsertionAdapter(
            database,
            'cover',
            (CoverEntity item) =>
                <String, Object?>{'id': item.id, 'url': item.url});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CoverEntity> _coverEntityInsertionAdapter;

  @override
  Future<List<CoverEntity>> findCovers() async {
    return _queryAdapter.queryList('SELECT * FROM cover',
        mapper: (Map<String, Object?> row) =>
            CoverEntity(id: row['id'] as int, url: row['url'] as String));
  }

  @override
  Future<CoverEntity?> findCoverById(int id) async {
    return _queryAdapter.query('SELECT * FROM cover WHERE id = ?1',
        mapper: (Map<String, Object?> row) =>
            CoverEntity(id: row['id'] as int, url: row['url'] as String),
        arguments: [id]);
  }

  @override
  Future<void> insertCover(CoverEntity cover) async {
    await _coverEntityInsertionAdapter.insert(cover, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertAllCovers(List<CoverEntity> covers) async {
    await _coverEntityInsertionAdapter.insertList(
        covers, OnConflictStrategy.abort);
  }
}

class _$ScreenshotDao extends ScreenshotDao {
  _$ScreenshotDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _screenshotEntityInsertionAdapter = InsertionAdapter(
            database,
            'screenshot',
            (ScreenshotEntity item) =>
                <String, Object?>{'id': item.id, 'url': item.url});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ScreenshotEntity> _screenshotEntityInsertionAdapter;

  @override
  Future<List<ScreenshotEntity>> findScreenshots() async {
    return _queryAdapter.queryList('SELECT * FROM screenshot',
        mapper: (Map<String, Object?> row) =>
            ScreenshotEntity(row['id'] as int, row['url'] as String));
  }

  @override
  Future<ScreenshotEntity?> findScreenshotById(int id) async {
    return _queryAdapter.query('SELECT * FROM screenshot WHERE id = ?1',
        mapper: (Map<String, Object?> row) =>
            ScreenshotEntity(row['id'] as int, row['url'] as String),
        arguments: [id]);
  }

  @override
  Future<void> insertScreenshot(ScreenshotEntity screenshot) async {
    await _screenshotEntityInsertionAdapter.insert(
        screenshot, OnConflictStrategy.abort);
  }
}
