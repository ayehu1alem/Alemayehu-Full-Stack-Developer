import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/widgets/header_desktop.dart';
import 'package:portfolio/widgets/main_mobile.dart';
import 'package:portfolio/widgets/projects_section.dart';
import 'package:portfolio/widgets/services_desktop.dart';
import 'package:portfolio/widgets/services_mobile.dart';

import '../constants/size.dart';
import '../constants/social_link.dart';
import '../utils/breakpoints.dart';
import '../widgets/blog_webview.dart';
import '../widgets/contact_section.dart';
import '../widgets/drawer_mobile.dart';
import '../widgets/footer.dart';
import '../widgets/header_mobile.dart';
import '../widgets/main_desktop.dart';
import '../widgets/skills_desktop.dart';
import '../widgets/skills_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final List<GlobalKey> navBarKeys = List.generate(6, (index) => GlobalKey());

  @override
  @override
  Widget build(BuildContext context) {
    final isAmharic = context.locale.languageCode == 'am';
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;
    final scrollController = ScrollController();

    final isDesktopLayout =
        context.isDesktop || screenWidth >= axMediumDesktopWidth;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: CustomColors.scaffoldBd2,

      // 1. Unified End Drawer adaptive check
      endDrawer: isDesktopLayout
          ? null
          : DrawerMobile(
              onNavItemTap: (int navIndex) {
                scaffoldKey.currentState?.closeDrawer();
                scrollToSection(navIndex);
              },
            ),

      body: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(key: navBarKeys[0]),

            // 2. Unified Header Display condition
            if (isDesktopLayout)
              HeaderDesktop(
                onNavMenuTab: (int menuIndex) {
                  scrollToSection(menuIndex);
                },
              )
            else
              HeaderMobile(
                onLogoTab: () {
                  scrollToSection(0);
                },
                onMenuTab: () {
                  scaffoldKey.currentState?.openEndDrawer();
                },
              ),

            // 3. Unified Hero Body Main display condition
            isDesktopLayout ? const MainDesktop() : const MainMobile(),

            const SizedBox(height: 30),

            // Services Section
            Container(
              key: navBarKeys[1],
              width: screenWidth,
              color: CustomColors.scaffoldBd,
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "service".tr(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: CustomColors.whiteSecondary,
                    ),
                  ),
                  const SizedBox(height: 50),
                  // 4. Unified Services internal layout switch
                  isDesktopLayout
                      ? const ServicesDesktop()
                      : const ServicesMobile(),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Projects Section
            ProjectsSection(key: navBarKeys[2]),

            const SizedBox(height: 30),

            // Blog WebView Container with responsive proportional scaling
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: screenWidth * 0.95, // Clean percentage scaling
                  maxHeight: screenHeight * 0.75, // Scaled down view frame
                ),
                child: Container(
                  key: navBarKeys[3],
                  width: double.maxFinite,
                  height: double.maxFinite,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: CustomColors.yellowPrimary,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: getBlogWebView(SocialLink.blog),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Skills Section
            Container(
              key: navBarKeys[4],
              width: screenWidth,
              color: CustomColors.scaffoldBd,
              padding: const EdgeInsets.fromLTRB(25, 25, 25, 60),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "text_skills".tr(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: CustomColors.whiteSecondary,
                    ),
                  ),
                  const SizedBox(height: 50),
                  // 5. Unified Skills internal layout switch
                  isDesktopLayout
                      ? const SkillsDesktop()
                      : const SkillsMobile(),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Contact Section
            ContactSection(key: navBarKeys[navBarKeys.length - 1]),

            const SizedBox(height: 30),
            const Footer(),
          ],
        ),
      ),

      // Floating Language Action Button...
      floatingActionButton: FloatingActionButton.extended(
        shape: const CircleBorder(),
        onPressed: () {
          if (isAmharic) {
            context.setLocale(const Locale('en'));
          } else {
            context.setLocale(const Locale('am'));
          }
        },
        backgroundColor: CustomColors.yellowBg,
        label: Text(
          isAmharic ? "En" : "አማ",
          style: const TextStyle(
            fontSize: 15,
            color: CustomColors.whiteSecondary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Widget build(BuildContext context) {
  //   final isAmharic = context.locale.languageCode == 'am';
  //   late final screenSize = MediaQuery.of(context).size;
  //   late final screenWidth = screenSize.width;
  //   final scrollController = ScrollController();
  //
  //
  //   return LayoutBuilder(
  //     builder: (context, constraint) {
  //       return Scaffold(
  //         key: scaffoldKey,
  //         backgroundColor: CustomColors.scaffoldBd2,
  //         endDrawer: constraint.maxWidth >= axMediumDesktopWidth
  //             ? null
  //             : DrawerMobile(
  //                 onNavItemTap: (int navIndex) {
  //                   //Call Function
  //                   scaffoldKey.currentState?.closeDrawer();
  //                   scrollToSection(navIndex);
  //                 },
  //         ),
  //
  //         body: SingleChildScrollView(
  //           controller: scrollController,
  //           scrollDirection: Axis.vertical,
  //           child: Column(
  //             children: [
  //               //MAIN
  //               SizedBox(key: navBarKeys[0]),
  //               if(constraint.maxWidth >= axMediumDesktopWidth)
  //                 HeaderDesktop(
  //                   onNavMenuTab: (int menuIndex) {
  //                     //Call a function
  //                     scrollToSection(menuIndex);
  //                   },
  //                 )
  //               else
  //                 HeaderMobile(
  //                 onLogoTab: (){
  //                   navBarKeys[0];
  //                 },
  //                 onMenuTab: (){
  //                   scaffoldKey.currentState?.openEndDrawer();
  //                 },
  //               ),
  //
  //
  //
  //               //
  //               // Container(
  //               //   width: double.maxFinite,
  //               //   height: screenSize.height / 1.2,
  //               //   alignment: Alignment.center, // Keeps the layout pinned to the center while it animates
  //               //   decoration: BoxDecoration(
  //               //     color: CustomColors.scaffoldBd.withOpacity(0.3), // Optional: background for context
  //               //     shape: BoxShape.circle,
  //               //   ),
  //               //   child: const BouncingRotatingLogo(), // The animated widget handles the rest!
  //               // ),
  //               //
  //               // const SizedBox(height: 70,),
  //               //Main
  //               screenWidth >= axMediumDesktopWidth
  //                   ? const MainDesktop()
  //                   : const MainMobile(),
  //
  //               const SizedBox(height: 30,),
  //               //Services
  //               Container(
  //                 key: navBarKeys[1],
  //                 width: screenWidth,
  //                 color: CustomColors.scaffoldBd,
  //                 padding: const EdgeInsets.fromLTRB(25, 20, 25, 40),
  //                 child: Column(
  //                   mainAxisSize: MainAxisSize.min,
  //                   children: [
  //                     Text(
  //                         "service".tr(),
  //                         style: TextStyle(
  //                             fontSize: 24,
  //                             fontWeight: FontWeight.w800,
  //                             color: CustomColors.whiteSecondary
  //                         )
  //                     ),
  //                     const SizedBox(height: 50,),
  //                     constraint.maxWidth >= axMediumDesktopWidth
  //                         ? const ServicesDesktop()
  //                         : const ServicesMobile(),
  //
  //                   ],
  //                 ),
  //               ),
  //
  //               const SizedBox(height: 30,),
  //
  //
  //               //PROJECTS
  //               ProjectsSection(
  //                 key: navBarKeys[2],
  //               ),
  //
  //
  //               const SizedBox(height: 30,),
  //               Center(
  //                 child: ConstrainedBox(
  //                   constraints: BoxConstraints(
  //                     maxWidth: screenWidth / 1.05,
  //                     maxHeight: screenSize.height / 1.3,
  //                   ),
  //                   child: Container(
  //                     key: navBarKeys[3],
  //                     width: double.maxFinite, // Takes full width
  //                     height: double.maxFinite,            // Give it a fixed height inside your layout
  //                     margin: const EdgeInsets.all(10),
  //                     decoration: BoxDecoration(
  //                       border: Border.all(color: CustomColors.yellowPrimary, width: 2),
  //                       borderRadius: BorderRadius.circular(8),
  //                     ),
  //                     child: ClipRRect(
  //                       borderRadius: BorderRadius.circular(6), // Clips webview corners to match container
  //                       child: getBlogWebView(SocialLink.blog),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //
  //
  //               const SizedBox(height: 30,),
  //
  //               //Skills
  //               Container(
  //                 key: navBarKeys[4],
  //                 width: screenWidth,
  //                 color: CustomColors.scaffoldBd,
  //                 padding: const EdgeInsets.fromLTRB(25, 25, 25, 60),
  //                 child: Column(
  //                   mainAxisSize: MainAxisSize.min,
  //                   children: [
  //                     Text(
  //                         "skills".tr(),
  //                         style: TextStyle(
  //                             fontSize: 24,
  //                             fontWeight: FontWeight.w800,
  //                             color: CustomColors.whiteSecondary
  //                         )
  //                     ),
  //                     const SizedBox(height: 50,),
  //                     constraint.maxWidth >= axMediumDesktopWidth
  //                         ? const SkillsDesktop()
  //                         : const SkillsMobile(),
  //
  //                   ],
  //                 ),
  //               ),
  //
  //               const SizedBox(height: 30,),
  //               //CONTACT
  //               ContactSection(
  //                 key: navBarKeys[navBarKeys.length -1],
  //               ),
  //
  //
  //               const SizedBox(height: 30,),
  //               const Footer(),
  //               //FOOTER
  //
  //             ],
  //           ),
  //         ),
  //         floatingActionButton: FloatingActionButton.extended(
  //           shape: CircleBorder(),
  //           onPressed: () {
  //             // If current is Amharic, switch to English, else switch to Amharic
  //             if (isAmharic) {
  //               context.setLocale(const Locale('en'));
  //             } else {
  //               context.setLocale(const Locale('am'));
  //             }
  //           },
  //           backgroundColor: CustomColors.yellowBg,
  //           //icon: const Icon(Icons.language, color: Colors.black),
  //           label: Text(
  //             isAmharic ? "En" : "አማ",
  //             style: const TextStyle(
  //               fontSize: 15,
  //               color: CustomColors.whiteSecondary,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //         ),
  //       );
  //     }
  //   );
  // }

  void scrollToSection(int index) async {
    final key = navBarKeys[index];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(microseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
