import 'package:flutter/material.dart';

import '../models/shop_item.dart';

class ItemListScreen extends StatelessWidget {
  final List<ShopItem> items;
  final ValueChanged<ShopItem> onTapped ;

  const ItemListScreen({Key? key, required this.items, required this.onTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Item List"),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) =>   ListTile(
          onTap: ()=> onTapped(items[index]),
          title: Text(items[index].name),
        ),
        itemCount: 3,
      ),
    );
  }
}
