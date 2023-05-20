import 'package:e_commerce/home.dart';
import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';

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
        backgroundColor: Color(0xff67C4A7),
        duration: Duration(milliseconds: 200),
        content: Text(
          '1 Item removed from Cart',
          style: TextStyle(color: Colors.black),
        )));
  }

  int _counter = 1;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decreaseCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
        elevation: 1,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    productItems.clear();
                  });
                },
                child: const Text('Clear All')),
          )
        ],
      ),
      body: Stack(children: [
        ListView.builder(
            itemCount: productItems.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                child: Column(
                  children: [
                    ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      leading: Image.asset(productItems[index].image),
                      title: Text(
                        productItems[index].title,
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                      subtitle: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                _decreaseCounter();
                              },
                              icon: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: const Icon(Icons.remove))),
                          Text(
                            '$_counter',
                          ),
                          IconButton(
                              onPressed: () {
                                _incrementCounter();
                              },
                              icon: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: const Icon(Icons.add)))
                        ],
                      ),
                      trailing: Text(
                        '\$${productItems[index].price}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const Divider()
                  ],
                ),
              );
            }),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(10),
            height: 110,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    Text(
                      '$_counter',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        backgroundColor: const Color(0xff67C4A7),
                        minimumSize: const Size(double.infinity, 50)),
                    onPressed: () {},
                    child: const Text(
                      'Proceed to Checkout',
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            ),
          ),
        )
      ]),
    );
  }
}
