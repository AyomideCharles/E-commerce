import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
// import 'package:iconsax/iconsax.dart';
import '../model/productsmodel.dart';
import 'bottom nav/home.dart';

class Cart extends StatefulWidget {
  final List<Products> productItems;

  const Cart({super.key, required this.productItems});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  // notification for items removed from cart
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

  double countPrice = 0.0;

// increase item quantity in cart
  void addToCart(int index) {
    setState(() {
      // Increase the quantity of the selected item
      if (index >= 0 && index < productItems.length) {
        productItems[index].quantity++;
      }

      // Recalculate the total price after adding an item
      countPrice = 0.0;
      for (var product in productItems) {
        countPrice += product.price * product.quantity;
      }
      _counter++;
    });
  }

// reduce item quantity in cart
  void removeFromCart(int index) {
    setState(() {
      // Reduce the quantity of the selected item
      if (index >= 0 && index < productItems.length) {
        if (productItems[index].quantity > 1) {
          productItems[index].quantity--;
        }
      }

      // Recalculate the total price after removing an item
      countPrice = 0.0;
      for (var product in productItems) {
        countPrice += product.price * product.quantity;
      }
      if (_counter > 1) {
        _counter--;
      }
    });
  }

// get total price for all items added to the cart
  double calculateTotalPrice() {
    double totalPrice = 0.0;
    for (var products in productItems) {
      totalPrice += products.price * products.quantity;
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        elevation: 1,
        actions: [
          // Padding(
          //   padding: const EdgeInsets.only(right: 5),
          //   child: Badge(
          //     smallSize: 0,
          //     child: Row(
          //       children: [
          //         const Icon(Iconsax.shopping_cart4),
          //         const SizedBox(
          //           width: 10,
          //         ),
          //         Text('${productItems.length}')
          //       ],
          //     ),
          //   ),
          // ),
          IconButton(
              onPressed: () {
                showBottom();
              },
              icon: const Text('Clear All')),
        ],
      ),
      body: ListView.builder(
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
                      Checkbox(
                          checkColor: Colors.white,
                          fillColor:
                              const MaterialStatePropertyAll(Color(0xff67C4A7)),
                          value: _icChecked,
                          onChanged: (value) {
                            setState(() {
                              _icChecked = value!;
                            });
                          }),
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
                                removeFromCart(index);
                              },
                              icon: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: const Icon(Icons.remove))),
                          Text(productItems[index].quantity.toString()),
                          IconButton(
                              onPressed: () {
                                addToCart(index);
                              },
                              icon: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: const Icon(Icons.add))),
                          IconButton(
                            icon: const Icon(Icons.delete),
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
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        height: 110,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                Text('\$${calculateTotalPrice().toStringAsFixed(2)}')
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff67C4A7),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    minimumSize: const Size(double.infinity, 50)),
                onPressed: () {},
                child: const Text(
                  'Proceed to Checkout',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
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

  bool _icChecked = false;
}
