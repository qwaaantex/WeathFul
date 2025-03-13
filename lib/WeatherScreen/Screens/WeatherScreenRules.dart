import 'package:flutter/material.dart';

class WeatherScreenRules extends StatefulWidget {
  const WeatherScreenRules({super.key});

  @override
  State<StatefulWidget> createState() => WeatherScreenRulesState();
}

class WeatherScreenRulesState extends State<WeatherScreenRules> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
      ),
      body: Text("fkfflfl"),
    );
  }
}
