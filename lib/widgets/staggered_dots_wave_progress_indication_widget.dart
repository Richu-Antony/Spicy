import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

// Stateful Main Widget
class StaggeredDotsWaveProgressIndicationWidget extends StatefulWidget {
  const StaggeredDotsWaveProgressIndicationWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<StaggeredDotsWaveProgressIndicationWidget> createState() =>
      _StaggeredDotsWaveProgressIndicationWidgetState();
}

// All Context Main Operations
class _StaggeredDotsWaveProgressIndicationWidgetState
    extends State<StaggeredDotsWaveProgressIndicationWidget> {
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    // Custom staggeredDotsWave Animation
    return ZoomIn(
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: isDarkMode ? Colors.white : Colors.black,
        size: size.height * .1,
      ),
    );

    //
  }
}
