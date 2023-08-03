import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../../core/utils/constants/colors.dart';
import '../../../widgets/appbar.dart';

class AboutScreen extends StatelessWidget {
  static const route = '/about';

  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              SizedBox(
                height: 450,
                child: SfCalendar(
                  view: CalendarView.month,
                  allowViewNavigation: false,
                  showNavigationArrow: true,
                  firstDayOfWeek: 1,
                  cellBorderColor: Colors.redAccent,
                  dataSource: MeetingDataSource(_getDataSource()),
                  monthViewSettings: const MonthViewSettings(
                    showTrailingAndLeadingDates: false,
                    appointmentDisplayMode:
                        MonthAppointmentDisplayMode.appointment,
                    monthCellStyle: MonthCellStyle(
                        // backgroundColor: greyColor,
                        // todayBackgroundColor: greyColor,
                        ),
                  ),
                  appointmentBuilder: (context, calendarAppointmentDetails) {
                    return const Icon(
                      Icons.music_note,
                      color: accentColor,
                    );
                  },
                  // monthCellBuilder:
                  //     (BuildContext context, MonthCellDetails details) {
                  //   bool music = details.date.day % 3 == 0;
                  //   bool sports = details.date.day % 4 == 0;
                  //   bool cars = details.date.day % 5 == 0;
                  //   return Column(
                  //     children: [
                  //       Text(details.date.day.toString()),
                  //       if (music || sports || cars)
                  //         IconButton(
                  //           onPressed: () {},
                  //           icon: music
                  //               ? Icon(
                  //                   Icons.music_note,
                  //                   color: Colors.pink[400],
                  //                 )
                  //               : sports
                  //                   ? Icon(
                  //                       Icons.sports_football_sharp,
                  //                       color: Colors.lightGreenAccent[700],
                  //                     )
                  //                   : Icon(
                  //                       Icons.directions_car,
                  //                       color: Colors.cyan[400],
                  //                     ),
                  //         )
                  //     ],
                  //   );
                  // },
                ),
              ),
            ],
          ),
        ),
      ),
      // Center(child: Text('About')),
    );
  }
}

List<Meeting> _getDataSource() {
  final List<Meeting> meetings;
  final DateTime today = DateTime.now();

  meetings = [
    Meeting(
      'Conference',
      DateTime(today.year, today.month, today.day),
    ),
    Meeting(
      'Conference 2',
      DateTime(today.year, today.month, today.day + 2),
    ),
    Meeting(
      'Conference 3',
      DateTime(today.year, today.month, today.day + 5),
    ),
    Meeting(
      'Conference 4',
      DateTime(today.year, today.month, today.day + 10),
    ),
  ];
  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }
  @override
  DateTime getStartTime(int index) {
    return appointments![index].date;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].date;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  bool isAllDay(int index) {
    return true;
  }
}

class Meeting {
  Meeting(
    this.eventName,
    this.date, {
    this.background = accentColor,
  });

  String eventName;
  DateTime date;
  Color background;
}
