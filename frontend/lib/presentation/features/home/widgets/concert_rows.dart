import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class ConcertRows extends StatelessWidget {
  final List<String> dataList;

  const ConcertRows({super.key, required this.dataList});

  @override
  Widget build(BuildContext context) {
    int middleIndex = dataList.length ~/ 3;
    int lastIndex = middleIndex * 2;

    List<String> topRowData = dataList.sublist(0, middleIndex);
    List<String> middleRowData = dataList.sublist(middleIndex, lastIndex + 1);
    List<String> bottomRowData = dataList.sublist(lastIndex + 1);

    return Column(
      children: [
        SizedBox(
          height: 30,
          child: Marquee(
            text: topRowData.join('      '),
            crossAxisAlignment: CrossAxisAlignment.start,
            blankSpace: 20.0,
            velocity: 30,
            pauseAfterRound: const Duration(seconds: 1),
            fadingEdgeStartFraction: 0.1,
            fadingEdgeEndFraction: 0.1,
            numberOfRounds: 2,
          ),
        ),
        SizedBox(
          height: 30,
          child: Marquee(
            text: middleRowData.join('      '),
            crossAxisAlignment: CrossAxisAlignment.start,
            blankSpace: 20.0,
            velocity: 30,
            textDirection: TextDirection.rtl,
            pauseAfterRound: const Duration(seconds: 1),
            fadingEdgeStartFraction: 0.1,
            fadingEdgeEndFraction: 0.1,
            numberOfRounds: 2,
            
          ),
        ),
        SizedBox(
          height: 30,
          child: Marquee(
            text: bottomRowData.join('      '),
            crossAxisAlignment: CrossAxisAlignment.start,
            blankSpace: 20.0,
            velocity: 30,
            pauseAfterRound: const Duration(seconds: 1),
            fadingEdgeStartFraction: 0.1,
            fadingEdgeEndFraction: 0.1,
            numberOfRounds: 2,
          ),
        ),
      ],
    );
  }
}
