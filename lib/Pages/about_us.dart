import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({
    super.key,
    required this.merchant,
  });

  final Map merchant;

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    // **About Us Section**
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // This ensures content is centered
          children: [
            // Merchant's about section with background color
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                widget.merchant["aboutUs"],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 40),
            // Contact Us Section with background color
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  const Text(
                    'Contact Us',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Wrapping the contact info section with Center to ensure it's centered
                  Column(
                    children: [
                      _buildContactInfo('Email', widget.merchant["merchantEmail"]),
                      _buildContactInfo('Phone', widget.merchant["merchantPhoneNumber"]),
                      _buildContactInfo('Location', widget.merchant["merchantLocation"]),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            // Social Media Links with background color
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.facebook, color: Colors.blue),
                    onPressed: () {
                      // Navigate to the Facebook page
                    },
                  ),
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.instagram, color: Colors.pink),
                    onPressed: () {
                      // Navigate to the Instagram page
                    },
                  ),
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.twitter, color: Colors.lightBlue),
                    onPressed: () {
                      // Navigate to the Twitter page
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to display contact info
  Widget _buildContactInfo(String label, String info) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // This centers the contact info
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          // Wrap the text widget in an Expanded widget to make sure it does not overflow
          Expanded(
            child: Text(
              info,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.white70,
              ),
              overflow: TextOverflow.ellipsis, // Truncate long text with ellipsis
            ),
          ),
        ],
      ),
    );
  }
}