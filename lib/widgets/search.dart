import 'package:flutter/material.dart';
import '../model/productsmodel.dart';

class SearchResults extends StatefulWidget {
  final String searchQuery;

  const SearchResults({Key? key, required this.searchQuery}) : super(key: key);

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  List<Products> displayedProducts = [];
  List<Products> allProducts = products;

  @override
  void initState() {
    super.initState();
    displayedProducts = allProducts.where((product) {
      final title = product.title.toLowerCase();
      return title.contains(widget.searchQuery.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search Results'),
        ),
        body: displayedProducts.isEmpty
            ? const Center(
                child: Text('No matching products found.'),
              )
            : ListView.builder(
                itemCount: displayedProducts.length,
                itemBuilder: (context, index) {
                  final products = displayedProducts[index];
                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: Card(
                      child: Column(
                        children: [
                          Image.asset(products.image),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff67C4A7)),
                              onPressed: () {},
                              child: const Text(
                                'Add to cart',
                                style: TextStyle(color: Colors.white),
                              ))
                        ],
                      ),
                    ),
                  );
                }));
  }
}
