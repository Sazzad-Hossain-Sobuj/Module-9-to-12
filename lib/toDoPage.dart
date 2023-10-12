import 'package:flutter/material.dart';
import 'package:m9_m12_all/style.dart';

class toDoPage extends StatefulWidget {
  const toDoPage({Key? key}) : super(key: key);

  @override
  State<toDoPage> createState() => _toDoPageState();
}

class _toDoPageState extends State<toDoPage> {
  List ToDoList = [];
  String item = '';

  MyInputOnchange(content){
    item = content;
    setState(() {});
  }

  AddItem(){
    ToDoList.add({'item':item});
    setState(() {});
  }

  RemoveItem(index){
    ToDoList.removeAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To_Do'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                      flex: 8,
                      child: TextFormField(
                        onChanged: (content){MyInputOnchange(content);},
                        decoration: AppInputDecration('ListItem'),
                      )),
                  SizedBox(width: 10),
                  Expanded(
                      flex: 3,
                      child: ElevatedButton(
                        onPressed: () {
                          AddItem();
                        },
                        child: Icon(Icons.add),
                        style: AppButtonStyle(),
                      )),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              flex: 9,
              child: ListView.builder(
                itemCount: ToDoList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: sizebox50(
                        Row(
                          children: [
                            Expanded(flex: 8,child: Text(ToDoList[index]['item'].toString())),
                            Expanded(flex: 3,child: TextButton(onPressed: (){RemoveItem(index);}, child: Icon(Icons.delete))),
                          ],
                        )
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
