import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:provider/provider.dart';

import '../Providers/control_provider.dart';
import 'custom_painter.dart';

class TimeAndSTar extends StatelessWidget {
  const TimeAndSTar({
    super.key,
    required this.controlindex,
  });

  final int controlindex;

  @override
  Widget build(BuildContext context) {
    final controlProvider = Provider.of<ControlProvider>(context);
    return Padding(
        padding: controlindex == 0
            ? const EdgeInsets.only(bottom: 100)
            : const EdgeInsets.only(bottom: 70),
        child: controlindex == 0
            ? SizedBox(
                width: 180,
                height: 60,
                child: ElevatedButton(
                  child: const Text(
                    "Start",
                    style: TextStyle(fontSize: 30),
                  ),
                  onPressed: () {
                    controlProvider.changebuttomindex(1);
                  },
                ),
              )
            : controlProvider.resultado == ""
                ? const CustomTimer()
                : GestureDetector(
                    onTap: () {
                      controlProvider.resetgame();
                    },
                    child: const Icon(
                      Icons.restart_alt_rounded,
                      color: Colors.white,
                      size: 80,
                    ),
                  ));
  }
}

class CustomTimer extends StatefulWidget {
  const CustomTimer({
    super.key,
  });

  @override
  State<CustomTimer> createState() => _CustomTimerState();
}

class _CustomTimerState extends State<CustomTimer> {
  @override
  Widget build(BuildContext context) {
    final controlProvider = Provider.of<ControlProvider>(context);

    return CountdownTimer(
        widgetBuilder: (_, time) {
          if (time != null) {
            return Circletimer(
              timer: time.sec.toString(),
              time: time.sec!.toDouble(),
            );
          } else {
            return const Circletimer(
              timer: "0",
            );
          }
        },
        endTime: controlProvider.endTime,
        onEnd: () {
          controlProvider.resettimer();
        }
        // style: const TextStyle(color: Colors.white, fontSize: 45),
        );
  }
}

class Circletimer extends StatelessWidget {
  const Circletimer({
    super.key,
    required this.timer,
    this.time,
  });

  final String timer;
  final double? time;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration:
          const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
      child: Center(
        child: Stack(
          children: [
            CustomPaint(
              painter: CircularProgressPainter(
                  progress: time != null ? time! * 3.33 : 0),
              child: Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                    color: Colors.red, shape: BoxShape.circle),
                child: Center(
                  child: Text(timer,
                      style:
                          const TextStyle(fontSize: 45, color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
