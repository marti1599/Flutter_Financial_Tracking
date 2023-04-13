// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Database.dart';

// ignore_for_file: type=lint
class $PrimaryCategoryTable extends PrimaryCategory
    with TableInfo<$PrimaryCategoryTable, PrimaryCategoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PrimaryCategoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _IDMeta = const VerificationMeta('ID');
  @override
  late final GeneratedColumn<String> ID = GeneratedColumn<String>(
      'ID', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [ID];
  @override
  String get aliasedName => _alias ?? 'PrimaryCategory';
  @override
  String get actualTableName => 'PrimaryCategory';
  @override
  VerificationContext validateIntegrity(
      Insertable<PrimaryCategoryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('ID')) {
      context.handle(_IDMeta, ID.isAcceptableOrUnknown(data['ID']!, _IDMeta));
    } else if (isInserting) {
      context.missing(_IDMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {ID};
  @override
  PrimaryCategoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PrimaryCategoryData(
      ID: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ID'])!,
    );
  }

  @override
  $PrimaryCategoryTable createAlias(String alias) {
    return $PrimaryCategoryTable(attachedDatabase, alias);
  }
}

class PrimaryCategoryData extends DataClass
    implements Insertable<PrimaryCategoryData> {
  final String ID;
  const PrimaryCategoryData({required this.ID});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['ID'] = Variable<String>(ID);
    return map;
  }

  PrimaryCategoryCompanion toCompanion(bool nullToAbsent) {
    return PrimaryCategoryCompanion(
      ID: Value(ID),
    );
  }

  factory PrimaryCategoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PrimaryCategoryData(
      ID: serializer.fromJson<String>(json['ID']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'ID': serializer.toJson<String>(ID),
    };
  }

  PrimaryCategoryData copyWith({String? ID}) => PrimaryCategoryData(
        ID: ID ?? this.ID,
      );
  @override
  String toString() {
    return (StringBuffer('PrimaryCategoryData(')
          ..write('ID: $ID')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => ID.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PrimaryCategoryData && other.ID == this.ID);
}

class PrimaryCategoryCompanion extends UpdateCompanion<PrimaryCategoryData> {
  final Value<String> ID;
  final Value<int> rowid;
  const PrimaryCategoryCompanion({
    this.ID = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PrimaryCategoryCompanion.insert({
    required String ID,
    this.rowid = const Value.absent(),
  }) : ID = Value(ID);
  static Insertable<PrimaryCategoryData> custom({
    Expression<String>? ID,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (ID != null) 'ID': ID,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PrimaryCategoryCompanion copyWith({Value<String>? ID, Value<int>? rowid}) {
    return PrimaryCategoryCompanion(
      ID: ID ?? this.ID,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (ID.present) {
      map['ID'] = Variable<String>(ID.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PrimaryCategoryCompanion(')
          ..write('ID: $ID, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SecondaryCategoryTable extends SecondaryCategory
    with TableInfo<$SecondaryCategoryTable, SecondaryCategoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SecondaryCategoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _IDMeta = const VerificationMeta('ID');
  @override
  late final GeneratedColumn<String> ID = GeneratedColumn<String>(
      'ID', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _primaryIDMeta =
      const VerificationMeta('primaryID');
  @override
  late final GeneratedColumn<String> primaryID = GeneratedColumn<String>(
      'PrimaryID', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES PrimaryCategory (ID)'));
  @override
  List<GeneratedColumn> get $columns => [ID, primaryID];
  @override
  String get aliasedName => _alias ?? 'SecondaryCategory';
  @override
  String get actualTableName => 'SecondaryCategory';
  @override
  VerificationContext validateIntegrity(
      Insertable<SecondaryCategoryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('ID')) {
      context.handle(_IDMeta, ID.isAcceptableOrUnknown(data['ID']!, _IDMeta));
    } else if (isInserting) {
      context.missing(_IDMeta);
    }
    if (data.containsKey('PrimaryID')) {
      context.handle(_primaryIDMeta,
          primaryID.isAcceptableOrUnknown(data['PrimaryID']!, _primaryIDMeta));
    } else if (isInserting) {
      context.missing(_primaryIDMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {ID, primaryID};
  @override
  SecondaryCategoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SecondaryCategoryData(
      ID: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ID'])!,
      primaryID: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}PrimaryID'])!,
    );
  }

  @override
  $SecondaryCategoryTable createAlias(String alias) {
    return $SecondaryCategoryTable(attachedDatabase, alias);
  }
}

class SecondaryCategoryData extends DataClass
    implements Insertable<SecondaryCategoryData> {
  final String ID;
  final String primaryID;
  const SecondaryCategoryData({required this.ID, required this.primaryID});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['ID'] = Variable<String>(ID);
    map['PrimaryID'] = Variable<String>(primaryID);
    return map;
  }

  SecondaryCategoryCompanion toCompanion(bool nullToAbsent) {
    return SecondaryCategoryCompanion(
      ID: Value(ID),
      primaryID: Value(primaryID),
    );
  }

  factory SecondaryCategoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SecondaryCategoryData(
      ID: serializer.fromJson<String>(json['ID']),
      primaryID: serializer.fromJson<String>(json['primaryID']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'ID': serializer.toJson<String>(ID),
      'primaryID': serializer.toJson<String>(primaryID),
    };
  }

  SecondaryCategoryData copyWith({String? ID, String? primaryID}) =>
      SecondaryCategoryData(
        ID: ID ?? this.ID,
        primaryID: primaryID ?? this.primaryID,
      );
  @override
  String toString() {
    return (StringBuffer('SecondaryCategoryData(')
          ..write('ID: $ID, ')
          ..write('primaryID: $primaryID')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(ID, primaryID);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SecondaryCategoryData &&
          other.ID == this.ID &&
          other.primaryID == this.primaryID);
}

class SecondaryCategoryCompanion
    extends UpdateCompanion<SecondaryCategoryData> {
  final Value<String> ID;
  final Value<String> primaryID;
  final Value<int> rowid;
  const SecondaryCategoryCompanion({
    this.ID = const Value.absent(),
    this.primaryID = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SecondaryCategoryCompanion.insert({
    required String ID,
    required String primaryID,
    this.rowid = const Value.absent(),
  })  : ID = Value(ID),
        primaryID = Value(primaryID);
  static Insertable<SecondaryCategoryData> custom({
    Expression<String>? ID,
    Expression<String>? primaryID,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (ID != null) 'ID': ID,
      if (primaryID != null) 'PrimaryID': primaryID,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SecondaryCategoryCompanion copyWith(
      {Value<String>? ID, Value<String>? primaryID, Value<int>? rowid}) {
    return SecondaryCategoryCompanion(
      ID: ID ?? this.ID,
      primaryID: primaryID ?? this.primaryID,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (ID.present) {
      map['ID'] = Variable<String>(ID.value);
    }
    if (primaryID.present) {
      map['PrimaryID'] = Variable<String>(primaryID.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SecondaryCategoryCompanion(')
          ..write('ID: $ID, ')
          ..write('primaryID: $primaryID, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AccountTransactionTable extends AccountTransaction
    with TableInfo<$AccountTransactionTable, AccountTransactionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountTransactionTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _IDMeta = const VerificationMeta('ID');
  @override
  late final GeneratedColumn<int> ID = GeneratedColumn<int>(
      'ID', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dateAndTimeMeta =
      const VerificationMeta('dateAndTime');
  @override
  late final GeneratedColumn<DateTime> dateAndTime = GeneratedColumn<DateTime>(
      'DateAndTime', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _currencyMeta =
      const VerificationMeta('currency');
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
      'Currency', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'Amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _primaryIDMeta =
      const VerificationMeta('primaryID');
  @override
  late final GeneratedColumn<String> primaryID = GeneratedColumn<String>(
      'PrimaryID', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES PrimaryCategory (ID)'));
  static const VerificationMeta _secondaryIDMeta =
      const VerificationMeta('secondaryID');
  @override
  late final GeneratedColumn<String> secondaryID = GeneratedColumn<String>(
      'SecondaryID', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES SecondaryCategory (ID)'));
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'Description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'Type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _accountMeta =
      const VerificationMeta('account');
  @override
  late final GeneratedColumn<String> account = GeneratedColumn<String>(
      'Account', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        ID,
        dateAndTime,
        currency,
        amount,
        primaryID,
        secondaryID,
        description,
        type,
        account
      ];
  @override
  String get aliasedName => _alias ?? 'AccountTransaction';
  @override
  String get actualTableName => 'AccountTransaction';
  @override
  VerificationContext validateIntegrity(
      Insertable<AccountTransactionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('ID')) {
      context.handle(_IDMeta, ID.isAcceptableOrUnknown(data['ID']!, _IDMeta));
    }
    if (data.containsKey('DateAndTime')) {
      context.handle(
          _dateAndTimeMeta,
          dateAndTime.isAcceptableOrUnknown(
              data['DateAndTime']!, _dateAndTimeMeta));
    } else if (isInserting) {
      context.missing(_dateAndTimeMeta);
    }
    if (data.containsKey('Currency')) {
      context.handle(_currencyMeta,
          currency.isAcceptableOrUnknown(data['Currency']!, _currencyMeta));
    } else if (isInserting) {
      context.missing(_currencyMeta);
    }
    if (data.containsKey('Amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['Amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('PrimaryID')) {
      context.handle(_primaryIDMeta,
          primaryID.isAcceptableOrUnknown(data['PrimaryID']!, _primaryIDMeta));
    } else if (isInserting) {
      context.missing(_primaryIDMeta);
    }
    if (data.containsKey('SecondaryID')) {
      context.handle(
          _secondaryIDMeta,
          secondaryID.isAcceptableOrUnknown(
              data['SecondaryID']!, _secondaryIDMeta));
    } else if (isInserting) {
      context.missing(_secondaryIDMeta);
    }
    if (data.containsKey('Description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['Description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('Type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['Type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('Account')) {
      context.handle(_accountMeta,
          account.isAcceptableOrUnknown(data['Account']!, _accountMeta));
    } else if (isInserting) {
      context.missing(_accountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {ID};
  @override
  AccountTransactionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AccountTransactionData(
      ID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ID'])!,
      dateAndTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}DateAndTime'])!,
      currency: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}Currency'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}Amount'])!,
      primaryID: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}PrimaryID'])!,
      secondaryID: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}SecondaryID'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}Description'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}Type'])!,
      account: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}Account'])!,
    );
  }

  @override
  $AccountTransactionTable createAlias(String alias) {
    return $AccountTransactionTable(attachedDatabase, alias);
  }
}

class AccountTransactionData extends DataClass
    implements Insertable<AccountTransactionData> {
  final int ID;
  final DateTime dateAndTime;
  final String currency;
  final double amount;
  final String primaryID;
  final String secondaryID;
  final String description;
  final String type;
  final String account;
  const AccountTransactionData(
      {required this.ID,
      required this.dateAndTime,
      required this.currency,
      required this.amount,
      required this.primaryID,
      required this.secondaryID,
      required this.description,
      required this.type,
      required this.account});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['ID'] = Variable<int>(ID);
    map['DateAndTime'] = Variable<DateTime>(dateAndTime);
    map['Currency'] = Variable<String>(currency);
    map['Amount'] = Variable<double>(amount);
    map['PrimaryID'] = Variable<String>(primaryID);
    map['SecondaryID'] = Variable<String>(secondaryID);
    map['Description'] = Variable<String>(description);
    map['Type'] = Variable<String>(type);
    map['Account'] = Variable<String>(account);
    return map;
  }

  AccountTransactionCompanion toCompanion(bool nullToAbsent) {
    return AccountTransactionCompanion(
      ID: Value(ID),
      dateAndTime: Value(dateAndTime),
      currency: Value(currency),
      amount: Value(amount),
      primaryID: Value(primaryID),
      secondaryID: Value(secondaryID),
      description: Value(description),
      type: Value(type),
      account: Value(account),
    );
  }

  factory AccountTransactionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AccountTransactionData(
      ID: serializer.fromJson<int>(json['ID']),
      dateAndTime: serializer.fromJson<DateTime>(json['dateAndTime']),
      currency: serializer.fromJson<String>(json['currency']),
      amount: serializer.fromJson<double>(json['amount']),
      primaryID: serializer.fromJson<String>(json['primaryID']),
      secondaryID: serializer.fromJson<String>(json['secondaryID']),
      description: serializer.fromJson<String>(json['description']),
      type: serializer.fromJson<String>(json['type']),
      account: serializer.fromJson<String>(json['account']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'ID': serializer.toJson<int>(ID),
      'dateAndTime': serializer.toJson<DateTime>(dateAndTime),
      'currency': serializer.toJson<String>(currency),
      'amount': serializer.toJson<double>(amount),
      'primaryID': serializer.toJson<String>(primaryID),
      'secondaryID': serializer.toJson<String>(secondaryID),
      'description': serializer.toJson<String>(description),
      'type': serializer.toJson<String>(type),
      'account': serializer.toJson<String>(account),
    };
  }

  AccountTransactionData copyWith(
          {int? ID,
          DateTime? dateAndTime,
          String? currency,
          double? amount,
          String? primaryID,
          String? secondaryID,
          String? description,
          String? type,
          String? account}) =>
      AccountTransactionData(
        ID: ID ?? this.ID,
        dateAndTime: dateAndTime ?? this.dateAndTime,
        currency: currency ?? this.currency,
        amount: amount ?? this.amount,
        primaryID: primaryID ?? this.primaryID,
        secondaryID: secondaryID ?? this.secondaryID,
        description: description ?? this.description,
        type: type ?? this.type,
        account: account ?? this.account,
      );
  @override
  String toString() {
    return (StringBuffer('AccountTransactionData(')
          ..write('ID: $ID, ')
          ..write('dateAndTime: $dateAndTime, ')
          ..write('currency: $currency, ')
          ..write('amount: $amount, ')
          ..write('primaryID: $primaryID, ')
          ..write('secondaryID: $secondaryID, ')
          ..write('description: $description, ')
          ..write('type: $type, ')
          ..write('account: $account')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(ID, dateAndTime, currency, amount, primaryID,
      secondaryID, description, type, account);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccountTransactionData &&
          other.ID == this.ID &&
          other.dateAndTime == this.dateAndTime &&
          other.currency == this.currency &&
          other.amount == this.amount &&
          other.primaryID == this.primaryID &&
          other.secondaryID == this.secondaryID &&
          other.description == this.description &&
          other.type == this.type &&
          other.account == this.account);
}

class AccountTransactionCompanion
    extends UpdateCompanion<AccountTransactionData> {
  final Value<int> ID;
  final Value<DateTime> dateAndTime;
  final Value<String> currency;
  final Value<double> amount;
  final Value<String> primaryID;
  final Value<String> secondaryID;
  final Value<String> description;
  final Value<String> type;
  final Value<String> account;
  const AccountTransactionCompanion({
    this.ID = const Value.absent(),
    this.dateAndTime = const Value.absent(),
    this.currency = const Value.absent(),
    this.amount = const Value.absent(),
    this.primaryID = const Value.absent(),
    this.secondaryID = const Value.absent(),
    this.description = const Value.absent(),
    this.type = const Value.absent(),
    this.account = const Value.absent(),
  });
  AccountTransactionCompanion.insert({
    this.ID = const Value.absent(),
    required DateTime dateAndTime,
    required String currency,
    required double amount,
    required String primaryID,
    required String secondaryID,
    required String description,
    required String type,
    required String account,
  })  : dateAndTime = Value(dateAndTime),
        currency = Value(currency),
        amount = Value(amount),
        primaryID = Value(primaryID),
        secondaryID = Value(secondaryID),
        description = Value(description),
        type = Value(type),
        account = Value(account);
  static Insertable<AccountTransactionData> custom({
    Expression<int>? ID,
    Expression<DateTime>? dateAndTime,
    Expression<String>? currency,
    Expression<double>? amount,
    Expression<String>? primaryID,
    Expression<String>? secondaryID,
    Expression<String>? description,
    Expression<String>? type,
    Expression<String>? account,
  }) {
    return RawValuesInsertable({
      if (ID != null) 'ID': ID,
      if (dateAndTime != null) 'DateAndTime': dateAndTime,
      if (currency != null) 'Currency': currency,
      if (amount != null) 'Amount': amount,
      if (primaryID != null) 'PrimaryID': primaryID,
      if (secondaryID != null) 'SecondaryID': secondaryID,
      if (description != null) 'Description': description,
      if (type != null) 'Type': type,
      if (account != null) 'Account': account,
    });
  }

  AccountTransactionCompanion copyWith(
      {Value<int>? ID,
      Value<DateTime>? dateAndTime,
      Value<String>? currency,
      Value<double>? amount,
      Value<String>? primaryID,
      Value<String>? secondaryID,
      Value<String>? description,
      Value<String>? type,
      Value<String>? account}) {
    return AccountTransactionCompanion(
      ID: ID ?? this.ID,
      dateAndTime: dateAndTime ?? this.dateAndTime,
      currency: currency ?? this.currency,
      amount: amount ?? this.amount,
      primaryID: primaryID ?? this.primaryID,
      secondaryID: secondaryID ?? this.secondaryID,
      description: description ?? this.description,
      type: type ?? this.type,
      account: account ?? this.account,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (ID.present) {
      map['ID'] = Variable<int>(ID.value);
    }
    if (dateAndTime.present) {
      map['DateAndTime'] = Variable<DateTime>(dateAndTime.value);
    }
    if (currency.present) {
      map['Currency'] = Variable<String>(currency.value);
    }
    if (amount.present) {
      map['Amount'] = Variable<double>(amount.value);
    }
    if (primaryID.present) {
      map['PrimaryID'] = Variable<String>(primaryID.value);
    }
    if (secondaryID.present) {
      map['SecondaryID'] = Variable<String>(secondaryID.value);
    }
    if (description.present) {
      map['Description'] = Variable<String>(description.value);
    }
    if (type.present) {
      map['Type'] = Variable<String>(type.value);
    }
    if (account.present) {
      map['Account'] = Variable<String>(account.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountTransactionCompanion(')
          ..write('ID: $ID, ')
          ..write('dateAndTime: $dateAndTime, ')
          ..write('currency: $currency, ')
          ..write('amount: $amount, ')
          ..write('primaryID: $primaryID, ')
          ..write('secondaryID: $secondaryID, ')
          ..write('description: $description, ')
          ..write('type: $type, ')
          ..write('account: $account')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $PrimaryCategoryTable primaryCategory =
      $PrimaryCategoryTable(this);
  late final $SecondaryCategoryTable secondaryCategory =
      $SecondaryCategoryTable(this);
  late final $AccountTransactionTable accountTransaction =
      $AccountTransactionTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [primaryCategory, secondaryCategory, accountTransaction];
}
