import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({
    super.key,
    required this.merchant
  });

  final Map merchant;

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
          height: 250.0,
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
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(product["productImage"]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                product["productName"],
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Text(
                product["productCaption"],
                style: const TextStyle(fontSize: 14, color: Colors.white70),
              ),
              Text(
                "${checkCurrencyCode()}${product["productPrice"]}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
