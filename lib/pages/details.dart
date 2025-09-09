import 'package:flutter/material.dart';

class CompanyDetails extends StatelessWidget {
  const CompanyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Company Details"),
        backgroundColor: Colors.blue,
      ),
    body: Column(
      children: [
        Image.asset(
          "images/WhatsApp Image 2025-08-10 at 15.51.30_58699a38.jpg",
          height: 150,
          width: 250,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Besmak Components Pvt Ltd",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "Location: Chennai, Tamil Nadu",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              const Text(
                "Job Role: Plumber 🪠",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                "About Company:\nBesmak Components Pvt Ltd is a leading manufacturing company "
                "in Chennai specializing in high-quality industrial products. "
                "They are currently hiring for skilled plumbers to join their maintenance team.",
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ],
    ),
);
}
}
