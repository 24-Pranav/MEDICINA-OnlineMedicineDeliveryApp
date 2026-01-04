import 'package:flutter/material.dart';
import 'package:medicina/components/theme.dart';
import 'package:medicina/screens/checkout/alert.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: const Text(
          'Confirm Order',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Shipping address',
              style: headingText,
            ),
            Card(
              margin: const EdgeInsets.only(top: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Ravishan Sachin',
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Change',
                              style: TextStyle(color: Colors.orange),
                            )),
                      ],
                    ),
                    const Text("382/B/1, Mathara")
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Prescription No: 5',
                  style: headingText,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              children: [
                Text("Amlodipine Amlong(5 mg)"),
                SizedBox(
                  width: 35,
                ),
                Text("LKR 183.30"),
              ],
            ),
            const Row(
              children: [
                Text("Gliclazide Reclide(40 mg)"),
                SizedBox(
                  width: 42,
                ),
                Text("LKR 375.25"),
              ],
            ),
            const Row(
              children: [
                Text("One-Alpha(0.25mg)"),
                SizedBox(
                  width: 80,
                ),
                Text("LKR 164.65"),
              ],
            ),
            const Row(
              children: [
                Text("Kalzana Calcium(430 mg)"),
                SizedBox(
                  width: 40,
                ),
                Text("LKRE 76.80"),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Payment Method',
              style: headingText,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Checkbox(value: true, onChanged: null),
                deliveryCard(R.icon.visaCard),
              ],
            ),
            Row(children: [
              Checkbox(value: false, onChanged: null),
              const SizedBox(
                  width: 240,
                  height: 30,
                  child: Card(
                    child: Text(
                      "Cash on Delivery",
                      textAlign: TextAlign.center,
                    ),
                  ))
            ]),
            const SizedBox(
              height: 30,
            ),
            rowOrderInfo('Order:', 100),
            rowOrderInfo('Delivery:', 100),
            rowOrderInfo('Total:', 100),
            const SizedBox(
              height: 16,
            ),
            _buttonSubmitOrder()
          ],
        ),
      ),
    );
  }

  Widget rowOrderInfo(String type, double price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            type,
            style: minorText,
          ),
          const Text(
            "120",
            style: textMedium,
          )
        ],
      ),
    );
  }

  Widget _buttonSubmitOrder() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
            backgroundColor: AppColors.orange,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AlertScreen()),
            );
          },
          child: const Text(
            'COMPLETE ORDER',
            style: whiteText,
          )),
    );
  }

  Widget deliveryCard(String icon) {
    return Expanded(
      child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [Image.asset(icon, width: 200, height: 30), const Text("Credit or Debit Card")],
            ),
          )),
    );
  }
}

class R {
  static var icon;
}
