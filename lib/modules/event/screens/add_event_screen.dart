import 'package:evently_c19/core/data/app_data.dart';
import 'package:evently_c19/core/models/event_model.dart';
import 'package:evently_c19/core/utils/app_date.dart';
import 'package:evently_c19/core/widgets/category_item.dart';
import 'package:evently_c19/core/widgets/custom_btn.dart';
import 'package:evently_c19/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  int selectedCategory = 0;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  void chooseDate() async {
    var date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (date == null) return;
    setState(() {
      selectedDate = date;
    });
  }

  void chooseTime() async {
    var time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time == null) return;
    setState(() {
      selectedTime = time;
    });
  }

  void addEvent() {
    if (titleController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        selectedDate == null ||
        selectedTime == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Please fill all the fields")));
      return;
    }
    var category = AppData.categories[selectedCategory];
    AppData.events.add(
      EventModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: titleController.text,
        description: descriptionController.text,
        image: category.image,
        category: category.name,
        date: selectedDate!,
        time: selectedTime!.format(context),
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
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
        title: Text("Add event", style: theme.textTheme.titleMedium),
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
                  AppData.categories[selectedCategory].image,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 44,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: AppData.categories.length,
                  itemBuilder: (context, index) {
                    var category = AppData.categories[index];
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
              Text(
                "Title",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: theme.primaryColorLight,
                ),
              ),
              SizedBox(height: 8),
              CustomTextField(hint: "Event Title", controller: titleController),
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
              CustomTextField(
                hint: "Event Description....",
                controller: descriptionController,
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Icon(
                    Icons.calendar_month_outlined,
                    color: theme.primaryColor,
                    size: 24,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Event Date",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: theme.primaryColorLight,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: chooseDate,
                    child: Text(
                      selectedDate == null
                          ? "Choose date"
                          : AppDate.getFullDate(selectedDate!),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: theme.primaryColor,
                        decoration: TextDecoration.underline,
                        decorationColor: theme.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.access_time, color: theme.primaryColor, size: 24),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Event Time",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: theme.primaryColorLight,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: chooseTime,
                    child: Text(
                      selectedTime == null
                          ? "Choose time"
                          : selectedTime!.format(context),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: theme.primaryColor,
                        decoration: TextDecoration.underline,
                        decorationColor: theme.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Center(
                child: CustomBtn(text: "Add event", onTap: addEvent),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
