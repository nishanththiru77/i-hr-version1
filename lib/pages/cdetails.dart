// lib/pages/cdetails.dart
import 'package:flutter/material.dart';

class CompanyDetails1 extends StatelessWidget {
  final String name;
  final String location;
  final String about;
  final String founded;
  final String employees;
  final String industry;
  final List<String> roles;
  final String imagePath;

  const CompanyDetails1({
    super.key,
    this.name = 'Google Components Pvt Ltd',
    this.location = 'Bangalore, Karnataka',
    this.about =
        'Google Components Pvt Ltd is an innovative tech-driven manufacturing company focusing on automation and AI-based solutions for the industrial sector.',
    this.founded = '2005',
    this.employees = '500+',
    this.industry = 'Technology & Manufacturing',
    this.roles = const ['Welder', 'Fitter', 'Mechanic'],
    this.imagePath = 'images/tom.jpeg',
  });

  @override
  Widget build(BuildContext context) {
    final textGrey = Colors.grey[800];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Company Details'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner image with safe fallback
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 200,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.image_not_supported, size: 56, color: Colors.black45),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),

            // Company name
            Text(
              name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.2,
              ),
            ),
            const SizedBox(height: 6),

            // Location
            Row(
              children: [
                const Icon(Icons.location_on, size: 18, color: Colors.redAccent),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    location,
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),

            // Roles chips
            Wrap(
              spacing: 8,
              runSpacing: 6,
              children: roles
                  .map(
                    (r) => Chip(
                      label: Text(r),
                      backgroundColor: Colors.blue[50],
                      labelStyle: const TextStyle(color: Colors.blueAccent),
                    ),
                  )
                  .toList(),
            ),

            const SizedBox(height: 18),

            // About section
            const Text(
              'About the Company',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              about,
              style: TextStyle(fontSize: 15, color: textGrey, height: 1.5),
            ),

            const SizedBox(height: 18),

            // Key highlights
            const Text(
              'Key Highlights',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text('• Industry: $industry', style: TextStyle(fontSize: 15, color: textGrey)),
            Text('• Founded: $founded', style: TextStyle(fontSize: 15, color: textGrey)),
            Text('• Employees: $employees', style: TextStyle(fontSize: 15, color: textGrey)),
            Text('• Hiring: ${roles.join(", ")}', style: TextStyle(fontSize: 15, color: textGrey)),

            const SizedBox(height: 28),

            // Optional back button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton.icon(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Back'),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
