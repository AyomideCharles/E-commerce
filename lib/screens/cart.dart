import 'package:e_commerce/home.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Cart extends StatefulWidget {
  final List<Products> productItems;
  const Cart({super.key, required this.productItems});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  removeFromCart(Products item) {
    productItems.remove(item);
    setState(() {});
  }

  showSnack() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        duration: Duration(milliseconds: 500),
        content: Text('1 Item removed from Cart')));
  }

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
                trailing: IconButton(
                  onPressed: () {
                    removeFromCart(productItems[index]);
                    showSnack();
                  },
                  icon: const Icon(Iconsax.profile_delete4),
                ),
              ),
            );
          }),
    );
  }
}
