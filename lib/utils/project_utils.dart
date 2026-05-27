class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String? androidLink;
  final String? iosLink;
  final String? webLink;
  final String? sourceCode;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.androidLink,
    this.iosLink,
    this.webLink,
    this.sourceCode,
  });
}
// ###############
//Projects

List<ProjectUtils> projectUtilsList = [
  ProjectUtils(
    image: "assets/images/projects/eecsa.png",
    title: "EECSA - Ethiopian Evangelical Church San Antonio, Tx",
    subtitle: "Ethiopian Church in Texas, USA",
    webLink: "https://www.eecsa.org/",
    androidLink: "https://github.com/ayehu1alem/EECSA.git",
    sourceCode: "https://github.com/ayehu1alem/EECSA-Website.git",
  ),
  ProjectUtils(
    image: "assets/images/projects/fikru.png",
    title: "Sr. Data scientist Portfolio",
    subtitle: "Professional Blog: Dr. Fikrewold Bitew",
    webLink: "https://fikrie-bitew.com/",
    sourceCode: "https://github.com/ayehu1alem/fikrewold_blog.git",
  ),
  ProjectUtils(
    image: "assets/images/projects/memyself.png",
    title: "Software Developer Portfolio",
    subtitle: "Book- Style Portfolio",
    webLink: "https://alem-ayehu.netlify.app/",
    sourceCode: "https://github.com/ayehu1alem/ayehu1alem.git",
  ),
  ProjectUtils(
    image: "assets/images/projects/renaissance.png",
    title: "Renaissance Construction Enterprise",
    subtitle: "Official Website",
    webLink: "http://renaissanceconet.com/",
    sourceCode: "https://github.com/ayehu1alem/RenaissanceConstruction.git",
  ),
];
