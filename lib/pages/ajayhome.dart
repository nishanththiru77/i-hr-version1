import 'package:flutter/material.dart';
import 'home.dart'; // 👈 import your home.dart

class AjayHome extends StatefulWidget {
  const AjayHome({super.key});

  @override
  State<AjayHome> createState() => _AjayHomeState();
}

class _AjayHomeState extends State<AjayHome> {
  final List<String> categories = const [
    'Tailor',
    'Carpenter',
    'Electrician',
    'Plumber',
    'Painter',
    'Mechanic',
    'Cleaner',
    'Driver',
    'Delivery',
    'Other',
  ];

  final Map<String, String?> selectedGrades = {};
  final Map<String, String?> experience = {};
  String searchQuery = '';
  final List<String> grades = ['A+', 'A', 'B+', 'B'];

  String? customJobName;

  final Map<String, Map<String, String>> jobGradeDescriptions = {
    'Tailor': {
      'A+': 'A+ - Can stitch 20 clothes in one hour',
      'A': 'A - Can stitch 15 clothes in one hour',
      'B+': 'B+ - Can stitch 10 clothes in one hour',
      'B': 'B - Can stitch 5 clothes in one hour',
    },
    'Painter': {
      'A+': 'A+ - Can paint 50 sq. meters in one hour',
      'A': 'A - Can paint 40 sq. meters in one hour',
      'B+': 'B+ - Can paint 30 sq. meters in one hour',
      'B': 'B - Can paint 20 sq. meters in one hour',
    },
    'Carpenter': {
      'A+': 'A+ - Can build 5 furniture items in one hour',
      'A': 'A - Can build 4 furniture items in one hour',
      'B+': 'B+ - Can build 3 furniture items in one hour',
      'B': 'B - Can build 2 furniture items in one hour',
    },
    // ... other jobs
  };

  void _showGradeInfo(BuildContext context, String category) {
    final descriptions = jobGradeDescriptions[category] ?? {};

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('$category - Grade Info'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: grades.map((grade) {
            final desc =
                descriptions[grade] ?? '$grade : Performance details not available';
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(desc),
            );
          }).toList(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _askCustomJobName() {
    TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Enter Job Name"),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: "Enter your job title"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                customJobName = controller.text.trim();
                if (customJobName != null && customJobName!.isNotEmpty) {
                  selectedGrades[customJobName!] = null;
                  experience[customJobName!] = null;
                }
              });
              Navigator.pop(context);
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredCategories = categories
        .where((category) =>
            category.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sanghamam'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search For A Skill',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCategories.length + 1,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                if (index == filteredCategories.length) {
                  // ✅ Submit button
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () {
                          // ✅ Open home.dart page
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const HomePage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                }

                String category = filteredCategories[index];
                bool isLeft = index % 2 == 0;

                // ✅ "Other" handling
                if (category == "Other") {
                  return Column(
                    crossAxisAlignment:
                        isLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (customJobName == null) {
                            _askCustomJobName();
                          } else {
                            setState(() {
                              if (selectedGrades.containsKey(customJobName)) {
                                selectedGrades.remove(customJobName);
                                experience.remove(customJobName);
                                customJobName = null;
                              } else {
                                selectedGrades[customJobName!] = null;
                                experience[customJobName!] = null;
                              }
                            });
                          }
                        },
                        child: Card(
                          elevation: 4,
                          color: (customJobName != null &&
                                  selectedGrades.containsKey(customJobName))
                              ? Colors.indigo.shade50
                              : Colors.white,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  customJobName ?? "Other (Add Your Own)",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Icon(
                                  (customJobName != null &&
                                          selectedGrades.containsKey(customJobName))
                                      ? Icons.check_circle
                                      : Icons.add_circle_outline,
                                  color: (customJobName != null &&
                                          selectedGrades.containsKey(customJobName))
                                      ? Colors.green
                                      : Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }

                // ✅ Normal jobs
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (selectedGrades.containsKey(category)) {
                        selectedGrades.remove(category);
                        experience.remove(category);
                      } else {
                        selectedGrades[category] = null;
                        experience[category] = null;
                      }
                    });
                  },
                  child: Card(
                    elevation: 4,
                    color: selectedGrades.containsKey(category)
                        ? Colors.indigo.shade50
                        : Colors.white,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            category,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          Icon(
                            selectedGrades.containsKey(category)
                                ? Icons.check_circle
                                : Icons.add_circle_outline,
                            color: selectedGrades.containsKey(category)
                                ? Colors.green
                                : Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
