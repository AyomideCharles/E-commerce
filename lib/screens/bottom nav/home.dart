import 'package:e_commerce/screens/cart.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../model/productsmodel.dart';
import '../details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

List<Products> productItems = [];

class _HomeState extends State<Home> {
  List category = [
    {'image': 'assets/apparel.png', 'text': 'Apparel'},
    {'image': 'assets/school.png', 'text': 'School'},
    {'image': 'assets/sports.png', 'text': 'Sports'},
    {'image': 'assets/electronic.png', 'text': 'Electronics'},
    {'image': 'assets/all.png', 'text': 'All'}
  ];

  addToCart(Products products) {
    productItems.add(products);
    cartItemCount++;
  }

  showSnack() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Color(0xff67C4A7),
        duration: Duration(milliseconds: 1000),
        content: Text(
          '1 Item Added to Cart',
          style: TextStyle(color: Colors.black),
        )));
  }

  final _controller = PageController();

  int cartItemCount = 0;
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Delivery Address',
                  style: TextStyle(fontSize: 16),
                ),
                Row(
                  children: [
                    Text(
                      'Lagos, Nigeria',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Iconsax.arrow_down5)
                  ],
                ),
              ],
            )
          ],
        ),
        actions: [
          const Icon(Iconsax.notification),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Badge.count(
              count: cartItemCount,
              child: IconButton(
                icon: const Icon(Iconsax.shopping_cart4),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Cart(productItems: [])));
                },
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: [
            SearchBar(
              elevation: const MaterialStatePropertyAll(1),
              backgroundColor: const MaterialStatePropertyAll(Colors.white),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
              leading: const Icon(Icons.search),
              hintText: 'Search here.....',
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 200,
              child: PageView(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                children: [
                  Image.asset(
                    'assets/banner1.png',
                    fit: BoxFit.contain,
                  ),
                  Image.asset(
                    'assets/banner2.png',
                    fit: BoxFit.contain,
                  ),
                  Image.asset(
                    'assets/banner3.png',
                    fit: BoxFit.contain,
                  )
                ],
              ),
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: const JumpingDotEffect(
                  dotColor: Colors.grey,
                  dotHeight: 15,
                  dotWidth: 15,
                  activeDotColor: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Category',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                ),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: category
                          .map((e) => Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey.shade300),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        e['image'],
                                        width: 50,
                                      ),
                                      Text(e['text'])
                                    ],
                                  ),
                                ),
                              ))
                          .toList()),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Recent product',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                    Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey.shade400)),
                        child: const Row(
                          children: [
                            Text(
                              'Filters',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(Iconsax.filter)
                          ],
                        )),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 300,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        GridView.builder(
                            itemCount: products.length,
                            physics: const ScrollPhysics(),
                            primary: true,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 20,
                                    crossAxisSpacing: 10,
                                    childAspectRatio: 0.75),
                            itemBuilder: (context, index) {
                              final selectedProduct = products[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return ProductDetails(
                                      productdetail: selectedProduct,
                                    );
                                  }));
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 3),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border:
                                        Border.all(color: Colors.grey.shade400),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                        child: Image.asset(
                                          products[index].image,
                                          width: 190,
                                          height: 115,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        products[index].title,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        '\$${products[index].price.toString()}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 17),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color(0xff67C4A7),
                                              minimumSize: const Size(
                                                  double.infinity, 50),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          onPressed: () {
                                            setState(() {
                                              addToCart(products[index]);
                                            });
                                            showSnack();
                                          },
                                          child: const Text(
                                            'Add to cart',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ))
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
