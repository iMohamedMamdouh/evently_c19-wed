import 'package:evently_c19/core/models/event_model.dart';
import 'package:evently_c19/core/theme/app_colors.dart';
import 'package:evently_c19/core/utils/app_date.dart';
import 'package:flutter/material.dart';

class EventItem extends StatelessWidget {
  EventModel event;
  void Function()? onTap;
  void Function()? onFavouriteTap;

  EventItem({super.key, required this.event, this.onTap, this.onFavouriteTap});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: theme.cardColor,
          border: Border.all(color: AppColors.grayColor, width: 0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    event.image,
                    width: double.infinity,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: theme.scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      AppDate.getShortDate(event.date),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: theme.primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      event.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: theme.primaryColorLight,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: onFavouriteTap,
                    child: Icon(
                      event.isFavourite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: theme.primaryColor,
                      size: 26,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
