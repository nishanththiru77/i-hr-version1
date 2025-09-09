import 'package:flutter/material.dart';
import 'details.dart'; // First company details page
import 'cdetails.dart'; // New details page for second company

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> appliedCompanies = [];

  void toggleApply(String companyName) {
    setState(() {
      if (appliedCompanies.contains(companyName)) {
        appliedCompanies.remove(companyName);
      } else {
        appliedCompanies.add(companyName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600; // Breakpoint for mobile

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Nishanth "),
              accountEmail: Text("nishanth@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("images/tom.jpeg"),
              ),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ExpansionTile(
              leading: const Icon(Icons.business),
              title: const Text("Companies"),
              children: [
                ListTile(
                  title: const Text("Available Companies"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text("Applied Companies"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AppliedCompaniesPage(
                          appliedCompanies: appliedCompanies,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(Icons.menu, size: 35.0),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfilePage()),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "images/tom.jpeg",
                        height: 45,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              const Text(
                "FIND YOUR DREAM",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text(
                "COMPANY!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30.0),
              _buildCompanyCard(
                context,
                isMobile,
                "images/WhatsApp Image 2025-08-10 at 15.51.30_58699a38.jpg",
                "Besmak Components Pvt Ltd",
                "Chennai, Tamilnadu",
                ["Plumber", "Carpenter", "Electrician"],
                const CompanyDetails(),
              ),
              const SizedBox(height: 20.0),
              _buildCompanyCard(
                context,
                isMobile,
                "images/image.png",
                "ABC Industries",
                "Coimbatore, Tamilnadu",
                ["Welder", "Fitter", "Mechanic"],
                const CompanyDetails1(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCompanyCard(
    BuildContext context,
    bool isMobile,
    String imagePath,
    String companyName,
    String location,
    List<String> roles,
    Widget detailsPage,
  ) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Material(
        elevation: 3.0,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      imagePath,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 10.0),
                    _buildCompanyDetails(
                      context,
                      companyName,
                      location,
                      roles,
                      detailsPage,
                    ),
                  ],
                )
              : Row(
                  children: [
                    Image.asset(
                      imagePath,
                      height: 300,
                      width: 250,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: _buildCompanyDetails(
                        context,
                        companyName,
                        location,
                        roles,
                        detailsPage,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildCompanyDetails(
    BuildContext context,
    String companyName,
    String location,
    List<String> roles,
    Widget detailsPage,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$companyName\n$location",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15.0,
              fontWeight: FontWeight.w200,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: roles.map((role) {
              return Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 6),
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: Center(
                    child: Text(
                      role,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CompanyDetailWrapper(
                    detailsPage: detailsPage,
                    companyName: companyName,
                    applied: appliedCompanies.contains(companyName),
                    onApplyToggle: () => toggleApply(companyName),
                  ),
                ),
              );
            },
            child: const Text(
              "Learn more",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Wrapper to add Apply button in details page (no title in AppBar)
class CompanyDetailWrapper extends StatefulWidget {
  final Widget detailsPage;
  final String companyName;
  final bool applied;
  final VoidCallback onApplyToggle;

  const CompanyDetailWrapper({
    super.key,
    required this.detailsPage,
    required this.companyName,
    required this.applied,
    required this.onApplyToggle,
  });

  @override
  State<CompanyDetailWrapper> createState() => _CompanyDetailWrapperState();
}

class _CompanyDetailWrapperState extends State<CompanyDetailWrapper> {
  late bool applied;

  @override
  void initState() {
    super.initState();
    applied = widget.applied;
  }

  void toggleButton() {
    setState(() {
      applied = !applied;
    });
    widget.onApplyToggle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: widget.detailsPage),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: toggleButton,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: Text(applied ? "Cancel Apply" : "Apply Now"),
            ),
          ),
        ],
      ),
    );
  }
}

// Applied Companies Page
class AppliedCompaniesPage extends StatelessWidget {
  final List<String> appliedCompanies;

  const AppliedCompaniesPage({super.key, required this.appliedCompanies});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Applied Companies")),
      body: appliedCompanies.isEmpty
          ? const Center(child: Text("No companies applied yet."))
          : ListView.builder(
              itemCount: appliedCompanies.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.business),
                  title: Text(appliedCompanies[index]),
                );
              },
            ),
    );
  }
}

// ✅ New Profile Page
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Profile")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("images/tom.jpeg"),
              ),
            ),
            const SizedBox(height: 20),
            const Text("Name: Nishanth ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text("Email: nishanth@gmail.com",
                style: TextStyle(fontSize: 16)),
            const Text("Phone: +91 7339162279",
                style: TextStyle(fontSize: 16)),
            const Text("Location: Chennai, Tamil Nadu",
                style: TextStyle(fontSize: 16)),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.edit),
                label: const Text("Edit Profile"),
              ),
            )
          ],
        ),
     ),
);
}
}
