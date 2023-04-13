import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;

part 'Database.g.dart';

//@DataClassName('AccountTransaction')
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

//@DataClassName('PrimaryCategories')
class PrimaryCategory extends Table {
  String get tableName => 'PrimaryCategory';
  TextColumn get ID => text().named('ID')();

  @override
  Set<Column> get primaryKey => {ID};
}

//@DataClassName('SecondaryCategories')
class SecondaryCategory extends Table {
  String get tableName => 'SecondaryCategory';
  TextColumn get ID => text().named('ID')();
  TextColumn get primaryID =>
      text().named('PrimaryID').references(PrimaryCategory, #ID)();

  @override
  Set<Column> get primaryKey => {ID, primaryID};
}

@DriftDatabase(tables: [AccountTransaction, PrimaryCategory, SecondaryCategory])
class MyDatabase extends _$MyDatabase {
  // We tell the database where to store the data with this constructor
  MyDatabase() : super(_openConnection());

  // You should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 1;
}

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
