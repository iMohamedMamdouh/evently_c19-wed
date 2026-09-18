import 'package:evently_c19/core/data/app_data.dart';
import 'package:evently_c19/core/models/event_model.dart';
import 'package:evently_c19/core/theme/app_colors.dart';
import 'package:evently_c19/core/utils/app_date.dart';
import 'package:evently_c19/modules/event/screens/edit_event_screen.dart';
import 'package:flutter/material.dart';

class EventDetailsScreen extends StatefulWidget {
  final EventModel event;

  const EventDetailsScreen({super.key, required this.event});

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  void deleteEvent() {
    AppData.events.remove(widget.event);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var event = widget.event;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: theme.primaryColor,
            size: 18,
          ),
        ),
        title: Text("Event details", style: theme.textTheme.titleMedium),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditEventScreen(event: event),
                ),
              ).then((value) {
                setState(() {});
              });
            },
            icon: Icon(Icons.edit_outlined, color: theme.primaryColor),
          ),
          IconButton(
            onPressed: deleteEvent,
            icon: Icon(Icons.delete_outline, color: AppColors.redColor),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  event.image,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              Text(event.title, style: theme.textTheme.titleMedium),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: theme.scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.calendar_month_outlined,
                        color: theme.primaryColor,
                        size: 26,
                      ),
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppDate.getFullDate(event.date),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: theme.primaryColorLight,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          event.time,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.grayColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Description",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: theme.primaryColorLight,
                ),
              ),
              SizedBox(height: 8),
              Text(
                event.description,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.4,
                  color: AppColors.grayColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
