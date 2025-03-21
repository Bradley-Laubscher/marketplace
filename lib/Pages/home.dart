import 'package:flutter/material.dart';
import 'package:marketplace/Pages/about_us.dart';
import 'package:marketplace/Pages/checkout.dart';
import 'package:marketplace/Pages/faq.dart';
import 'package:marketplace/Pages/products.dart';

class HomePage extends StatefulWidget {
  final Map merchant;

  const HomePage({
    super.key,
    required this.merchant,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Track selected tab
  List<Map<String, dynamic>> _cart = []; // Cart list to store selected products

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            widget.merchant["merchantBanner"],
            fit: BoxFit.cover,
          ),

          // Content with AppBar
          Column(
            children: [
              AppBar(
                backgroundColor: Color(widget.merchant["merchantPrimaryColour"]).withOpacity(0.9), // Merchant's theme color
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildNavItem("Products", 0),
                    _buildNavItem("About Us", 1),
                    _buildNavItem("FAQ", 2),
                    _buildNavItem("Checkout", 3),
                  ],
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context); // Navigate back to LoginPage
                    },
                  ),
                ],
              ),
              Expanded(child: _buildContent()),
            ],
          ),
        ],
      ),
    );
  }

  // Builds navigation bar items
  Widget _buildNavItem(String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: _selectedIndex == index ? Colors.white : Colors.white70,
          ),
        ),
      ),
    );
  }

  // Builds content based on selected tab
  Widget _buildContent() {
    switch (_selectedIndex) {
      case 0:
        return ProductsPage(
          merchant: widget.merchant,
          onAddToCart: (product) {
            setState(() {
              _cart.add(product);
            });
          },
        );
      case 1:
        return AboutUsPage(merchant: widget.merchant);
      case 2:
        return const FAQPage();
      case 3:
        return CheckoutPage(cart: _cart);
      default:
        return ProductsPage(
          merchant: widget.merchant,
          onAddToCart: (product) {
            setState(() {
              _cart.add(product);
            });
          },
        );
    }
  }
}
