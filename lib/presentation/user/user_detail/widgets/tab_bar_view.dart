import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/presentation/user/bloc/user_details_bloc.dart';

class AppTabBarView extends StatelessWidget {
  final bool isEditing;
  const AppTabBarView({Key? key, required this.isEditing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDetailsBloc, UserDetailsState>(
      builder: (context, state) {
        final user = state.userModel!;
        return Expanded(
          child: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildEditableTextField(
                      label: "Phone Number",
                      value: user.cell.toString(),
                      isEditable: isEditing,
                    ),
                    _buildEditableTextField(
                      label: "Email",
                      value: user.email,
                      isEditable: isEditing,
                    ),
                    _buildEditableTextField(
                      label: "Address",
                      value: user.address,
                      maxLines: 2,
                      isEditable: isEditing,
                    ),
                    _buildEditableTextField(
                      label: "GitHub",
                      value: user.github,
                      isEditable: isEditing,
                    ),
                    _buildEditableTextField(
                      label: "LinkedIn",
                      value: user.linkedIn,
                      isEditable: isEditing,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildEditableTextField(
                      label: "Bio",
                      value: user.bio,
                      maxLines: 12,
                      isEditable: isEditing,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildEditableTextField(
                      label: "Emergency Contact Name",
                      value: user.eName,
                      isEditable: isEditing,
                    ),
                    _buildEditableTextField(
                      label: "Emergency Contact Number",
                      value: user.eNumber.toString(),
                      isEditable: isEditing,
                    ),
                    _buildEditableTextField(
                      label: "Relationship",
                      value: user.eRelation,
                      isEditable: isEditing,
                    ),
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
    bool isEditable = false,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: TextEditingController(text: value),
        readOnly: !isEditable,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: isEditable ? const OutlineInputBorder() : InputBorder.none,
          hintText: label,
        ),
        style: const TextStyle(fontSize: 16.0),
      ),
    );
  }
}
