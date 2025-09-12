// lib/pages/details.dart
import 'package:flutter/material.dart';

class CompanyDetails extends StatefulWidget {
  final String name;
  final String location;
  final String about;
  final String founded;
  final String employees;
  final String industry;
  final List<String> roles;
  final String imagePath;

  // Static list of applied companies (shared across all CompanyDetails pages)
  static final List<String> appliedCompanies = [];

  const CompanyDetails({
    super.key,
    this.name = 'Besmak Components Pvt Ltd',
    this.location = 'Chennai, Tamil Nadu',
    this.about =
        'Besmak Components Pvt Ltd is a leading manufacturing company in Chennai specializing in high-quality industrial products. They are currently hiring for skilled plumbers to join their maintenance team.',
    this.founded = '1998',
    this.employees = '200+',
    this.industry = 'Industrial Manufacturing',
    this.roles = const ['Plumber'],
    this.imagePath =
        'images/WhatsApp Image 2025-08-10 at 15.51.30_58699a38.jpg',
  });

  @override
  State<CompanyDetails> createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<CompanyDetails> {
  late bool _applied;

  @override
  void initState() {
    super.initState();
    // Check if this company is already in applied list
    _applied = CompanyDetails.appliedCompanies.contains(widget.name);
  }

  void _apply() {
    setState(() {
      _applied = true;
      CompanyDetails.appliedCompanies.add(widget.name);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("You have successfully applied to ${widget.name}!"),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _cancelApplication() {
    setState(() {
      _applied = false;
      CompanyDetails.appliedCompanies.remove(widget.name);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Your application to ${widget.name} has been canceled."),
        backgroundColor: Colors.red,
      ),
    );
  }

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
            // Banner image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                widget.imagePath,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 200,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.image_not_supported,
                        size: 56, color: Colors.black45),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),

            // Company name
            Text(
              widget.name,
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
                const Icon(Icons.location_on,
                    size: 18, color: Colors.redAccent),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    widget.location,
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),

            // Roles
            Wrap(
              spacing: 8,
              runSpacing: 6,
              children: widget.roles
                  .map(
                    (r) => Chip(
                      label: Text(r),
                      backgroundColor: Colors.blue[50],
                      labelStyle:
                          const TextStyle(color: Colors.blueAccent),
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
              widget.about,
              style: TextStyle(fontSize: 15, color: textGrey, height: 1.5),
            ),

            const SizedBox(height: 18),

            // Key highlights
            const Text(
              'Key Highlights',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text('• Industry: ${widget.industry}',
                style: TextStyle(fontSize: 15, color: textGrey)),
            Text('• Founded: ${widget.founded}',
                style: TextStyle(fontSize: 15, color: textGrey)),
            Text('• Employees: ${widget.employees}',
                style: TextStyle(fontSize: 15, color: textGrey)),
            Text('• Hiring: ${widget.roles.join(", ")}',
                style: TextStyle(fontSize: 15, color: textGrey)),

            const SizedBox(height: 28),

            // Apply / Cancel buttons
            Center(
              child: Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: _applied ? null : _apply,
                    icon: Icon(
                        _applied ? Icons.check_circle : Icons.send),
                    label: Text(_applied ? "Applied" : "Apply Now"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _applied ? Colors.grey : Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  if (_applied) ...[
                    const SizedBox(height: 10),
                    OutlinedButton.icon(
                      onPressed: _cancelApplication,
                      icon: const Icon(Icons.cancel, color: Colors.red),
                      label: const Text("Cancel Application",
                          style: TextStyle(color: Colors.red)),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.red),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ],
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Back button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton.icon(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Back'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
