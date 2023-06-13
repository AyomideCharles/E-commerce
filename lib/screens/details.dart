import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../model/productsmodel.dart';

class ProductDetails extends StatefulWidget {
  final Products productdetail;
  const ProductDetails({super.key, required this.productdetail});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  Color buttonColor = const Color(0xff67C4A7);

  List colors = [
    const Color(0xff3E3D40),
    const Color(0xffD5E0ED),
    const Color(0xffE4F2DF),
    const Color(0xffECECEC),
    const Color(0xffF5E3DF),
  ];

  Color _buttonColor = Colors.grey;
  final Color _initialColor = Colors.grey;

  void _changeColor() {
    setState(() {
      _buttonColor =
          (_buttonColor == _initialColor) ? Colors.red : _initialColor;
    });
  }

  // List<Products> wishlist = [];

  // void addToWishlist(Products item) {
  //   setState(() {
  //     wishlist.add(item);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product Details'),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    widget.productdetail.image,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                  ListTile(
                    title: Text(widget.productdetail.title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400)),
                    subtitle: Text(
                      '\$ ${widget.productdetail.price}',
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        // addToWishlist(item);
                        _changeColor();
                      },
                      icon: Icon(
                        Iconsax.lovely5,
                        color: _buttonColor,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    width: double.infinity,
                    height: 500,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Choose the color'),
                          GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 5),
                              itemCount: colors.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {},
                                  child: Card(
                                    color: colors[index],
                                  ),
                                );
                              }),
                          const Divider(),
                          ListTile(
                            leading: Image.asset('assets/applelogo.png'),
                            title: const Text(
                              'Apple Store',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            subtitle: const Text('online 12 mins ago'),
                            trailing: TextButton(
                              style: TextButton.styleFrom(
                                  minimumSize: const Size(100, 50),
                                  side: const BorderSide(color: Colors.grey),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                              onPressed: () {},
                              child: const Text(
                                'Follow',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                            ),
                          ),
                          const Divider(),
                          const Text(
                            'Description of product',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          Text(widget.productdetail.description)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey)),
                  color: Colors.white,
                ),
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[200],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        onPressed: () {},
                        child: const Text(
                          'Add to Cart',
                          style: TextStyle(color: Colors.black),
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            backgroundColor: Colors.grey[200]),
                        onPressed: () {},
                        child: const Text(
                          'Buy Now',
                          style: TextStyle(color: Colors.black),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
