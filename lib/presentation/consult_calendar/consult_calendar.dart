import 'dart:collection';
import 'package:cyberbracy_mpt_original_front/core/const/colors_theme.dart';
import 'package:cyberbracy_mpt_original_front/core/const/types.dart';
import 'package:cyberbracy_mpt_original_front/presentation/consult_calendar/cubit/consult_calendar_cubit.dart';
import 'package:cyberbracy_mpt_original_front/service_locator.dart';
import 'package:cyberbracy_mpt_original_front/widget/custom_calendar.dart';
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
          return CustomCalendar(
            dates: state.dates,
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
