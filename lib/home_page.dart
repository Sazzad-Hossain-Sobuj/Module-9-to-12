import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m9_m12_all/style.dart';
import 'item_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();

  List<ListItem> Items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        elevation: 10,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: Colors.pink,
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                    controller: titleController,
                    decoration: TodoInputDecration('Add title plz!')),
                SizedBox(height: 16),
                TextFormField(
                    controller: subtitleController,
                    decoration: TodoInputDecration('Add subtitle plz!')),
                SizedBox(height: 16),
                ElevatedButton(
                  style: AddEditButtonStyle(),
                  onPressed: () {
                    setState(() {
                      Items.add(
                        ListItem(
                          title: titleController.text,
                          subtitle: subtitleController.text,
                        ),
                      );
                      titleController.clear();
                      subtitleController.clear();
                    });
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: Items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      EdgeInsets.only(left: 12, top: 3, bottom: 3, right: 12),
                  child: Card(
                    elevation: 8,
                    child: ListTile(
                      title: Text(
                        Items[index].title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Text(Items[index].subtitle),
                      trailing: Icon(Icons.arrow_forward_outlined),
                      onLongPress: () {
                        _showEditDeleteDialog(context, index);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showEditDeleteDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('ALERT!'),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _showEditItemDialog(index);
                },
                child: Text('EDIT'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    Items.removeAt(index);
                    Navigator.of(context).pop();
                  });
                },
                child: Text('DELETE'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showEditItemDialog(int index) {
    String updatedTitle = Items[index].title;
    String updatedSubtitle = Items[index].subtitle;

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                initialValue: updatedTitle,
                onChanged: (value) {
                  updatedTitle = value;
                },
                decoration: TodoEditInputDecoration(),
              ),
              SizedBox(height: 10),
              TextFormField(
                initialValue: updatedSubtitle,
                onChanged: (value) {
                  updatedSubtitle = value;
                },
                decoration: TodoEditInputDecoration(),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                style: AddEditButtonStyle(),
                onPressed: () {
                  setState(() {
                    Items[index] = ListItem(
                      title: updatedTitle,
                      subtitle: updatedSubtitle,
                    );
                    Navigator.of(context).pop();
                  });
                },
                child: Text('Edit Done'),
              ),
            ],
          ),
        );
      },
    );
  }
}
