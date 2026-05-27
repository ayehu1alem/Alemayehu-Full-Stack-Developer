import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/social_link.dart';
import '../styles/button_style.dart';

class SocialMediaPush extends StatelessWidget {
  const SocialMediaPush({super.key});

  /// Unified URL launcher helper method
  Future<void> _launchSocialUrl(String urlString) async {
    // 1. Ensure the URL string always includes a valid web protocol scheme
    if (!urlString.startsWith('http://') &&
        !urlString.startsWith('https://') &&
        !urlString.startsWith('mailto:')) {
      urlString = 'https://$urlString';
    }

    final Uri url = Uri.parse(urlString);

    try {
      // 2. Force external application/browser mode to prevent 'Page Not Found' routing errors
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } catch (e) {
      debugPrint('Could not launch web target $url: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 3,
      runSpacing: 3,
      alignment: WrapAlignment.center,
      children: [
        // LinkedIn
        IconButton(
          style: AppButtonStyles.primaryIcon,
          onPressed: () => _launchSocialUrl(SocialLink.linkedin),
          icon: Image.asset("assets/images/icons/linkedin.png", width: 25),
        ),

        // Gmail / Mail
        IconButton(
          style: AppButtonStyles.primaryIcon,
          onPressed: () => _launchSocialUrl(SocialLink.mail),
          icon: Image.asset("assets/images/icons/gmail.png", width: 25),
        ),

        // GitHub
        IconButton(
          style: AppButtonStyles.primaryIcon,
          onPressed: () => _launchSocialUrl(SocialLink.github),
          icon: Image.asset("assets/images/icons/github.png", width: 25),
        ),

        // Telegram
        IconButton(
          style: AppButtonStyles.primaryIcon,
          onPressed: () => _launchSocialUrl(SocialLink.telegram),
          icon: Image.asset("assets/images/icons/telegram.png", width: 25),
        ),

        // Facebook
        IconButton(
          style: AppButtonStyles.primaryIcon,
          onPressed: () => _launchSocialUrl(SocialLink.facebook),
          icon: Image.asset("assets/images/icons/facebook.png", width: 25),
        ),
      ],
    );
  }
}
