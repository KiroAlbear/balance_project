class CustomListItemModel {
  final int id;
  final String title;
  final String? subtitle;
  final String? description;
  final String? iconUrl;
  final String imageUrl;

  CustomListItemModel({
    required this.id,
    required this.title,
    this.subtitle,
    this.description,
    this.iconUrl,
    required this.imageUrl,
  });
}