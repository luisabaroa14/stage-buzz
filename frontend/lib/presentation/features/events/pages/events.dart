import 'package:app/core/utils/constants/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../home/pages/home.dart';

class EventsScreen extends StatefulWidget {
  static const route = '/events';

  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  int _current = 0;

  final CarouselController _controller = CarouselController();

  List _isHovering = [false, false, false, false, false, false, false];
  List _isSelected = [true, false, false, false, false, false, false];

  final List<String> images = [
    'assets/concert.jpg',
    'assets/f1.jpg',
    'assets/championship.jpg',
    'assets/football.jpg',
    'assets/american_football.jpg',
  ];

  final List<String> places = [
    'Concerts',
    'F1',
    'Horse Shows',
    'Soccer',
    'Football',
  ];

  List<Widget> generateImageTiles(Size screenSize) {
    return images
        .map(
          (element) => ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: ColorFiltered(
              colorFilter: const ColorFilter.mode(
                Color.fromARGB(119, 77, 217, 149),
                BlendMode.color,
              ),
              child: Image.asset(
                element,
                fit: BoxFit.cover,
                // height: screenSize.height / 1.2,
                // height: screenSize.height / 2,
                width: screenSize.width / 1.2,
              ),
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context);

    var imageSliders = generateImageTiles(screenSize);

    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Featured Events',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 15),
              Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  CarouselSlider(
                    items: imageSliders,
                    carouselController: _controller,
                    options: CarouselOptions(
                      enlargeCenterPage: true,
                      aspectRatio: 22 / 9,
                      autoPlay: false,
                      enlargeFactor: 0.3,
                      onPageChanged: (index, reason) => setState(() {
                        _current = index;

                        for (int i = 0; i < imageSliders.length; i++) {
                          if (i == index) {
                            _isSelected[i] = true;
                          } else {
                            _isSelected[i] = false;
                          }
                        }
                      }),
                    ),
                  ),
                  Text(
                    places[_current],
                    style: const TextStyle(
                      fontFamily: 'Raleway',
                      color: whiteBackgroundColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Positioned.fill(
                    bottom: -20,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenSize.width / 8,
                        ),
                        child: Card(
                          elevation: 10,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: screenSize.height / 50,
                              bottom: screenSize.height / 50,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                for (int i = 0; i < places.length; i++)
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        onHover: (value) {
                                          setState(() {
                                            value
                                                ? _isHovering[i] = true
                                                : _isHovering[i] = false;
                                          });
                                        },
                                        onTap: () {
                                          _controller.animateToPage(i);
                                        },
                                        child: Text(
                                          places[i],
                                          style: TextStyle(
                                            fontWeight: _isHovering[i]
                                                ? FontWeight.w600
                                                : FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Visibility(
                                        maintainSize: false,
                                        maintainAnimation: true,
                                        maintainState: true,
                                        visible: _isSelected[i],
                                        child: AnimatedOpacity(
                                          duration:
                                              const Duration(milliseconds: 400),
                                          opacity: _isSelected[i] ? 1 : 0,
                                          child: Container(
                                            height: 5,
                                            decoration: const BoxDecoration(
                                              color: accentColor,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            width: screenSize.width / 10,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 150),
            ],
          ),
        ),
      ),
    );
  }
}
