import 'package:flutter/rendering.dart';

class MyappModel {
  static  List<Item> items = [
    // Item(
    //     id: 1,
    //     name: "iPhone 12 Pro",
    //     desc: "Apple iPhone 12th generation",
    //     price: 999,
    //     color: "#33505a",
    //     image:
    //      "https://imgs.search.brave.com/9uWmbYhUGToSPjayIB9gThqVJsc7n-1g97Ywzw0fomk/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMudW5zcGxhc2gu/Y29tL3Bob3RvLTE2/MDk2OTI4MTQ4NTct/ZDBlYWVkNWExNDhj/P2l4bGliPXJiLTQu/MC4zJml4aWQ9TTN3/eE1qQTNmREI4TUh4/elpXRnlZMmg4Tlh4/OGFYQm9iMjVsSlRJ/d01USWxNakJ3Y204/bE1qQnRZWGg4Wlc1/OE1IeDhNSHg4ZkRB/PSZ3PTEwMDAmcT04/MA")
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({required this.id, required this.name, required this.desc, required this.price, required this.color, required this.image});

  factory Item.fromMap(Map<String,dynamic> map){
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );
  }
  toMap() => {
    "id" : id,
    "name" : name,
    "desc" : desc,
    "price" : price,
    "color" : color,
    "image" : image
  };
}
