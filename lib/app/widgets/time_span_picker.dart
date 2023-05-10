import 'package:flutter/material.dart';
import 'package:mapalus_pos_2/shared/shared.dart';

enum TimeSpanPickerSelection {
  thisDay,
  thisWeek,
  thisMonth,
  thisYear,
  custom,
}

class TimeSpanPicker extends StatefulWidget {
  const TimeSpanPicker({Key? key, required this.onSelectTimeSpan})
      : super(key: key);

  final void Function(DateTimeRange? dateTimeRange) onSelectTimeSpan;

  @override
  State<TimeSpanPicker> createState() => _TimeSpanPickerState();
}

class _TimeSpanPickerState extends State<TimeSpanPicker> {
  String selectedDateText = "Pilih";

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.hardEdge,
      color: Theme.of(context).colorScheme.primaryContainer,
      borderRadius: BorderRadius.circular(Insets.small),
      child: InkWell(
        onTap: () async {
          final result = await showModalBottomSheet<DateTimeRange?>(
            context: context,
            builder: (context) => BottomSheet(
              enableDrag: true,
              clipBehavior: Clip.hardEdge,
              onClosing: () {},
              builder: (context) => Container(
                padding: const EdgeInsets.symmetric(
                  vertical: Insets.medium,
                  horizontal: Insets.small,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0;
                        i < TimeSpanPickerSelection.values.length;
                        i++)
                      ListTile(
                        title: Text(
                          TimeSpanPickerSelection
                              .values[i].timeSpanSelectionTranslatedName,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        onTap: () async {
                          final selected = TimeSpanPickerSelection.values[i];
                          DateTimeRange? resultDateRange;
                          String selectedText = TimeSpanPickerSelection
                              .values[i].timeSpanSelectionTranslatedName;
                          switch (selected) {
                            case TimeSpanPickerSelection.thisDay:
                              resultDateRange = DateTimeRange(
                                start: DateTime.now().resetTimeOfTheDay(),
                                end: DateTime.now()
                                    .resetTimeOfTheDay(start: false),
                              );
                              selectedText =
                              '${resultDateRange.start.format("EEEE HH:mm")} - '
                                  '${resultDateRange.end.format("HH:mm")}';
                              break;
                            case TimeSpanPickerSelection.thisWeek:
                              resultDateRange = DateTimeRange(
                                start: DateTime.now().resetTimeOfTheWeek().add(const Duration(days: 1)),
                                end: DateTime.now()
                                    .resetTimeOfTheWeek(start: false),
                              );
                              selectedText =
                              '${resultDateRange.start.format("E, dd MMMM")} - '
                                  '${resultDateRange.end.format("E, dd MMMM")}';
                              break;
                            case TimeSpanPickerSelection.thisMonth:
                              resultDateRange = DateTimeRange(
                                start: DateTime.now().resetTimeOfTheMonth(),
                                end: DateTime.now()
                                    .resetTimeOfTheMonth(start: false),
                              );
                              selectedText =
                                  '${resultDateRange.start.toMonthMMMM} '
                                      '${resultDateRange.start.toYeary}';
                              break;
                            case TimeSpanPickerSelection.thisYear:
                              resultDateRange = DateTimeRange(
                                start: DateTime.now().resetTimeOfTheYear(),
                                end: DateTime.now()
                                    .resetTimeOfTheYear(start: false),
                              );
                              selectedText =
                                  resultDateRange.start.year.toString();
                              break;
                            case TimeSpanPickerSelection.custom:
                              final res = await showDateRangePicker(
                                currentDate: DateTime.now(),
                                initialEntryMode: DatePickerEntryMode.calendar,
                                context: context,
                                firstDate: DateTime(2022),
                                lastDate: DateTime(2040),
                                builder: (context, child) => Theme(
                                  data: ThemeData.dark(useMaterial3: true),
                                  child: child!,
                                ),
                              );
                              if (res != null) {
                                resultDateRange = DateTimeRange(
                                  start: res.start.resetTimeOfTheDay(),
                                  end: res.end.resetTimeOfTheDay(start: false),
                                );
                                selectedText =
                                    "${resultDateRange.start.format("d MMM yyyy")} - ${resultDateRange.end.format("d MMM yyyy")}";
                              }
                              break;
                          }

                          if (resultDateRange != null) {
                            setState(() {
                              selectedDateText = selectedText;
                            });
                          }
                          Navigator.pop(context, resultDateRange);
                        },
                      ),
                  ],
                ),
              ),
            ),
          );

          widget.onSelectTimeSpan(result);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Insets.small,
            vertical: Insets.small,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Lingkup Waktu Pesanan",
                  ),
                  const SizedBox(width: 3),
                  Text(
                    selectedDateText,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              const Icon(Icons.arrow_drop_down_rounded, size: 30),
            ],
          ),
        ),
      ),
    );
  }
}
