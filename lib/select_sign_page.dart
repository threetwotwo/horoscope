import 'package:flutter/material.dart';
import 'package:horoscope/daily_reading_page.dart';
import 'package:horoscope/sign.dart';

class SelectSignPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text('Select your sign'),
              ),
            ),
            SizedBox(height: 16),
            Wrap(
              children: List.generate(
                Sign.values.length,
                (index) {
                  final sign = Sign.values[index];
                  return InkWell(
                    onTap: () => Navigator.of(context).push(DailyReadingPage.route(sign)),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            signEmoji(sign),
                            style: TextStyle(fontSize: 44),
                          ),
                          Text(signString(sign)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
