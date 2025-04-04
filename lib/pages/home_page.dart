import 'package:flutter/material.dart';
import 'package:todo_flutter/components/dialog_box.dart';

import '../components/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller = TextEditingController();

  List listTodo = [
  ];

  // handle checkbox change
  void checkBoxHandler(bool? value, int index) {
    setState(() {
      listTodo[index][1] = !listTodo[index][1];
    });
  }

  void saveHandler() {
    setState(() {
      listTodo.add([
        _controller.text, false
      ]);
      Navigator.of(context).pop();
      _controller.clear();
    });
  }

  void addTodoHandler() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveHandler,
          onCancel: () => Navigator.of(context).pop(),
        );
    });
  }
  
  void removeTodoHandler(int index) {
    setState(() {
      listTodo.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[200], 
      appBar: AppBar(
        title: Text("TODO"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTodoHandler,
        child: Icon(Icons.add)
      ),
      body: ListView.builder(
        itemCount: listTodo.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: listTodo[index][0], 
            isComplete: listTodo[index][1], 
            onChanged: (value) => checkBoxHandler(value, index),
            deleteFunction: (context) => removeTodoHandler(index),
          );
        }, 
      )
    );
  }
}
