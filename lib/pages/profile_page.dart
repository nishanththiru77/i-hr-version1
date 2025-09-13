// lib/pages/profile_page.dart
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEditing = false;

  // Example profile data
  String name = "Nishanth";
  String email = "nishanth@gmail.com";
  String phone = "+91 7339162279";
  String address = "Namakkal, Tamil Nadu, India";
  String education = "B.E ELECTRICAL AND ELECTRONICS ENGINEER";
  String experience = "NO EXPERIENCE(DUMMY)";

  // Controllers for editing
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController educationController;
  late TextEditingController experienceController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: name);
    emailController = TextEditingController(text: email);
    phoneController = TextEditingController(text: phone);
    addressController = TextEditingController(text: address);
    educationController = TextEditingController(text: education);
    experienceController = TextEditingController(text: experience);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    educationController.dispose();
    experienceController.dispose();
    super.dispose();
  }

  void toggleEdit() {
    setState(() {
      if (isEditing) {
        // Save values
        name = nameController.text;
        email = emailController.text;
        phone = phoneController.text;
        address = addressController.text;
        education = educationController.text;
        experience = experienceController.text;
      }
      isEditing = !isEditing;
    });
  }

  Widget buildInfoTile(String label, String value, TextEditingController controller) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: isEditing
            ? TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: "Enter $label",
                  border: InputBorder.none,
                ),
              )
            : Text(value),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: Icon(isEditing ? Icons.save : Icons.edit),
            onPressed: toggleEdit,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Picture
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage("images/tom.jpeg"),
            ),
            const SizedBox(height: 16),

            // Editable fields
            buildInfoTile("Name", name, nameController),
            buildInfoTile("Email", email, emailController),
            buildInfoTile("Phone", phone, phoneController),
            buildInfoTile("Address", address, addressController),
            buildInfoTile("Education", education, educationController),
            buildInfoTile("Experience", experience, experienceController),
          ],
        ),
      ),
    );
  }
}
