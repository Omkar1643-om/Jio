import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:jio_project/models/myapp.dart';
import 'package:jio_project/widgets/drawer.dart';
import 'package:jio_project/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 1));
    final myappJson =
    await rootBundle.loadString("assets/files/myapp.json");
    final decodeData = jsonDecode(myappJson);
    var productsData = decodeData["products"];
    MyappModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {},
        child: Icon(CupertinoIcons.cart),
        // backgroundColor: Colors.deepPurple,
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Center(
          child: Text(
            "My App",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w200,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: (MyappModel.items != null && MyappModel.items.isNotEmpty)
          ? GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          // return ItemWidget(
          // item: MyappModel.items[index], // all this three line code will show details of phone
            // key: Key('item_$index'),
           // );
          crossAxisCount: 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: MyappModel.items.length,
        itemBuilder: (context, index) {
          final item = MyappModel.items[index];
          return Card(
            // color: Colors.white54,
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(15.0),
                    ),
                    child: Image.network(
                      item.image,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                    bottom: 8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${item.price}",
                        style: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                       // Add your Buy button here
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Text("Buy"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      )
          : const Center(
        child: CircularProgressIndicator(),
      ),
      drawer: const MyDrawer(),
    );
  }
}