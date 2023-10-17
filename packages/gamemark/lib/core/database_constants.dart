class DbConstants {
  //db
  static const databaseName = 'gamemark.db';
  static const databaseVersion = 1;

  static const tableGameName = 'cached_game';
  //column
  static const columnId = 'id';
  static const columnName = 'name';
  static const columnCreationDatetime = 'creationDatetime';

  static const String createTableQuery = '''
    CREATE TABLE $tableGameName (
      $columnId INTEGER PRIMARY KEY,
      $columnName TEXT,
      $columnCreationDatetime TEXT
    )
  ''';
}
