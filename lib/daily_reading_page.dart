import 'package:flutter/material.dart';
import 'package:horoscope/ohmanda_api.dart';
import 'package:horoscope/sign.dart';

class DailyReadingPage extends StatelessWidget {
  final Sign sign;
  static MaterialPageRoute route(Sign sign) => MaterialPageRoute(builder: (_) => DailyReadingPage(sign: sign));

  const DailyReadingPage({Key? key, required this.sign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Horoscope'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            signEmoji(sign),
            style: TextStyle(fontSize: 64),
          ),
          Text(
            signString(sign),
            style: TextStyle(fontSize: 18),
          ),
          FutureBuilder<String>(
            future: OhmandaApi().getDailyHoroscope(sign),
            builder: (context, snapshot) {
              return Padding(
                padding: const EdgeInsets.all(36.0),
                child: Center(
                  child: snapshot.hasData ? Text(snapshot.data ?? 'nothing') : CircularProgressIndicator.adaptive(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
