import 'package:flutter/material.dart';
 // import 'package:flutter_myapp/models/myapp.dart';
import '../models/myapp.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({required this.item, required Key key,}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print("${item.name} pressed");
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price}",
          textScaleFactor: 1.5,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
