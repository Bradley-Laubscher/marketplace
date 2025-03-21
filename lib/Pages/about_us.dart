import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({
  super.key,
    required this.merchant
  });

  final Map merchant;

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {

    // **About Us Section (Placeholder)**
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          "${widget.merchant["merchantName"]} is a premium provider of high-quality products, ensuring customer satisfaction and excellence.",
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
        ),
      ),
    );
  }
}
