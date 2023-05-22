import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'home.dart';

class ProductDetails extends StatefulWidget {
  final List<Products> productdetails;
  const ProductDetails({super.key, required this.productdetails});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  Color buttonColor = const Color(0xff67C4A7);

  void changeButtonColor() {
    setState(() {
      buttonColor = buttonColor == Colors.green ? Colors.white : Colors.green;
    });
  }

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
                  Image.asset('assets/beats.png'),
                  const ListTile(
                    title: Text('Apple Airpods Max'),
                    subtitle: Text('1999'),
                    trailing: Icon(Iconsax.heart),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
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
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return const Card();
                              }),
                          const Divider(),
                          ListTile(
                            leading: Image.asset('assets/applelogo.png'),
                            title: const Text('Apple Store'),
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
                          const Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pharetra, metus in dapibus auctor, leo nunc vestibulum enim, at vulputate felis risus vitae dui. In ac ligula a felis fringilla aliquam. Mauris varius fringilla nunc, sit amet auctor tellus placerat sed. Proin dapibus tincidunt tristique. Sed sagittis ante ac enim sollicitudin rutrum. Nullam sed ex id sem suscipit tincidunt non eu ex. Aliquam eget dui id metus convallis fermentum. Ut vitae aliquam sem. Quisque bibendum ante eu dui laoreet bibendum. Suspendisse potenti. Nulla facilisi. Mauris pharetra consectetur nunc non tempus. Sed in faucibus duivestibulum enim, at vulputate felis risus vitae dui. In ac ligula a felis fringilla aliquam. Mauris varius fringilla nunc, sit amet auctor tellus placerat sed. Proin dapibus tincidunt tristique. Sed sagittis ante ac enim sollicitudin rutrum. Nullam sed ex id sem suscipit tincidunt non eu ex. Aliquam eget dui id metus convallis fermentum. Ut vitae aliquam sem. Quisque bibendum ante eu dui laoreet bibendum. Suspendisse potenti. Nulla facilisi. Mauris pharetra consectetur nunc non tempus. Sed i')
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
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
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColor,
                            minimumSize: const Size(100, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        onPressed: () {
                          changeButtonColor;
                        },
                        child: const Text('Add to Cart')),
                    const SizedBox(
                      width: 30,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(100, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        onPressed: () {},
                        child: const Text('Buy Now'))
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
