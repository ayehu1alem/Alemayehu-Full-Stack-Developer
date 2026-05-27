Initialize multi-platform developer portfolio with localization and responsive design

Implement a cross-platform Flutter application supporting Android, iOS, Web, and Desktop (Windows, macOS, Linux). This commit establishes the core architecture, styling, and content for a professional portfolio.

*   **Core Architecture & Scaling**: 
    *   Implement a `ResponsiveContext` extension in `breakpoints.dart` for adaptive layout handling.
    *   Define a centralized `CustomColors` palette and reusable `AppButtonStyles`.
    *   Integrate `easy_localization` with support for English and Amharic.

*   **Feature Modules**:
    *   **Hero & Services**: Create responsive sections for service offerings across mobile and desktop.
    *   **Project Showcase**: Implement `ProjectCardWidget` and `ProjectUtils` to display work with deep links to web, mobile stores, and source code.
    *   **Skills Section**: Add an interactive `SkillsCard` with micro-scale hover animations.
    *   **Download Flow**: Build a custom Android APK installation guide and download dialog for mobile users.
    *   **Blog & Socials**: Integrate platform-specific webview stubs for blog hosting and a unified social media launch utility.

*   **Platform Specifics**:
    *   **Android**: Configure `AndroidManifest.xml` with intent queries and setup dark mode splash screen support (including Android 12+).
    *   **Web**: Set up `index.html` with SEO meta tags, Open Graph previews, and JSON-LD schema.
    *   **Native Runners**: Initialize boilerplate for Linux (GTK), Windows (Win32), and macOS targets.
    *   **Build**: Configure Gradle 8.14 wrapper and update multi-platform `.gitignore` files.
