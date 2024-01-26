import 'package:flutter/material.dart';

// import 'package:flutter/widgets.dart';
import 'package:gurukul/Screens/feesScreen/feesScreenCard.dart';
import 'package:gurukul/other/constraits.dart';

class ActionRequiredContainer extends StatelessWidget {
  const ActionRequiredContainer({
    super.key,
    required this.title,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return
        // padding: const EdgeInsets.symmetric(vertical: 10),
        Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(
            12,
          ),
          child: DefaultText(
            title: title,
            color: Colors.black,
            fontsize: 20,
            weight: FontWeight.bold,
          ),
        ),
        Container(
          height: 200,
          child: GestureDetector(
            onTap: () {
              // Show the payment details pop-up
              _showPaymentDetailsPopup(context, '5', "Credit Card", 20000.00);
            },
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return FeesScreenCard(
                    ammount: '20,000',
                    heading: 'Installment #${index}',
                  );
                }),
          ),
        )
      ],
    );
  }
}

void _showPaymentDetailsPopup(BuildContext context, String activity,
    String paymentMethod, double amount) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Payment Detail'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/tickicon.png',
                    height: 100,
                  ),
                  Text(
                    'Successfully Done',
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Installment No.:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                Text(
                  activity,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Transaction ID:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  '#027233251',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Executed On:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  '27 Nov, 2023',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Amount', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  'Rs.${amount.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the pop-up
            },
            child: Text('Close'),
          ),
        ],
      );
    },
  );
}
