import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdateTaskModal extends StatelessWidget {
  const UpdateTaskModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Update person name',
                  style: Theme.of(context).textTheme.titleLarge),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close)),
            ],
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'enter person name',
              enabledBorder: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(onPressed: () {}, child: Text('update')),
        ],
      ),
    );
  }
}