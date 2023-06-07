import 'package:cyberbracy_mpt_original_front/domain/entity/consult_date.dart';
import 'package:cyberbracy_mpt_original_front/domain/uses/get_consult_dates.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'consult_calendar_state.dart';

class ConsultCalendarCubit extends Cubit<ConsultCalendarState> {
  final GetConsultDates _getConsultDates;
  ConsultCalendarCubit(this._getConsultDates) : super(ConsultCalendarInitial());

  Future<void> getConsulDates(int id) async {
    try {
      var response = await _getConsultDates.call(GetConsultDatesParams(id));
      response.fold(
        (error) => emit(
          ConsultCalendarError(error.toString()),
        ),
        (data) => emit(
          ConsultCalendarLoaded(data),
        ),
      );
    } catch (e) {
      emit(
        ConsultCalendarError(e.toString()),
      );
    }
  }
}
