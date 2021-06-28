import 'package:flutter/material.dart';

class Todo extends StatefulWidget {

  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  List<dynamic> lst= [];
  var output = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Todo App")),
      backgroundColor: Colors.teal[900],
      ),
      backgroundColor: Colors.teal,
      body: Container(
        margin: EdgeInsets.all(2.8),
        child: ListView.builder(itemCount: lst.length,itemBuilder: (context,index){
          return Container(
            height: 50,
            color: Colors.tealAccent[100],
            margin: EdgeInsets.only(top: 15),
            child: ListTile(title: Text("${lst[index]}"),trailing: Container(
              width: 50,
              child: Row(
                children: [
                  GestureDetector(onTap: (){
                    setState(() {
                      lst.removeAt(index);
                    });
                  },child: Icon(Icons.delete)),

                  GestureDetector(onTap: (){

showDialog(context: context, builder: (context){
            return AlertDialog(
              title: Text("Edit Item"),
              content: TextField(onChanged: (value){
                setState(() {
                  output = value;
                });
              },),
              actions: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    lst.replaceRange(index, index+1, {output});
                  });
                  Navigator.of(context).pop();
                }, child: Text("Edit"))
              ],
            );
          });


                  },child: Icon(Icons.edit)),
                ],
              ),
            ),),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        showDialog(context: context, builder: (context){
          return AlertDialog(
            title: Text("Add Item"),
            content: TextField(onChanged: (value){
              setState(() {
                output = value;
              });
            },),
            actions: [
              ElevatedButton(onPressed: (){
                setState(() {
                  lst.add(output);
                });
                Navigator.of(context).pop();
              }, child: Text("Add"))
            ],
          );
        });
      },child: Text("Add"),),
      
    );
  }
}