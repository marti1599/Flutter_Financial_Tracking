import 'package:drift/drift.dart';
part 'transaction.g.dart';

@DataClassName('Transaction')
class Transaction extends Table {
  IntColumn get ID => integer().autoIncrement()();
  DateTimeColumn get DateTime => dateTime().nullable()();
  TextColumn get Currency => text()();
  RealColumn get Amount => real()();
  TextColumn get Primary => text()();
  TextColumn get Secondary => text()();
  TextColumn get Description => text()();
  TextColumn get Type => text()();
  TextColumn get Account => text()();
}



@DriftDatabase(tables: [Transaction])
class MyDatabase extends _$MyDatabase {
}