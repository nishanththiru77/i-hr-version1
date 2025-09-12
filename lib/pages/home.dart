// lib/pages/home.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/applied%20companies';
import 'details.dart';
import 'cdetails.dart';
import 'applied_companies.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sangamam"),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Nishanth"),
              accountEmail: Text("nishanth@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("images/tom.jpeg"), // your profile image
              ),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
            ExpansionTile(
              leading: const Icon(Icons.business),
              title: const Text("Companies"),
              children: [
                ListTile(
                  title: const Text("Available Companies"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CompanyDetails()),
                    );
                  },
                ),
                ListTile(
                  title: const Text("Applied Companies"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AppliedCompanies()),
                    );
                  },
                ),
              ],
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCompanyCard(
            context,
            "Besmak Components Pvt Ltd",
            "images/WhatsApp Image 2025-08-10 at 15.51.30_58699a38.jpg",
            const CompanyDetails(),
          ),
          const SizedBox(height: 20),
          _buildCompanyCard(
            context,
            "Another Company",
            "images/company2.jpg",
            const CompanyDetails1(),
          ),
        ],
      ),
    );
  }

  Widget _buildCompanyCard(
      BuildContext context, String name, String imagePath, Widget page) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              imagePath,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 150,
                color: Colors.grey[300],
                child: const Center(
                  child: Icon(Icons.image_not_supported,
                      size: 40, color: Colors.black45),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => page),
                    );
                  },
                  child: Text(
                    "Learn more",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue[700],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
