class DbConstants {
  //db
  static const databaseName = 'gamemark.db';
  static const tableName = 'cached_gamemark';
  static const databaseVersion = 1;
  //column
  static const columnName = 'name';

  static const String createTableQuery = '''
    CREATE TABLE $tableName (
      $columnName TEXT,
    )
  ''';
}
