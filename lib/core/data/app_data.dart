import 'package:flutter/material.dart';

import '../models/category_model.dart';
import '../models/event_model.dart';
import '../utils/app_assets.dart';

class AppData {
  static List<CategoryModel> categories = [
    CategoryModel(
      name: "Sport",
      icon: Icons.directions_bike_outlined,
      image: AppAssets.sportImage,
    ),
    CategoryModel(
      name: "Birthday",
      icon: Icons.cake_outlined,
      image: AppAssets.birthdayImage,
    ),
    CategoryModel(
      name: "Meeting",
      icon: Icons.groups_outlined,
      image: AppAssets.meetingImage,
    ),
    CategoryModel(
      name: "Book club",
      icon: Icons.menu_book_outlined,
      image: AppAssets.bookClubImage,
    ),
    CategoryModel(
      name: "Exhibition",
      icon: Icons.museum_outlined,
      image: AppAssets.exhibitionImage,
    ),
  ];

  static List<EventModel> events = [
    EventModel(
      id: "1",
      title: "This is a Birthday Party",
      description:
          "Lorem ipsum dolor sit amet consectetur. Vulputate eleifend suscipit eget neque senectus a. Nulla at non malesuada odio duis lectus amet nisi sit. Risus hac enim maecenas auctor et. At cras massa diam porta facilisi lacus purus.",
      image: AppAssets.birthdayImage,
      category: "Birthday",
      date: DateTime(2026, 1, 21),
      time: "12:12 PM",
      isFavourite: true,
    ),
    EventModel(
      id: "2",
      title: "Meeting for Updating The Development Method",
      description:
          "Lorem ipsum dolor sit amet consectetur. Vulputate eleifend suscipit eget neque senectus a. Nulla at non malesuada odio duis lectus amet nisi sit. Risus hac enim maecenas auctor et. At cras massa diam porta facilisi lacus purus.",
      image: AppAssets.meetingImage,
      category: "Meeting",
      date: DateTime(2026, 1, 22),
      time: "10:30 AM",
    ),
    EventModel(
      id: "3",
      title: "Discover unique exhibitions and talents",
      description:
          "Lorem ipsum dolor sit amet consectetur. Vulputate eleifend suscipit eget neque senectus a. Nulla at non malesuada odio duis lectus amet nisi sit. Risus hac enim maecenas auctor et. At cras massa diam porta facilisi lacus purus.",
      image: AppAssets.exhibitionImage,
      category: "Exhibition",
      date: DateTime(2026, 1, 23),
      time: "05:00 PM",
    ),
  ];
}
