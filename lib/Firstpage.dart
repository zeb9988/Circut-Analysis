import 'package:circutanalysis/parta.dart';
import 'package:circutanalysis/partb.dart';
import 'package:circutanalysis/widgets/custombutton.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Container(
          //   decoration: BoxDecoration(
          //     color: Color.fromARGB(255, 155, 169, 185), // A unique blue color
          //   ),
          // ),
          Container(
            color: const Color.fromARGB(255, 82, 167, 236),
            // A lighter blue color
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(20),
                  child: const Text(
                    'Circuit Analysis',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Image.asset('assets/logo.png', width: 350, height: 350),
                const SizedBox(height: 40),
                CustomButton(
                    color: Colors.orange,
                    label: 'Q4 Part A',
                    // color: Color(0xFFFFA500),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const PartA()));
                    }),
                const SizedBox(height: 20),
                CustomButton(
                  color: Colors.green,
                  label: 'Q4 Part B',
                  // color: Color(0xFF66BB6A),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CircuitDiagramPage()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
