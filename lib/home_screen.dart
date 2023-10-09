import 'package:flutter/material.dart';
import 'package:m9_m12_all/update_task_modal.dart';

import 'add_new_task_modal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('To_Do'),
          elevation: 20,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return AddNewTaskModal();
                });
          },
          child: Icon(Icons.add),
        ),
        body: ListView.separated(
          itemCount: 5,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        title: Text('Actions:'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: Icon(Icons.edit),
                              title: Text('Update'),
                              onTap: () {
                                Navigator.pop(context);
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return UpdateTaskModal();
                                    });
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.delete),
                              title: Text('Delete'),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    });
              },
              leading: CircleAvatar(child: Text('${index + 1}')),
              title: Text('I am Sazzad Hossain'),
              subtitle: Text('I am from Tangail'),
              trailing: Text('Pending'),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              thickness: 2,
              height: 5,
            );
          },
        ));
  }
}




