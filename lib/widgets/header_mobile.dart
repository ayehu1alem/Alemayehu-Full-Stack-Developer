import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/widgets/site_logo.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/colors.dart';
import '../styles/button_style.dart';
import '../styles/style.dart';

class HeaderMobile extends StatelessWidget {
  final VoidCallback? onLogoTab;
  final VoidCallback? onMenuTab;

  const HeaderMobile({super.key, this.onLogoTab, this.onMenuTab});

  void _showDownloadInstructions(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      // Prevents accidental closing until they hit "Got it!"
      builder: (BuildContext dialogContext) {
        final isAmharic = context.locale.languageCode == 'am';

        return AlertDialog(
          backgroundColor: CustomColors.scaffoldBd,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: CustomColors.yellowPrimary, width: 1),
          ),
          title: Row(
            children: [
              const Icon(
                Icons.android,
                color: CustomColors.yellowPrimary,
                size: 28,
              ),
              const SizedBox(width: 10),
              Text(
                isAmharic ? "አፕሊኬሽኑን የመጫኛ መመሪያ" : "APK Installation Guide",
                style: const TextStyle(
                  color: CustomColors.whitePrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  isAmharic
                      ? "አንድሮይድ ስልክ ላይ በደህንነት ምክንያት ይሄን መተግበሪያ ለመጫን የሚከተሉትን ቀላል ደረጃዎች ይከተሉ፦"
                      : "To successfully install this application on your Android device, please follow these brief steps:",
                  style: TextStyle(
                    color: CustomColors.whiteSecondary.withOpacity(0.9),
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 16),
                _buildInstructionStep(
                  "1",
                  isAmharic
                      ? "ፋይሉን ያውርዱ እና ስልክዎ ላይ ያስቀምጡት።"
                      : "Download and save the APK file to your device.",
                ),
                _buildInstructionStep(
                  "2",
                  isAmharic
                      ? "የወረደውን ፋይል ሲከፍቱ ማስጠንቀቂያ ከመጣ 'Settings' ውስጥ ይግቡ።"
                      : "Open the file. If blocked, tap 'Settings' on the system popup.",
                ),
                _buildInstructionStep(
                  "3",
                  isAmharic
                      ? "'Allow from this source' የሚለውን ያብሩት።"
                      : "Toggle 'Allow from this source' to enabled.",
                ),
                _buildInstructionStep(
                  "4",
                  isAmharic
                      ? "ወደኋላ በመመለስ 'Install' የሚለውን በመጫን ይደሰቱ!"
                      : "Go back and press 'Install' to enjoy the app!",
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              style: AppButtonStyles.navigationText,
              onPressed: () => Navigator.of(dialogContext).pop(), // Just close
              child: Text(isAmharic ? "አሰርዝ" : "Cancel"),
            ),
            ElevatedButton(
              style: AppButtonStyles.primaryElevated,
              onPressed: () async {
                // 1. Close the dialog window first
                Navigator.of(dialogContext).pop();

                // 2. Fire the asynchronous download link immediately
                final Uri url = Uri.parse('/download/portfolio.apk');
                if (!await launchUrl(
                  url,
                  mode: LaunchMode.externalApplication,
                )) {
                  throw Exception('Could not launch download link');
                }
              },
              child: Text(isAmharic ? "አውርድ" : "Download Now"),
            ),
          ],
        );
      },
    );
  }

  /// Small widget builder for formatted dialog line items
  Widget _buildInstructionStep(String stepNumber, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 11,
            backgroundColor: CustomColors.yellowPrimary.withOpacity(0.2),
            child: Text(
              stepNumber,
              style: const TextStyle(
                color: CustomColors.yellowPrimary,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: CustomColors.whiteSecondary,
                fontSize: 14,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final appBarHeight = context.isPhone ? context.heightPct(22) : 160.0;
    return Container(
      height: 50,
      margin: EdgeInsets.fromLTRB(30, 60, 30, 5),
      decoration: axDecoration,
      child: Row(
        children: [
          SiteLogo(onTab: onLogoTab),
          Spacer(),
          IconButton(
            onPressed: onMenuTab,
            icon: const Icon(Icons.menu, color: CustomColors.whiteSecondary),
          ),
          const SizedBox(width: 15),
          // Updated Download Action Button
          ElevatedButton.icon(
            style: AppButtonStyles.primaryElevated,
            onPressed: () => _showDownloadInstructions(context),
            // Call instructions flow
            icon: const Icon(Icons.android),
            label: const Icon(Icons.download),
          ),
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}
