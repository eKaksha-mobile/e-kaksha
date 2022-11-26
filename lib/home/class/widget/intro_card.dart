import 'package:flutter/material.dart';

class IntroCard extends StatelessWidget {
  final String _title;
  final String _subtitle;
  final String _assetName;

  const IntroCard(this._title, this._subtitle, this._assetName, {super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Card(
      elevation: 3,
      child: Container(
        height: mediaQuery.size.height * 0.15,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(_assetName), fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 4,
            ),
            SizedBox(
              width: 200,
              child: Text(
                _subtitle,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
