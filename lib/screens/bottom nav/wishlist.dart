import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset('assets/iphone.jpg'),
                    title: const Text('iPhone 14 pro max'),
                    subtitle: const Text('Color: White'),
                    trailing: const Icon(Iconsax.candle),
                  );
                })));
  }
}
