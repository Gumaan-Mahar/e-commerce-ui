import 'dart:async';
import 'package:e_commerce_ui/src/themes/app_colors.dart';
import 'package:flutter/material.dart';

String formatCountdown(Duration duration) {
  final days = duration.inDays;
  final hours = duration.inHours.remainder(24);
  final minutes = duration.inMinutes.remainder(60);
  final seconds = duration.inSeconds.remainder(60);

  return '${days}d ${hours}h ${minutes}m ${seconds}s';
}

class CountdownWidget extends StatefulWidget {
  final int countdownHours;
  final String formattedCountdown;

  const CountdownWidget({
    Key? key,
    required this.countdownHours,
    required this.formattedCountdown,
  }) : super(key: key);

  @override
  CountdownWidgetState createState() => CountdownWidgetState();
}

class CountdownWidgetState extends State<CountdownWidget> {
  late Duration remainingTime;
  late String currentCountdown;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    remainingTime = Duration(hours: widget.countdownHours.toInt());
    currentCountdown = formatCountdown(remainingTime);

    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime.inSeconds > 0) {
        remainingTime -= const Duration(seconds: 1);
        currentCountdown = formatCountdown(remainingTime);
        if (mounted) {
          setState(() {});
        }
      } else {
        timer.cancel();
        // Reset the timer when it reaches zero
        remainingTime = Duration(hours: widget.countdownHours.toInt());
        currentCountdown = formatCountdown(remainingTime);
        if (mounted) {
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Ends in ",
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                inherit: true,
                color: AppColors.darkGreyShade,
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          currentCountdown,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                inherit: true,
                color: AppColors.darkGreyShade,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
