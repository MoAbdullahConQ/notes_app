import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteButtomSheet extends StatelessWidget {
  const AddNoteButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 32),
            CustomTextField(
              hint: 'Title',
            ),
            SizedBox(height: 16),
            CustomTextField(
              hint: 'Content',
              maxLines: 5,
            ),
            SizedBox(height: 16),
            // Spacer(flex: 1),
            CustomButton(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
