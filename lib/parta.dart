import 'package:circutanalysis/widgets/animation.dart';
import 'package:circutanalysis/widgets/custombutton.dart';
import 'package:flutter/material.dart';

class PartA extends StatelessWidget {
  const PartA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image

          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromARGB(255, 112, 110, 110), Colors.white],
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: FadeIn(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const SizedBox(
                    height: 90,
                  ),
                  buildText(
                    'Find the transfer function Vo (S)/Is (S)\nfor the circuit shown in Figure 4.1.\nSuppose ls(t) = 2u(t).Find the value\nof Vo(t) when t = ∞.',
                    20,
                    Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _buildImageInBubble(),
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                  CustomButton(
                    color: Colors.green,
                    label: 'Calculate Solution',
                    onPressed: () {
                      _showResultBottomSheet(context);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _showResultBottomSheet(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  height: 6,
                  width: 60,
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                buildText('Solution', 24, Colors.deepPurple),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Text(
                        'Circuit in S-domain',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 100,
                          child: Image.asset(
                            'assets/parta1.png',
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return SlideIn(
                                child: Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  elevation: 0,
                                  backgroundColor: Colors.transparent,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        const Padding(
                                          padding: EdgeInsets.all(20.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Inductor (L)\nTime-domain: L\nS-domain: SL',
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              Text(
                                                'Capacitor (C)\nTime-domain: C\nS-domain: 1/SC',
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text(
                                              "Close",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          width: 20, // Adjust the dot size as needed.
                          height: 20, // Adjust the dot size as needed.
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors
                                  .yellow // Adjust the dot color as needed.
                              ),
                          margin: const EdgeInsets.only(right: 8),
                          child: const Icon(
                            Icons.question_mark,
                            size: 10,
                            color: Colors.black,
                          ), // Adjust the margin as needed.
                        ),
                      )
                      // const ElTooltip(
                      //   // position: ElTooltipPosition.leftStart,
                      //   content: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Text('Inductor (L)\nTime-domain: L\nS-domain: SL'),
                      //       Text(
                      //           'Capacitor (C)\nTime-domain: C\nS-domain: 1/SC'),
                      //     ],
                      //   ),
                      //   // position: ElTooltipPosition.leftStart,
                      //   child: Icon(
                      //     Icons.info_outline,
                      //     color: Colors.amber,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 80,
                          child: Image.asset(
                            'assets/parta2.png',
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return SlideIn(
                                child: Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  elevation: 0,
                                  backgroundColor: Colors.transparent,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: SizedBox(
                                            height: 120,
                                            child: Image.asset(
                                              'assets/hint.png',
                                              filterQuality: FilterQuality.high,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text(
                                              "Close",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          width: 20, // Adjust the dot size as needed.
                          height: 20, // Adjust the dot size as needed.
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors
                                  .yellow // Adjust the dot color as needed.
                              ),
                          margin: const EdgeInsets.only(right: 8),
                          child: const Icon(
                            Icons.question_mark,
                            size: 10,
                            color: Colors.black,
                          ), // Adjust the margin as needed.
                        ),
                      )
                      // const ElTooltip(
                      //   // position: ElTooltipPosition.leftStart,
                      //   content: Text('Insert Photo'),

                      //   child: Icon(
                      //     Icons.info_outline,
                      //     color: Colors.amber,
                      //   ),
                      // )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 100,
                          child: Image.asset(
                            'assets/parta3.png',
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return SlideIn(
                                child: Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  elevation: 0,
                                  backgroundColor: Colors.transparent,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        const Padding(
                                          padding: EdgeInsets.all(20.0),
                                          child: Text(
                                            'Ohm\'s Law\nV = IR\nIo = Vo (S) / R',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text(
                                              "Close",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          width: 20, // Adjust the dot size as needed.
                          height: 20, // Adjust the dot size as needed.
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors
                                  .yellow // Adjust the dot color as needed.
                              ),
                          margin: const EdgeInsets.only(right: 8),
                          child: const Icon(
                            Icons.question_mark,
                            size: 10,
                            color: Colors.black,
                          ), // Adjust the margin as needed.
                        ),
                      )
                      // const ElTooltip(
                      //   // position: ElTooltipPosition.leftStart,
                      //   content: Text('Ohm\'s Law\nV = IR\nIo = Vo (S) / R'),
                      //   child: Icon(
                      //     Icons.info_outline,
                      //     color: Colors.amber,
                      //   ),
                      // )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 70,
                          child: Image.asset(
                            'assets/parta4.png',
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return SlideIn(
                                child: Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  elevation: 0,
                                  backgroundColor: Colors.transparent,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        const Padding(
                                          padding: EdgeInsets.all(20.0),
                                          child: Text(
                                            'U (t) = 1/S in S-domain',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text(
                                              "Close",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          width: 20, // Adjust the dot size as needed.
                          height: 20, // Adjust the dot size as needed.
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors
                                  .yellow // Adjust the dot color as needed.
                              ),
                          margin: const EdgeInsets.only(right: 8),
                          child: const Icon(
                            Icons.question_mark,
                            size: 10,
                            color: Colors.black,
                          ), // Adjust the margin as needed.
                        ),
                      )
                      // const ElTooltip(
                      //   // position: ElTooltipPosition.leftStart,
                      //   content: Text('U (t) = 1/S in S-domain'),
                      //   child: Icon(
                      //     Icons.info_outline,
                      //     color: Colors.amber,
                      //   ),
                      // )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 170,
                          // width: 100,
                          child: Image.asset(
                            'assets/parta6.png',
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
      );
    },
  );
}

class FadeIn extends StatefulWidget {
  final Widget child;

  FadeIn({required this.child});

  @override
  _FadeInState createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    // Delay the fade-in animation for 500 milliseconds
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _visible = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: widget.child,
    );
  }
}

Widget buildText(String text, double fontSize, Color color) {
  return Text(
    text,
    style: TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color,
      overflow: TextOverflow.ellipsis,
      letterSpacing: 0.1, // Adjust the spacing between characters.
      // fontFamily: 'YourFontFamily', // Replace with your preferred font.
      shadows: [
        const Shadow(
          color: Colors.grey, // Add a subtle text shadow for better visibility.
          offset: Offset(1, 1),
          blurRadius: 2,
        ),
      ],
    ),
    // textAlign: TextAlign.center,
  );
}

Widget _buildImageInBubble() {
  return Container(
    height: 250,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 3,
          offset: const Offset(0, 6),
        ),
      ],
    ),
    margin: const EdgeInsets.symmetric(vertical: 8.0),
    padding: const EdgeInsets.all(16.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 8.0),
        ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Image.asset(
            'assets/parta.png',
            fit: BoxFit
                .contain, // Use BoxFit.contain to make sure the image isn't cropped.
            filterQuality:
                FilterQuality.high, // Set a higher filter quality for clarity.
          ),
        ),
        // const SizedBox(height: 8.0),
        // buildText("Figure 4.1", 16, Colors.black),
      ],
    ),
  );
}
