import 'package:e_commerce/views/cart/cart.dart';
import 'package:e_commerce/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../model/productsmodel.dart';
import '../../screens/details.dart';

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

  final _controller = PageController();

  addToCart(Products products) {
    productItems.add(products);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Badge(
                      smallSize: 0,
                      child: Stack(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Cart(
                                              productItems: [],
                                            )));
                              },
                              icon: const Icon(Iconsax.shopping_cart4)),
                          Positioned(
                            right: 0,
                            child: Text(
                              '${productItems.length}',
                              style: TextStyle(
                                  color: Colors.red.shade900, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                decoration: const InputDecoration(
                    hintText: 'Search Here......',
                    border: OutlineInputBorder()),
                onSubmitted: (value) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SearchResults(searchQuery: value)));
                },
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Category',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: category
                          .map((e) => Column(
                                children: [
                                  Image.asset(
                                    e['image'],
                                    width: 50,
                                  ),
                                  Text(e['text'])
                                ],
                              ))
                          .toList()),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Recent product',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
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
                    height: 10,
                  ),
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
                              // mainAxisExtent: 240
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
                              border: Border.all(color: Colors.grey.shade400),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  child: Hero(
                                    tag: 'animate-${products[index].image}',
                                    child: Image.asset(
                                      products[index].image,
                                      width: 190,
                                      height: 115,
                                      fit: BoxFit.cover,
                                    ),
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
                                        minimumSize:
                                            const Size(double.infinity, 50),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5))),
                                    onPressed: () {
                                      setState(() {
                                        addToCart(products[index]);
                                      });
                                      showSnack();
                                    },
                                    child: const Text(
                                      'Add to cart',
                                      style: TextStyle(color: Colors.white),
                                    ))
                              ],
                            ),
                          ),
                        );
                      })
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }

// notification for items added to cart
  showSnack() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Color(0xff67C4A7),
        duration: Duration(milliseconds: 1000),
        content: Text(
          '1 Item Added to Cart',
          style: TextStyle(color: Colors.black),
        )));
  }
}
