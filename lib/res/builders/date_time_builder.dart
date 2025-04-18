import 'package:flutter/material.dart';

class DateTimeBuilder {
  BuildContext context;

  DateTimeBuilder({required this.context});

  Future<DateTime?> showDatePickerView(
      {required DateTime firstDate, required DateTime lastDate,required DateTime initialDate}) {
    return showDatePicker(
        context: context, firstDate: firstDate, lastDate: lastDate , initialDate: initialDate);
  }

  Future<TimeOfDay?> showTimePickerView({required TimeOfDay initialTime}){
    return showTimePicker(context: context, initialTime: initialTime);
  }

}
