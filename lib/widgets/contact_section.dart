import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/colors.dart';
import '../constants/size.dart';
import '../styles/button_style.dart';
import '../utils/breakpoints.dart';
import 'custom_text_field.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  // Define controllers to grab text from the inputs
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    // Clean up controllers when the widget is destroyed
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  // Function to format and trigger the email client
  Future<void> _sendEmail() async {
    final String targetEmail = 'ayehu7alem@gmail.com';

    // Construct the email body text incorporating user inputs
    final String emailBody =
        'Name: ${_nameController.text}\n'
        'Sender Email: ${_emailController.text}\n\n'
        'Message:\n${_messageController.text}';

    // Use Uri to properly encode spaces, new lines, and special characters
    final Uri emailUrl = Uri(
      scheme: 'mailto',
      path: targetEmail,
      queryParameters: {
        'subject': _subjectController.text.isNotEmpty
            ? _subjectController.text
            : 'Portfolio Contact Form',
        'body': emailBody,
      },
    );

    if (await canLaunchUrl(emailUrl)) {
      await launchUrl(emailUrl);
    } else {
      // Fallback if the device doesn't have an email app installed (like a desktop browser without a mail client configured)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not open an email app automatically.'.tr()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.adaptiveHorizontalPadding.copyWith(top: 20, bottom: 60),
      color: CustomColors.scaffoldBd2,
      child: Column(
        children: [
          Text(
            "text_get_in_touch".tr(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: CustomColors.whiteSecondary,
            ),
          ),
          const SizedBox(height: 50),
          ConstrainedBox(
            // Increased maxHeight slightly to 120 so the mobile stacked view doesn't overflow
            constraints: const BoxConstraints(maxWidth: 700, maxHeight: 120),
            child: LayoutBuilder(
              builder: (context, constraint) {
                if (constraint.maxWidth >= axMinDesktopWidth) {
                  return buildDesktopField();
                }
                return buildMobileField();
              },
            ),
          ),
          const SizedBox(height: 15),

          // Message
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: CustomTextField(
              controller: _messageController, // Added controller
              hintText: "text_your_message".tr(),
              maxLines: 15,
            ),
          ),
          const SizedBox(height: 20),

          // Submit
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                style: AppButtonStyles.primaryElevated,
                onPressed: _sendEmail,

                child: Text(
                  "text_submit".tr(),
                  // style: const TextStyle(
                  //     color: CustomColors.yellowPrimary,
                  //     fontSize: 16,
                  //     fontWeight: FontWeight.w600
                  // )
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDesktopField() {
    return Column(
      children: [
        Row(
          children: [
            // Name
            Flexible(
              child: CustomTextField(
                controller: _nameController, // Added controller
                hintText: "text_your_name".tr(),
              ),
            ),
            const SizedBox(width: 15),

            // Email
            Flexible(
              child: CustomTextField(
                controller: _emailController, // Added controller
                hintText: "text_your_email".tr(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Flexible(
          child: CustomTextField(
            controller: _subjectController, // Added controller
            hintText: "text_subject".tr(),
          ),
        ),
      ],
    );
  }

  Widget buildMobileField() {
    return Column(
      children: [
        // Name
        Flexible(
          child: CustomTextField(
            controller: _nameController, // Added controller
            hintText: "text_your_name".tr(),
          ),
        ),
        const SizedBox(height: 15),

        // Email
        Flexible(
          child: CustomTextField(
            controller: _emailController, // Added controller
            hintText: "text_your_email".tr(),
          ),
        ),
        const SizedBox(height: 15),
        Flexible(
          child: CustomTextField(
            controller: _subjectController, // Added controller
            hintText: "text_subject".tr(),
          ),
        ),
      ],
    );
  }
}
