/// ***
/// This class consists of the DateWidget that is used in the ListView.builder
///
/// Author: Vivek Kaushik <me@vivekkasuhik.com>
/// github: https://github.com/iamvivekkaushik/
/// ***

import 'package:date_picker_timeline/gestures/tap.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class DateWidget extends StatefulWidget {
  final double? width;
  final DateTime date;
  final TextStyle? monthTextStyle, dayTextStyle, dateTextStyle;
  final Color selectionColor;
  final Color bottomLineColor;
  final DateSelectionCallback? onDateSelected;
  final String? locale;
  final bool hasItem;

  DateWidget({
    required this.date,
    required this.monthTextStyle,
    required this.dayTextStyle,
    required this.dateTextStyle,
    required this.selectionColor,
    required this.bottomLineColor,
    this.width,
    this.onDateSelected,
    this.locale,
    this.hasItem = false,
  });

  @override
  State<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: widget.width,
        margin: EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: widget.selectionColor,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                  new DateFormat("MMM", widget.locale)
                      .format(widget.date)
                      .toUpperCase(), // Month
                  style: widget.monthTextStyle),
              Container(
                width: 50,
                padding: const EdgeInsets.only(
                  bottom: 0,
                ),
                child: Text(
                  widget.date.day.toString(), // Date
                  style: widget.dateTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: 35,
                child: Divider(
                  height: 0,
                  color: widget.bottomLineColor,
                  thickness: 3,
                ),
              ),
              Text(
                  new DateFormat("E", widget.locale)
                      .format(widget.date)
                      .toUpperCase(), // WeekDay
                  style: widget.dayTextStyle)
            ],
          ),
        ),
      ),
      onTap: () {
        setState(() {
          // Set the date selected to true, but any other date to false
        });
        // Check if onDateSelected is not null
        if (widget.onDateSelected != null) {
          // Call the onDateSelected Function
          widget.onDateSelected!(this.widget.date);
        }
      },
    );
  }
}
