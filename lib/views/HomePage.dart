import 'package:flutter/material.dart';

import '../dao/Database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Title row
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

  // Empty rows
  List<List<String>> rows = [];

  // Load DB values
  Future<void> loadRows() async {
    List<Map<String, dynamic>> results = await fetchRowsFromDatabase();

    setState(() {
      rows = results
          .map(
              (result) => columns.map((col) => result[col].toString()).toList())
          .toList();
    });
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

  Future<void> loadDatabase() async {
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
  }

  // questo metodo viene chiamato quando lo stato del widget viene creato
  @override
  void initState() {
    super.initState();

    loadDatabase();
    loadRows();
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
          // crea la prima riga con le stringhe già formattate
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
          // aggiungi le righe dal database
          for (final row in rows)
            TableRow(
              children: [
                for (final cell in row)
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
