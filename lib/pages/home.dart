// lib/pages/home.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/applied%20companies';
import 'details.dart';
import 'cdetails.dart';
// import 'applied_companies.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String jobType = "Full-time";
  String roomRequired = "Yes";
  String foodRequired = "Yes";

  void _openFilterSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Filter Options",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),

              // Job Type
              Row(
                children: [
                  const Text("Job Type: ",
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  const SizedBox(width: 8),
                  ChoiceChip(
                    label: const Text("Full-time"),
                    selected: jobType == "Full-time",
                    onSelected: (_) => setState(() => jobType = "Full-time"),
                  ),
                  const SizedBox(width: 6),
                  ChoiceChip(
                    label: const Text("Part-time"),
                    selected: jobType == "Part-time",
                    onSelected: (_) => setState(() => jobType = "Part-time"),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Room Required
              Row(
                children: [
                  const Text("Room Required: ",
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  const SizedBox(width: 8),
                  ChoiceChip(
                    label: const Text("Yes"),
                    selected: roomRequired == "Yes",
                    onSelected: (_) => setState(() => roomRequired = "Yes"),
                  ),
                  const SizedBox(width: 6),
                  ChoiceChip(
                    label: const Text("No"),
                    selected: roomRequired == "No",
                    onSelected: (_) => setState(() => roomRequired = "No"),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Food Required
              Row(
                children: [
                  const Text("Food Required: ",
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  const SizedBox(width: 8),
                  ChoiceChip(
                    label: const Text("Yes"),
                    selected: foodRequired == "Yes",
                    onSelected: (_) => setState(() => foodRequired = "Yes"),
                  ),
                  const SizedBox(width: 6),
                  ChoiceChip(
                    label: const Text("No"),
                    selected: foodRequired == "No",
                    onSelected: (_) => setState(() => foodRequired = "No"),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("Apply Filters"),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sangamam"),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, size: 28),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfilePage()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Nishanth"),
              accountEmail: Text("nishanth@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("images/tom.jpeg"),
              ),
              decoration: BoxDecoration(color: Colors.blueAccent),
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
                      MaterialPageRoute(
                          builder: (context) => const CompanyDetails()),
                    );
                  },
                ),
                ListTile(
                  title: const Text("Applied Companies"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AppliedCompanies()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 🔹 Filter Button
          ElevatedButton.icon(
            onPressed: _openFilterSheet,
            icon: const Icon(Icons.filter_alt),
            label: const Text("Filter"),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
              backgroundColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          const SizedBox(height: 16),

          _buildCompanyCard(
            context,
            name: "Besmak Components Pvt Ltd",
            location: "Chennai, Tamil Nadu",
            roles: const ["Plumber", "tailor", "Driver"],
            imagePath:
                "images/WhatsApp Image 2025-08-10 at 15.51.30_58699a38.jpg",
            page: const CompanyDetails(),
          ),
          const SizedBox(height: 20),
          _buildCompanyCard(
            context,
            name: "ABC Industries",
            location: "Coimbatore, Tamil Nadu",
            roles: const ["Welder", "Fitter", "Mechanic"],
            imagePath: "images/tom.jpeg",
            page: const CompanyDetails1(),
          ),
        ],
      ),
    );
  }

  Widget _buildCompanyCard(BuildContext context,
      {required String name,
      required String location,
      required List<String> roles,
      required String imagePath,
      required Widget page}) {
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    const Icon(Icons.location_on,
                        size: 16, color: Colors.redAccent),
                    const SizedBox(width: 4),
                    Text(location,
                        style: const TextStyle(
                            color: Colors.black54, fontSize: 14)),
                  ],
                ),
                Wrap(
                  spacing: 6,
                  children: roles
                      .map((role) => Chip(
                            label: Text(role),
                            backgroundColor: Colors.blue[50],
                          ))
                      .toList(),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => page),
                    );
                  },
                  child: Text("Learn more",
                      style: TextStyle(
                          color: Colors.blue[700],
                          fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
