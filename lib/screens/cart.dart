import 'package:flutter/material.dart';
import '../model/productsmodel.dart';
import 'bottom nav/home.dart';

class Cart extends StatefulWidget {
  final List<Products> productItems;
  const Cart({super.key, required this.productItems});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  showSnack() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Color(0xff67C4A7),
        duration: Duration(milliseconds: 500),
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

  double totalPrice = 0;

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
                  showBottom();
                },
                child: const Text('Clear All')),
          )
        ],
      ),
      body: Stack(children: [
        ListView.builder(
            itemCount: productItems.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    leading: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(value: _icChecked, onChanged: (value) {}),
                        Image.asset(
                          productItems[index].image,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productItems[index].title,
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                        const Text(
                          'Variant: Grey',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ],
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$ ${productItems[index].price.toString()}',
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  _decreaseCounter();
                                },
                                icon: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: const Icon(Icons.remove))),
                            Text(
                              '$_counter',
                            ),
                            IconButton(
                                onPressed: () {
                                  _incrementCounter();
                                  setState(() {});
                                },
                                icon: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: const Icon(Icons.add))),
                            IconButton(
                              icon: const Icon(Icons.cancel),
                              onPressed: () {
                                setState(() {
                                  showSnack();
                                  productItems.removeAt(index);
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Divider()
                ],
              );
            }),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200),
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
                    Text('$totalPrice')
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

  showBottom() async {
    await showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )),
        context: context,
        builder: (context) {
          return SizedBox(
            width: double.infinity,
            height: 180,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const Text('Are you sure you want to clear cart?'),
                  const SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          minimumSize: const Size(double.infinity, 50)),
                      onPressed: () {
                        productItems.clear();
                        setState(() {});
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Clear All',
                        style: TextStyle(color: Colors.black),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          minimumSize: const Size(double.infinity, 50)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Go back to Cart',
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              ),
            ),
          );
        });
  }

  final bool _icChecked = false;
}
