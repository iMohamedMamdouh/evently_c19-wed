class EventModel {
  String id;
  String title;
  String description;
  String image;
  String category;
  DateTime date;
  String time;
  bool isFavourite;

  EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.category,
    required this.date,
    required this.time,
    this.isFavourite = false,
  });
}
