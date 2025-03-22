import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  final Map merchant;
  final Function(Map<String, dynamic>) onAddToCart;

  const ProductsPage({
    super.key,
    required this.merchant,
    required this.onAddToCart,
  });

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  String checkCurrencyCode() {
    switch (widget.merchant["currencyCode"]) {
      case "710":
        return "R";
      default:
        return "\$";
    }
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> products = widget.merchant["merchantProducts"];

    // **Product Carousel**
    return Center(
      child: CarouselSlider(
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height*0.5,
          autoPlay: true,
          enlargeCenterPage: true,
        ),
        items: products.map((product) {
          return Column(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(widget.merchant["merchantPrimaryColour"]),
                      width: 2
                    ),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(product["productImage"]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 2,
                    color: Color(widget.merchant["merchantPrimaryColour"]),
                    style: BorderStyle.solid
                  )
                ),
                width: MediaQuery.of(context).size.width*0.3,
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product["productName"],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      product["productCaption"],
                      style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "${checkCurrencyCode()}${product["productPrice"]}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                    const SizedBox(height: 12),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[700],
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          // Add product to cart
                          widget.onAddToCart(product);

                          // Show a message when product is added
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('${product["productName"]} added to cart')),
                          );
                        },
                        child: const Text(
                          'Add to Cart',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
