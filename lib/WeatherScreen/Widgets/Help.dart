import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => HelpState();
}

class HelpState extends State<Help> {
  final Uri vk = Uri.parse('https://vk.com/qwaaantex');
  final Uri tg = Uri.parse('https://t.me/qwaaantex');
  final Uri more = Uri.parse('https://yandex.ru/pogoda/');
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(48), color: Colors.grey[850]),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Center(
            child: Text(
          "Как с нами связаться?",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.grey, fontSize: 24, fontWeight: FontWeight.bold),
        )),
        const Center(
            child: Text(
          "Все очень просто, для связи с нами можете использовать нашего сотрудника в телеграмме: @qwaaantex."
          " Также, нельзя забывать про суть вашей проблемы, если она распространенна, то лучше обратиться в источнике дополнительный информации, чем писать прямиком в Техническую Поддержку, поэтому"
          " пожалуйста, проверяйте актуальность каждой вашей ошибки или какого-либо сбоя, перед отправкой запроса в Техническую Поддержку, с просьбой помочь вам или решить вашу проблему!"
          " Мы очень надеемся, что смогли вам помочь!",
          textAlign: TextAlign.center,
          softWrap: true,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        )),
        const SizedBox(
          height: 10,
        ),
        Center(
            child: ElevatedButton(
                onPressed: () async {
                  if (!await launchUrl(tg)) {
                    throw Exception('Could not launch $tg');
                  }
                },
                style: ElevatedButton.styleFrom(
                    disabledBackgroundColor: Colors.blue,
                    backgroundColor: Colors.blue,
                    overlayColor: Colors.transparent,
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.95,
                        MediaQuery.of(context).size.height * 0.05)),
                child: const Text(
                  "Telegram",
                  style: TextStyle(color: Colors.white),
                ))),
        const SizedBox(
          height: 2,
        ),
        Center(
            child: ElevatedButton(
                onPressed: () async {
                  if (!await launchUrl(vk)) {
                    throw Exception('Could not launch $tg');
                  }
                },
                style: ElevatedButton.styleFrom(
                    disabledBackgroundColor: Colors.indigoAccent,
                    backgroundColor: Colors.indigoAccent,
                    overlayColor: Colors.transparent,
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.95,
                        MediaQuery.of(context).size.height * 0.05)),
                child: const Text(
                  "VK",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ))),
        TextButton(
            style: TextButton.styleFrom(overlayColor: Colors.transparent),
            onPressed: () async {
              if (!await launchUrl(more)) {
                throw Exception('Could not launch $tg');
              }
            },
            child: const Text(
              "Еще..",
              style: TextStyle(color: Colors.blue),
            ))
      ]),
    );
  }
}
