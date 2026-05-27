import 'package:flutter/cupertino.dart';

class SiteLogo extends StatelessWidget {
  const SiteLogo({super.key, this.onTab});

  final VoidCallback? onTab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Image.asset(
        "assets/images/logo/icon_192.png",
        height: 50,
        width: 50,
      ),
    );
  }
}
