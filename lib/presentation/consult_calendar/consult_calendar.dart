import 'dart:collection';
import 'package:cyberbracy_mpt_original_front/core/const/colors_theme.dart';
import 'package:cyberbracy_mpt_original_front/core/const/types.dart';
import 'package:cyberbracy_mpt_original_front/presentation/consult_calendar/cubit/consult_calendar_cubit.dart';
import 'package:cyberbracy_mpt_original_front/service_locator.dart';
import 'package:cyberbracy_mpt_original_front/widget/app_bar_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class ConsultCalendar extends StatefulWidget {
  const ConsultCalendar({super.key});

  @override
  State<ConsultCalendar> createState() => _ConsultCalendarState();
}

class _ConsultCalendarState extends State<ConsultCalendar> {
  late DateTime _selectedDay;

  DateTime _focusedDay = DateTime.now();
  final kToday = DateTime.now();
  final Map<DateTime, List<DateTime>> _kEventSource = {};
  late final ValueNotifier<List<DateTime>> _selectedEvents;
  late final UserId userId;
  final Map<DateTime, List<DateTime>> kEvents = {};

  @override
  void initState() {
    userId = sl.get<UserId>();
    context.read<ConsultCalendarCubit>().getConsulDates(userId);
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier([]);
    super.initState();
  }

  List<DateTime> _getEventsForDay(DateTime day) {
    var dt = DateTime(day.year, day.month, day.day);
    return kEvents[dt] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  List<String> formateDate(List<DateTime> dates) {
    List<String> list = [];
    for (var element in dates) {
      list.add(DateFormat().format(element));
    }
    return list;
  }

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConsultCalendarCubit, ConsultCalendarState>(
      builder: (context, state) {
        if (state is ConsultCalendarLoaded) {
          for (var item in state.dates) {
            _kEventSource.addAll(
              {
                item.consultDate: item.consultDateList,
              },
            );
          }
          kEvents.addAll(
            LinkedHashMap<DateTime, List<DateTime>>(
              equals: isSameDay,
              hashCode: getHashCode,
            )..addAll(_kEventSource),
          );
          _selectedEvents.value = _getEventsForDay(_selectedDay);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: TableCalendar(
                    locale: 'ru_RU',
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleTextFormatter: (date, locale) {
                        var dateString =
                            DateFormat.MMMMEEEEd(locale).format(date);
                        return dateString =
                            dateString.substring(0, 1).toUpperCase() +
                                dateString.substring(1);
                      },
                    ),
                    calendarStyle: CalendarStyle(
                      todayTextStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      selectedTextStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      selectedDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: ColorTheme.darkRed),
                      ),
                      markersMaxCount: 1,
                      todayDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorTheme.lightRed,
                      ),
                    ),
                    eventLoader: _getEventsForDay,
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                    onDaySelected: _onDaySelected,
                    calendarFormat: CalendarFormat.week,
                    currentDay: DateTime.now(),
                    firstDay: DateTime.now(),
                    lastDay: DateTime(DateTime.now().year, DateTime.now().month,
                        DateTime.now().day + 13),
                    focusedDay: _focusedDay,
                  ),
                ),
                Expanded(
                  child: ValueListenableBuilder(
                    valueListenable: _selectedEvents,
                    builder: (context, value, child) {
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio:
                                (MediaQuery.of(context).size.width / 2) / 56,
                            crossAxisCount: 2),
                        itemCount: value.length,
                        itemBuilder: (context, index) {
                          var today = DateTime(
                            kToday.year,
                            kToday.month,
                            kToday.day,
                            kToday.hour,
                          );
                          var isLate = false;
                          var isOverLate = value[index].hour > today.hour + 2;
                          isOverLate ? isLate = false : isLate = true;
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: isOverLate || isLate && index != 0
                                    ? Colors.grey.shade200
                                    : Colors.white,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(4),
                                ),
                                border: Border.all(
                                  color: Colors.grey.shade400,
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        DateFormat.Hm()
                                            .format(value[index])
                                            .toString(),
                                      ),
                                      if (isLate && index != 0)
                                        Icon(
                                          Icons.check_circle,
                                          size: 16,
                                          color: Colors.green.withOpacity(.5),
                                        ),
                                      if (isOverLate && index != 0)
                                        Icon(
                                          Icons.watch_later,
                                          size: 16,
                                          color:
                                              Colors.deepOrange.withOpacity(.5),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          );
        }
        if (state is ConsultCalendarError) {
          Center(
            child: Text(state.errorMessage),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
