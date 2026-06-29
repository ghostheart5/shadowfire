class HomeItem {
  const HomeItem({
    required this.title,
    required this.description,
    required this.route,
    this.isPremium = false,
  });

  final String title;
  final String description;
  final String route;
  final bool isPremium;
}