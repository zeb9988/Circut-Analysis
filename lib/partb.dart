// ignore_for_file: non_constant_identifier_names

import 'dart:math';

import 'package:circutanalysis/widgets/animation.dart';
import 'package:circutanalysis/widgets/custombutton.dart';
import 'package:circutanalysis/widgets/text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CircuitDiagramPage extends StatelessWidget {
  TextEditingController realPartController = TextEditingController();
  TextEditingController imaginaryPartController = TextEditingController();
  TextEditingController realPartController2 = TextEditingController();
  TextEditingController imaginaryPartController2 = TextEditingController();

  CircuitDiagramPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 222, 225, 228),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromARGB(255, 112, 110, 110), Colors.white],
            ), // Customize the background color
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 200,
                    // color: Colors.grey,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 80.0),
                      child: buildText(
                          'Figure below shows a balance wye-\nconnected source with rms voltages\nsupplying power to a balance wye-\nconnected load.',
                          20,
                          Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _buildImageInBubble(),
                  ),
                  // Image.asset('assets/pic.png', fit: BoxFit.scaleDown),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                child: buildText(
                  'Enter Components Value Here',
                  22,
                  Colors.black,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              SlideIn(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: _buildComplexInput(
                      'Z(T) =', realPartController, imaginaryPartController),
                ),
              ),
              SlideIn(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: _buildComplexInput(
                      'Z(L) =', realPartController2, imaginaryPartController2),
                ),
              ),
              const SizedBox(height: 80),
              // if (realPartController.text.isNotEmpty &&
              //     realPartController2.text.isNotEmpty &&
              //     imaginaryPartController.text.isNotEmpty &&
              //     imaginaryPartController2.text.isNotEmpty)
              CustomButton(
                  color: Colors.green,
                  label: 'Calculate Solution',
                  onPressed: () {
                    _showResultBottomSheet(context);
                  }),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageInBubble() {
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "Thinking Bubble with Image",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.asset(
              'assets/pic.png',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8.0),
          const Text(
            "Caption or Description",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  void _showResultBottomSheet(BuildContext context) {
    // Calculate the result here using the provided values
    // Replace this with your calculation logic

    double calculateArctan(double bControllerValue, double aControllerValue) {
      try {
        double b = bControllerValue;
        double a = aControllerValue;
        return atan(b / a);
      } catch (e) {
        // Handle parsing or calculation errors here
        print('Error: $e');
        return 0.0; // Return a default value or handle the error as needed
      }
    }

    double ZlvaluerealValue = double.parse(realPartController2.text) / 3;
    double ZlvalueimaginaryValue =
        double.parse(imaginaryPartController2.text) / 3;

    double realPartControllerSum =
        double.parse(realPartController.text) + ZlvaluerealValue;

    double imaginaryPartControllerSum =
        double.parse(imaginaryPartController.text) + ZlvalueimaginaryValue;

    double calculateSumOfSquares(
        double aControllerValue, double bControllerValue) {
      try {
        double a = aControllerValue;
        double b = bControllerValue;
        return sqrt(a * a + b * b);
      } catch (e) {
        // Handle parsing or calculation errors here
        print('Error: $e');
        return 0.0; // Return a default value or handle the error as needed
      }
    }

    double sumofsquare = calculateSumOfSquares(
        realPartControllerSum, imaginaryPartControllerSum);
    double tanInverse =
        calculateArctan(imaginaryPartControllerSum, realPartControllerSum);
    double IaSquare = 240 / sumofsquare;
    double IaWholeSquare = IaSquare * IaSquare;
    // IaSquare = -IaSquare; // Assuming you want to negate the value
    IaSquare = double.parse(IaSquare.toStringAsFixed(2));
    double tanInverseValue = 0 - double.parse(tanInverse.toStringAsFixed(2));
    double ratio = imaginaryPartControllerSum /
        realPartControllerSum; // The ratio for which you want to find the arctan
    double radians = atan(ratio);
    double degrees = radians * (180 / pi);
    print('The arctan of $ratio is $degrees degrees.');

    double total = IaWholeSquare * 3;
    double finalTotalreal = double.parse(realPartController.text) * total;
    double finalTotalimaginary =
        double.parse(imaginaryPartController.text) * total;
    // double Ia=  240 / sumofsquare.toStringAsFixed(2) < 0 - tanInverse.toStringAsFixed(2);
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
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
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
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
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align content to the left
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildText('ZΔ = 3 Z(LY)', 16, Colors.black),
                          Expanded(child: Container()),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return SlideIn(
                                    child: Dialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      elevation: 0,
                                      backgroundColor: Colors.transparent,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            const Padding(
                                              padding: EdgeInsets.all(20.0),
                                              child: Text(
                                                "Conversion Table\nPhase to Line\nZΔ = 3Z(LY)",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                ),
                                                textAlign: TextAlign.center,
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
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      buildText('Z(LY) = Z(L)/3', 16, Colors.black),
                      const SizedBox(
                        height: 10,
                      ),
                      buildText(
                        'Z(LY) = ${ZlvaluerealValue.toStringAsFixed(2)} + ${ZlvalueimaginaryValue.toStringAsFixed(2)}j Ω',
                        16,
                        Colors.black,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      buildText('For one Phase circuit:', 16, Colors.black),
                      // Center(child: buildText('Z_T = 3+5j:', 16, Colors.black)),
                      Stack(
                        children: [
                          Image.asset(
                            'assets/circut3.png',
                          ),
                          Positioned(
                            top: 10,
                            left: 120,
                            child: Row(
                              children: [
                                const Text(
                                  'Z(T) ',
                                  style: TextStyle(fontSize: 10),
                                ),
                                Text(
                                  '= ${realPartController.text} + ${imaginaryPartController.text}j',
                                  style: const TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 40,
                            left: 210,
                            child: Row(
                              children: [
                                const Text(
                                  'Z(LY)',
                                  style: TextStyle(fontSize: 10),
                                ),
                                Text(
                                  ' = ${ZlvaluerealValue.toStringAsFixed(2)} + ${ZlvalueimaginaryValue.toStringAsFixed(2)}j',
                                  style: const TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      buildText('Finding Line Current:', 16, Colors.black),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildText(
                              'Ia = Van / [ Z(T) + Z(LY) ]', 16, Colors.black),
                          Expanded(child: Container()),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return SlideIn(
                                    child: Dialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      elevation: 0,
                                      backgroundColor: Colors.transparent,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            const Padding(
                                              padding: EdgeInsets.all(16.0),
                                              child: Text(
                                                "Treat impedance(Z) as resistor(R),\nit will be similar to ohm's law,\nV=IR , where R = Z , V = IZ",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                ),
                                                textAlign: TextAlign.center,
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
                        ],
                      ),
                      // buildText('Ia = Van / Zt + Zly', 16, Colors.black),
                      const SizedBox(
                        height: 15,
                      ),
                      // buildText('Ia = Van / Zt + Zly', 18, Colors.black),
                      buildText(
                          'Ia = 240 < 0° / [ ( ${realPartController.text} + ${imaginaryPartController.text}j ) + ( ${ZlvaluerealValue.toStringAsFixed(2)} + ${ZlvalueimaginaryValue.toStringAsFixed(2)}j ) ] ',
                          14,
                          Colors.black),
                      const SizedBox(
                        height: 10,
                      ),
                      buildText(
                          'Ia = 240 < 0° / [ ${realPartControllerSum.toStringAsFixed(2)} + ${imaginaryPartControllerSum.toStringAsFixed(2)}j ]',
                          16,
                          Colors.black),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildText(
                              'Ia = 240 < 0° / ${sumofsquare.toStringAsFixed(2)} < ${degrees.toStringAsFixed(2)}°',
                              16,
                              Colors.black),
                          Expanded(child: Container()),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return SlideIn(
                                    child: Dialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      elevation: 0,
                                      backgroundColor: Colors.transparent,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            const Padding(
                                              padding: EdgeInsets.all(20.0),
                                              child: Text(
                                                "a + bj\n\n = √(a^2 - b^2) <  tan^-1(b/a)",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                ),
                                                textAlign: TextAlign.center,
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
                        ],
                      ),
                      // buildText(
                      //     'Ia = 240 < 0° / ${sumofsquare.toStringAsFixed(2)} < ${degrees.toStringAsFixed(2)}°',
                      //     16,
                      //     Colors.black),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildText(
                              'Ia = $IaSquare < ${(0 - degrees).toStringAsFixed(2)}° A',
                              16,
                              Colors.black),
                          Expanded(child: Container()),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return SlideIn(
                                    child: Dialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      elevation: 0,
                                      backgroundColor: Colors.transparent,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            const Padding(
                                              padding: EdgeInsets.all(20.0),
                                              child: Text(
                                                "a < b°/c < d° = a/c < ( b - d )°\n\n( a < b° ) ( c < d° ) = a.c < ( b + d )°",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                ),
                                                textAlign: TextAlign.center,
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
                        ],
                      ),
                      // buildText(
                      //     'Ia = $IaSquare < ${(0 - degrees).toStringAsFixed(2)}° A',
                      //     16,
                      //     Colors.black),
                      const SizedBox(
                        height: 30,
                      ),
                      buildText('Ib = Ia < 120° ', 16, Colors.black),
                      const SizedBox(
                        height: 10,
                      ),
                      buildText(
                          'Ib =  ${(240 / sumofsquare).toStringAsFixed(2)} < ${(120 - (degrees)).toStringAsFixed(2)}° A',
                          16,
                          Colors.black),
                      const SizedBox(
                        height: 30,
                      ),
                      buildText('Ic = Ia < -120° ', 16, Colors.black),
                      const SizedBox(
                        height: 10,
                      ),
                      buildText(
                          'Ic =  ${(240 / sumofsquare).toStringAsFixed(2)} < ${((0 - degrees) + (-120)).toStringAsFixed(2)}° A ',
                          16,
                          Colors.black),
                      const SizedBox(
                        height: 30,
                      ),
                      buildText(
                          'Finding the total complex power \nabsorb by the transmit line: ',
                          16,
                          Colors.black),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildText('Q total = 3 x | Ia | x | Ia | x Z(T) ', 16,
                              Colors.black),
                          Expanded(child: Container()),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return SlideIn(
                                    child: Dialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      elevation: 0,
                                      backgroundColor: Colors.transparent,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            const Padding(
                                              padding: EdgeInsets.all(20.0),
                                              child: Text(
                                                // "Ia = a + bj              or      Ia = c < d°\n|Ia| = √(a^2 - b^2)          |Ia| = c",
                                                "Ia = a + bj\n= c < d°\n|Ia| = c",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                ),
                                                textAlign: TextAlign.center,
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
                                  shape: BoxShape.circle, color: Colors.yellow),
                              margin: const EdgeInsets.only(right: 8),
                              child: const Icon(
                                Icons.question_mark,
                                size: 10,
                                color: Colors.black,
                              ), // Adjust the margin as needed.
                            ),
                          )
                        ],
                      ),
                      // buildText(
                      //     'Q total = 3 * | Ia | ^ 2 * Zt ', 16, Colors.black),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildText(
                              'Q total = 3 x ($IaSquare) x  ($IaSquare) x ( ${realPartController.text} + ${imaginaryPartController.text}j ) ',
                              14,
                              Colors.black),
                          Expanded(child: Container()),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return SlideIn(
                                    child: Dialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      elevation: 0,
                                      backgroundColor: Colors.transparent,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            const Padding(
                                              padding: EdgeInsets.all(20.0),
                                              child: Text(
                                                "Ia = c < d°\n3 x |Ia|^2 x (E + Fj)\n=(3 x C^2 x E) + (3 x C^2 x F)j",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                ),
                                                textAlign: TextAlign.center,
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
                        ],
                      ),

                      // buildText(
                      //     'Q total = 3 * ($IaSquare ^ 2)  * (${realPartController.text} + ${imaginaryPartController.text}j) ',
                      //     16,
                      //     Colors.black),
                      const SizedBox(
                        height: 10,
                      ),
                      buildText(
                          'Q total = ( ${finalTotalreal.toStringAsFixed(2)} + ${finalTotalimaginary.toStringAsFixed(2)}j ) Va ',
                          16,
                          Colors.black)
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildComplexInput(String label, TextEditingController realController,
      TextEditingController imaginaryController) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            label,
            style: const TextStyle(
              color: Colors.black, // Customize label color
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 80,
            child: TextFormField(
              controller: realController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          const Text(
            ' + ',
            style: TextStyle(
              color: Colors.black, // Customize label color
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            width: 80,
            child: TextFormField(
              controller: imaginaryController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          const Text(
            ' j',
            style: TextStyle(
              color: Colors.black, // Customize label color
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
