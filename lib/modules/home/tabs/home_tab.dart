import 'package:evently_c19/core/app_provider/app_provider.dart';
import 'package:evently_c19/core/data/app_data.dart';
import 'package:evently_c19/core/theme/app_colors.dart';
import 'package:evently_c19/core/widgets/category_item.dart';
import 'package:evently_c19/modules/event/screens/event_details_screen.dart';
import 'package:evently_c19/modules/home/widgets/event_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = Provider.of<AppProvider>(context);
    var user = FirebaseAuth.instance.currentUser;
    var events = selectedCategory == 0
        ? AppData.events
        : AppData.events
              .where(
                (event) =>
                    event.category ==
                    AppData.categories[selectedCategory - 1].name,
              )
              .toList();
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome Back",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.grayColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        user?.displayName ?? "User",
                        style: theme.textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    provider.changeTheme(
                      provider.themeMode == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light,
                    );
                  },
                  icon: Icon(
                    provider.themeMode == ThemeMode.light
                        ? Icons.light_mode_outlined
                        : Icons.dark_mode_outlined,
                    color: theme.primaryColor,
                    size: 26,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "EN",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          SizedBox(
            height: 44,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: AppData.categories.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return CategoryItem(
                    text: "All",
                    icon: Icons.grid_view,
                    isSelected: selectedCategory == 0,
                    onTap: () {
                      setState(() {
                        selectedCategory = 0;
                      });
                    },
                  );
                }
                var category = AppData.categories[index - 1];
                return CategoryItem(
                  text: category.name,
                  icon: category.icon,
                  isSelected: selectedCategory == index,
                  onTap: () {
                    setState(() {
                      selectedCategory = index;
                    });
                  },
                );
              },
              separatorBuilder: (context, index) => SizedBox(width: 8),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: events.length,
              itemBuilder: (context, index) {
                var event = events[index];
                return EventItem(
                  event: event,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EventDetailsScreen(event: event),
                      ),
                    ).then((value) {
                      setState(() {});
                    });
                  },
                  onFavouriteTap: () {
                    setState(() {
                      event.isFavourite = !event.isFavourite;
                    });
                  },
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 16),
            ),
          ),
        ],
      ),
    );
  }
}
