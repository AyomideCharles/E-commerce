import 'package:e_commerce/screens/cart.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class Products {
  final String title;
  final String image;
  final double price;

  Products({required this.title, required this.image, required this.price});
}

List<Products> products = [
  Products(
      title: 'Monitor LG 22"inch 4k', image: 'assets/tv.png', price: 199.99),
  Products(
      title: 'Oraimo Earphones', image: 'assets/earphones.png', price: 15.23),
  Products(title: 'Aesthetic-White Mug', image: 'assets/mug.png', price: 5.76),
  Products(title: 'Beats by Dre', image: 'assets/max.png', price: 420.99),
  Products(
      title: 'Apple Airpods Max', image: 'assets/beats.png', price: 256.78),
  Products(
      title: 'Monitor LG 22"inch 4k', image: 'assets/tv.png', price: 112.19),
];
List<Products> productItems = [];

class _HomeScreenState extends State<HomeScreen> {
  List category = [
    {'image': 'assets/apparel.png', 'text': 'Apparel'},
    {'image': 'assets/school.png', 'text': 'School'},
    {'image': 'assets/sports.png', 'text': 'Sports'},
    {'image': 'assets/electronic.png', 'text': 'Electronics'},
    {'image': 'assets/all.png', 'text': 'All'}
  ];

  addToCart(Products item) {
    productItems.add(item);
  }

  showSnack() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        duration: Duration(milliseconds: 500),
        content: Text('1 Item Added to Cart')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            ListTile(
              title: const Text(
                'Delivery address',
                style: TextStyle(color: Colors.grey),
              ),
              subtitle: const Row(
                children: [
                  Text(
                    'Salatiga City, Central Java',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Iconsax.arrow_down_1)
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Iconsax.shopping_cart),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Cart(
                                      productItems: [],
                                    )));
                      },
                      icon: const Icon(Iconsax.notification))
                ],
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: [
            const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Search here.....',
                  prefixIcon: Icon(Iconsax.search_normal)),
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Image.asset(
                    'assets/banner1.png',
                  ),
                  Image.asset(
                    'assets/banner1.png',
                  ),
                  Image.asset(
                    'assets/banner1.png',
                  )
                ],
              ),
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
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: category
                        .map((e) => Column(
                              children: [
                                Image.asset(
                                  e['image'],
                                  width: 50,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(e['text'])
                              ],
                            ))
                        .toList()),
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
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey)),
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
                GridView.builder(
                    itemCount: products.length,
                    physics: const ScrollPhysics(),
                    primary: true,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 25,
                            crossAxisSpacing: 20,
                            childAspectRatio: 0.75),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              products[index].image,
                              width: 200,
                              fit: BoxFit.fitWidth,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              products[index].title,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              '\$${products[index].price.toString()}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 17),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff67C4A7),
                                    minimumSize:
                                        const Size(double.infinity, 50),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
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
                      );
                    })
              ],
            )
          ]),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          fixedColor: const Color(0xff67C4A7),
          items: const [
            BottomNavigationBarItem(icon: Icon(Iconsax.home_25), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.heart),
              label: 'Wishlist',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.transaction_minus),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.profile_add),
              label: 'profile',
            )
          ]),
    );
  }
}
