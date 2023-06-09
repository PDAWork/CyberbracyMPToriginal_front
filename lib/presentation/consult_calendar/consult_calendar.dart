import 'package:cyberbracy_mpt_original_front/core/const/types.dart';
import 'package:cyberbracy_mpt_original_front/presentation/consult_calendar/cubit/consult_calendar_cubit.dart';
import 'package:cyberbracy_mpt_original_front/service_locator.dart';
import 'package:cyberbracy_mpt_original_front/widget/custom_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConsultCalendar extends StatefulWidget {
  const ConsultCalendar({super.key});

  @override
  State<ConsultCalendar> createState() => _ConsultCalendarState();
}

class _ConsultCalendarState extends State<ConsultCalendar> {
  final kToday = DateTime.now();
  late final UserId userId;
  final Map<DateTime, List<DateTime>> kEvents = {};

  @override
  void initState() {
    userId = sl<UserId>();
    context.read<ConsultCalendarCubit>().getConsulDates(userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConsultCalendarCubit, ConsultCalendarState>(
      builder: (context, state) {
        if (state is ConsultCalendarLoaded) {
          return RefreshIndicator(
            onRefresh: () =>
                context.read<ConsultCalendarCubit>().getConsulDates(userId),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.85,
              child: CustomCalendar(
                dates: state.dates,
              ),
            ),
          );
        }
        if (state is ConsultCalendarError) {
          return RefreshIndicator(
            onRefresh: () =>
                context.read<ConsultCalendarCubit>().getConsulDates(userId),
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.85,
                child: Center(
                  child: Text(state.errorMessage),
                ),
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
