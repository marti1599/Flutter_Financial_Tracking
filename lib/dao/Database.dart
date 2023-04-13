import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;

part 'Database.g.dart';

/// The class `AccountTransaction` defines a table schema for storing financial transaction data with
/// various columns such as ID, date and time, currency, amount, primary and secondary category IDs,
/// description, type, and account.
class AccountTransaction extends Table {
  String get tableName => 'AccountTransaction';
  IntColumn get ID => integer().named('ID').autoIncrement()();
  DateTimeColumn get dateAndTime => dateTime().named('DateAndTime')();
  TextColumn get currency => text().named('Currency')();
  RealColumn get amount => real().named('Amount')();
  TextColumn get primaryID =>
      text().named('PrimaryID').references(PrimaryCategory, #ID)();
  TextColumn get secondaryID =>
      text().named('SecondaryID').references(SecondaryCategory, #ID)();
  TextColumn get description => text().named('Description')();
  TextColumn get type => text().named('Type')();
  TextColumn get account => text().named('Account')();

  @override
  Set<Column> get primaryKey => {ID};
}

/// This is a Dart class that defines a database table called "PrimaryCategory" with a single primary
/// key column named "ID".
class PrimaryCategory extends Table {
  String get tableName => 'PrimaryCategory';
  TextColumn get ID => text().named('ID')();

  @override
  Set<Column> get primaryKey => {ID};
}

/// The SecondaryCategory class defines a table with ID and primaryID columns that reference the
/// PrimaryCategory table.
class SecondaryCategory extends Table {
  String get tableName => 'SecondaryCategory';
  TextColumn get ID => text().named('ID')();
  TextColumn get primaryID =>
      text().named('PrimaryID').references(PrimaryCategory, #ID)();

  @override
  Set<Column> get primaryKey => {ID, primaryID};
}

/// The above class defines a database in Dart using the Drift library with tables for account
/// transactions, primary categories, and secondary categories.
@DriftDatabase(tables: [AccountTransaction, PrimaryCategory, SecondaryCategory])
class MyDatabase extends _$MyDatabase {
  // We tell the database where to store the data with this constructor
  MyDatabase() : super(_openConnection());

  // You should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 1;
}

/// This function returns a lazy database connection to a SQLite database file located in a specified
/// path.
///
/// Returns:
///   A `LazyDatabase` object is being returned. The `LazyDatabase` constructor takes a function that
/// returns a `Future<Database>` as an argument. In this case, the function being passed to the
/// constructor is an asynchronous function that creates a `NativeDatabase` object in the background and
/// returns it as a `Future`.
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // TODO make the path dynamic
    // EDIT The assets file is used as default scheme. I need to copy it in a local folder
    // DB folder
    const dbPath =
        "C:\\Users\\m.armillotta\\Desktop\\Flutter_Financial_Tracking\\assets";
    // DB name
    const dbName = "financialTracking.db";
    final file = File(p.join(dbPath, dbName));
    return NativeDatabase.createInBackground(file);
  });
}
