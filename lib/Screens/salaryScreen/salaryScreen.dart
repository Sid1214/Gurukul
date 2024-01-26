import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gurukul/other/constraits.dart';
import 'package:gurukul/other/defaultScaffold.dart';

class Salary {
  final String month;
  final double amount;

  Salary(this.month, this.amount);
}

class SalaryScreen extends StatelessWidget {
  final List<Salary> salaries = [
    Salary('12 December', 7000),
    Salary('12 November', 6500),
    Salary('12 October', 6200),
    Salary('12 September', 6000),
    Salary('12 August', 5500),
    Salary('12 July', 5000),
    Salary('12 June', 4800),
    Salary('12 May', 4500),
    Salary('12 April', 4200),
    Salary('12 March', 4000),
    Salary('12 February', 3700),
    Salary('12 January', 3500),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: 'Salary',
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Salary for the Last ${salaries.length} Months:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Column(
                children: salaries.map((salary) {
                  return SalaryCard(month: salary.month, amount: salary.amount);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SalaryCard extends StatelessWidget {
  final String month;
  final double amount;

  SalaryCard({required this.month, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
      height: 80,
      width: double.infinity,
      color: Colors.white,
      child: Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                'assets/decoration/upper.png',
                color: Colors.amber.shade100,
                height: 60,
              )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  color: Colors.amber.shade200,
                  width: 40,
                  height: 60,
                  child: const Center(
                      child: Icon(
                    Icons.account_balance,
                    color: Colors.black87,
                    size: 30,
                  )),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Received Date: $month, 2023',
                      style: GoogleFonts.ubuntu(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Amount: Rs.${amount.toStringAsFixed(2)}',
                      style: GoogleFonts.ubuntu(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
