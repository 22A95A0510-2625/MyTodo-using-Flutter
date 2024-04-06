import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch:Colors.purple),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List todoList = [];
  String singlevalue = "";

  addString(content) {
    setState(() {
      singlevalue = content;
    });
  }

  addList() {
    setState(() {
      todoList.add({"value": singlevalue});
    });
  }

  deleteItem(index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MyToDo",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 75,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        elevation: 0,
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/th.jpg"),fit: BoxFit.cover)
        ),
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                flex: 90,
                child: ListView.builder(
                    itemCount: todoList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(color: Colors.purple,width: 6)
                        ),
                        color: Colors.white,
                        child: SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: Container(
                            margin: EdgeInsets.only(left: 20),
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 80,
                                  child: Text(
                                    todoList[index]['value'].toString(),
                                    style: TextStyle(
                                      color: Colors.purple,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 20,
                                    child: CircleAvatar(
                                      radius: 30,
                                      backgroundColor: Colors.white,
                                      child: TextButton(
                                        onPressed: () {
                                          deleteItem(index);
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.purple,
                                          size: 30,
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Expanded(
                  flex: 10,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 70,
                        child: Container(
                          height: 40,
                          child: TextFormField(
                            onChanged: (content) {
                              addString(content);
                            },
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: Colors.purple),
                                ),
                                fillColor: Colors.purple[300],
                                filled: true,
                                labelText: "Let's do Task....",
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 3,
                          child: SizedBox(
                            width: 5,
                          )),
                      Expanded(
                          flex: 27,
                          child: ElevatedButton(
                            onPressed: () {
                              addList();
                            },
                            child: Container(
                                height: 15,
                                width: double.infinity,
                                alignment: Alignment.center,
                                child: Text("Add")),
                          )),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
