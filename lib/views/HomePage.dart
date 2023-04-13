import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../dao/Database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

/// Home page class
class _HomePageState extends State<HomePage> {
  // Init database class
  MyDatabase database = MyDatabase();

  /// Title row
  /// TODO I don't know if there is a dynamic way to get the coumns names
  final List<String> columnsAccountTransaction = [
    'ID',
    'Date and Time',
    'Currency',
    'Amount',
    'Primary',
    'Secondary',
    'Description',
    'Type',
    'Account'
  ];

  /// Title row
  /// TODO I don't know if there is a dynamic way to get the coumns names
  final List<String> columnsPrimaryCategory = [
    'ID',
  ];

  /// Title row
  /// TODO I don't know if there is a dynamic way to get the coumns names
  final List<String> columnsSecondaryCategory = ['ID', 'Primary'];

  /// Empty records
  List<List<String>> records = [];

  // Widget state init
  @override
  void initState() {
    super.initState();

    // init the DB connection
    initDatabaseConnection();
    // Load Records
    loadRecords();
  }

  // Load DB records
  Future<void> loadRecords() async {
    // Get the rows from DB
    List<dynamic> results = await fetchRowsFromDatabase();

    setState(() {
      records = results
          .map((result) => columnsAccountTransaction
              .map((col) => result[col].toString())
              .toList())
          .toList();
    });
  }

  // Init the connection with the DB
  // TODO I think that this need to return the DB instance for execute queries
  Future<void> initDatabaseConnection() async {
    // ***********************
    // Database
    // ***********************

    /// Simple test for the database
    // Insert
    /*await database.into(database.accountTransaction).insert(
        AccountTransactionCompanion.insert(
            dateAndTime: DateTime.now(),
            currency: "EUR",
            amount: 10.02,
            primary: "bello",
            secondary: "bello2",
            description: "description",
            type: "type",
            account: "account"));*/

    // Select
    // TODO Datetime crash
    final allTransactions =
        await database.select(database.accountTransaction).get();
    print('Transaction in database: $allTransactions');

    // Select
    final allPrimaryCategories =
        await database.select(database.primaryCategory).get();
    print('Primary Categories in database: $allPrimaryCategories');

    // Select
    final allSecondaryCategories =
        await database.select(database.secondaryCategory).get();
    print('Secondary Categories in database: $allSecondaryCategories');

    // ***********************
    // Finance API
    // ***********************

    final response = await http.get(Uri.parse(
        'https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=IBM&interval=5min&apikey=W11MP2QL3HTKN1SS'));

    print(jsonDecode(response.body));

    // Base API request
    // Don't know why but doesn't work
    //print(requestFinanceAPI());
  }

  // TODO I need to load the data from the DB
  Future<List<dynamic>> fetchRowsFromDatabase() async {
    // Select transactions
    final allTransactions =
        await database.select(database.accountTransaction).get();

    return allTransactions;
  }

  // Request the financial informations
  dynamic requestFinanceAPI() async {
    final response = await http.get(Uri.parse(
        'https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=IBM&interval=5min&apikey=W11MP2QL3HTKN1SS'));

    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Table(
        columnWidths: {
          for (int i = 0; i < columnsAccountTransaction.length; i++)
            i: const IntrinsicColumnWidth(),
        },
        children: [
          // Title row of the grid
          TableRow(
            children: [
              for (final col in columnsAccountTransaction)
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(col),
                  ),
                ),
            ],
          ),
          // DB Records
          for (final record in records)
            TableRow(
              children: [
                for (final cell in record)
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(cell),
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
