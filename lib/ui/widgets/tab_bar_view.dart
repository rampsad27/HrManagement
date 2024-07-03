import 'package:flutter/material.dart';

class AppTabBarView extends StatelessWidget {
  const AppTabBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: [
          // Information Tab
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildEditableTextField(
                    label: "Phone Number", value: "+1234567890"),
                _buildEditableTextField(
                    label: "Email", value: "email@example.com"),
                _buildEditableTextField(
                    label: "Address", value: "123 Main St, City, Country"),
                _buildEditableTextField(
                    label: "GitHub", value: "github.com/username"),
                _buildEditableTextField(
                    label: "LinkedIn", value: "linkedin.com/in/username"),
              ],
            ),
          ),
          // Bio Tab
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildEditableTextField(
                  label: "Bio",
                  value:
                      "This is a short description of the user. It includes key details and background information.",
                  maxLines: 4,
                ),
              ],
            ),
          ),
          // SOS Tab
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildEditableTextField(
                    label: "Emergency Contact Name", value: "John Doe"),
                _buildEditableTextField(
                    label: "Emergency Contact Number", value: "+9876543210"),
                _buildEditableTextField(
                    label: "Relationship", value: "Brother"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditableTextField({
    required String label,
    required String value,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: TextEditingController(text: value),
        readOnly: true,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: InputBorder.none,
          hintText: label,
        ),
        style: const TextStyle(fontSize: 16.0),
      ),
    );
  }
}
