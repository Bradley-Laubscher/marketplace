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
  int _selectedIndex = 0;
  List<Map<String, dynamic>> _cart = [];

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
          Column(
            children: [
              // **AppBar with Merchant Logo and Navigation Items**
              AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Color(widget.merchant["merchantPrimaryColour"]),
                title: LayoutBuilder(
                  builder: (context, constraints) {
                    // Only show the merchant name if the screen is wide enough
                    bool showMerchantName = constraints.maxWidth > 600; // You can adjust this threshold

                    return Row(
                      children: [
                        // Merchant Logo and Name aligned to the left
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundImage: AssetImage(widget.merchant["merchantLogo"]),
                              backgroundColor: Colors.transparent,
                            ),
                            const SizedBox(width: 10),
                            if (showMerchantName) // Conditionally display merchant name
                              Text(
                                widget.merchant["merchantName"],
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black,
                                ),
                              ),
                          ],
                        ),
                        // Scrollable Navigation items
                        Expanded(
                          child: Center(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  _buildNavItem("Products", 0),
                                  _buildNavItem("About Us", 1),
                                  _buildNavItem("FAQ", 2),
                                  _buildNavItem("Checkout", 3),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                actions: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                    margin: const EdgeInsets.only(right: 20),
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      hoverColor: Colors.red,
                      tooltip: "Log Out",
                      onPressed: () {
                        // Navigate back to LoginPage
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              // **Content**
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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: _selectedIndex == index ? 8.0 : 4.0),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: TextStyle(
            fontSize: _selectedIndex == index ? 20 : 18,
            fontWeight: FontWeight.bold,
            color: _selectedIndex == index ? Colors.black : Colors.black38,
          ),
          child: Text(title),
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
        return FAQPage(
          merchant: widget.merchant,
        );
      case 3:
        return CheckoutPage(
          cart: _cart,
          merchant: widget.merchant,
        );
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
