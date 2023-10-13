
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectionScreen extends StatefulWidget {
  @override
  _SelectionScreenState createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {

  List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8'
  ];

  List<bool> selected = [false, false, false, false, false, false, false, false];

  void itemSelection(int index) {
    selected[index] = !selected[index];
    setState(() {
    });
  }

  void showSelectionDialog() {
    int selectedCount = selected.where((item) => item).length;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Selected Items'),
          content: Text('Totals number of  selected items: $selectedCount'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Selection'),
        elevation: 10,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            tileColor: selected[index] ? Colors.amber : Colors.white,
            onTap: () {
              itemSelection(index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showSelectionDialog();
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
