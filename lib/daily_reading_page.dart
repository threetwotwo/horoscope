import 'dart:async';

import 'package:flutter/material.dart';
import 'package:horoscope/ohmanda_api.dart';
import 'package:horoscope/sign.dart';

class DailyReadingPage extends StatefulWidget {
  final Sign sign;
  static MaterialPageRoute route(Sign sign) => MaterialPageRoute(builder: (_) => DailyReadingPage(sign: sign));

  const DailyReadingPage({Key? key, required this.sign}) : super(key: key);

  @override
  _DailyReadingPageState createState() => _DailyReadingPageState();
}

class _DailyReadingPageState extends State<DailyReadingPage> {
  final _streamController = StreamController<String>();

  ///Fetches daily reading, retries if data is null
  Future _fetchData() async {
    final data = await OhmandaApi().getDailyHoroscope(widget.sign);
    if (data == null) {
      _streamController.sink.addError("An error occured, trying again...");
      await Future.delayed(Duration(milliseconds: 300));
      return await _fetchData();
    }
    return _streamController.sink.add(data);
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

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
            signEmoji(widget.sign),
            style: TextStyle(fontSize: 64),
          ),
          Text(
            signString(widget.sign),
            style: TextStyle(fontSize: 18),
          ),
          StreamBuilder<String>(
            stream: _streamController.stream,
            builder: (context, snapshot) {
              return Padding(
                padding: const EdgeInsets.all(36.0),
                child: Center(
                  child: snapshot.hasError
                      ? Text(snapshot.error.toString())
                      : snapshot.hasData
                          ? Text(snapshot.data ?? 'nothing')
                          : CircularProgressIndicator.adaptive(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
