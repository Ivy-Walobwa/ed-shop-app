import 'package:flutter/material.dart';
import '../models/shop_item.dart';

class ItemDetailsScreen extends StatelessWidget {
  final ShopItem? item;

  const ItemDetailsScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Item"),
      ),
      body: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item!.name,
                style: Theme.of(context).textTheme.headline2,
              ),
               Text(item!.description,   style: const TextStyle(fontSize: 20),)
            ],
          ),
        ),
      ),
    );
  }
}
