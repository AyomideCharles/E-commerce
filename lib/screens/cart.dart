import 'package:e_commerce/home.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  final List<Products> productItems;
  const Cart({super.key, required this.productItems});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
        elevation: 5,
      ),
      body: ListView.builder(
          itemCount: productItems.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
              child: ListTile(
                leading: Image.asset(productItems[index].image),
                title: Text(productItems[index].title),
              ),
            );
          }),
    );
  }
}
