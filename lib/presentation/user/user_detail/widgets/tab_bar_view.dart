import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/presentation/user/bloc/user_details_bloc.dart';

class AppTabBarView extends StatelessWidget {
  const AppTabBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDetailsBloc, UserDetailsState>(
      builder: (context, state) {
        final user = state.userModel!;
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
                        label: "Phone Number", value: user.cell.toString()),
                    _buildEditableTextField(label: "Email", value: user.email),
                    _buildEditableTextField(
                        label: "Address", value: user.address, maxLines: 2),
                    _buildEditableTextField(
                        label: "GitHub", value: user.github),
                    _buildEditableTextField(
                        label: "LinkedIn", value: user.linkedIn),
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
                      value: user.bio,
                      maxLines: 12,
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
                        label: "Emergency Contact Name", value: user.eName),
                    _buildEditableTextField(
                        label: "Emergency Contact Number",
                        value: user.eNumber.toString()),
                    _buildEditableTextField(
                        label: "Relationship", value: user.eRelation),
                  ],
                ),
              ),
            ],
          ),
        );
      },
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
