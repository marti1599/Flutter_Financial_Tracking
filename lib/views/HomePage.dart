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
  /// Title row
  final List<String> columns = [
    'Colonna 1',
    'Colonna 2',
    'Colonna 3',
    'Colonna 4',
    'Colonna 5',
    'Colonna 6',
    'Colonna 7',
    'Colonna 8',
    'Colonna 9'
  ];

  /// Empty records
  List<List<String>> records = [];

  // Widget state init
  @override
  void initState() {
    super.initState();

    // init the DB connection
    InitDatabaseConnection();
    // Load Records
    loadRecords();
  }

  // Load DB records
  Future<void> loadRecords() async {
    // Get the rows from DB
    List<Map<String, dynamic>> results = await fetchRowsFromDatabase();

    setState(() {
      records = results
          .map(
              (result) => columns.map((col) => result[col].toString()).toList())
          .toList();
    });
  }

  // Init the connection with the DB
  // TODO I think that this need to return the DB instance for execute queries
  Future<void> InitDatabaseConnection() async {
    // ***********************
    // Database
    // ***********************

    final database = MyDatabase();

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
  Future<List<Map<String, dynamic>>> fetchRowsFromDatabase() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      {
        'Colonna 1': 'Valore 1.1',
        'Colonna 2': 'Valore 1.2',
        'Colonna 3': 'Valore 1.3',
        'Colonna 4': 'Valore 1.4',
        'Colonna 5': 'Valore 1.5',
        'Colonna 6': 'Valore 1.6',
        'Colonna 7': 'Valore 1.7',
        'Colonna 8': 'Valore 1.8',
        'Colonna 9': 'Valore 1.9'
      },
      {'Colonna 1': 'Valore 2.1', 'Colonna 2': 'Valore 2.2'}
    ];
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
          for (int i = 0; i < columns.length; i++)
            i: const IntrinsicColumnWidth(),
        },
        children: [
          // Title row of the grid
          TableRow(
            children: [
              for (final col in columns)
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
