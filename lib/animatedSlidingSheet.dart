import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class AnimatedSlidingSheetOnLaunch extends StatefulWidget {
  @override
  _AnimatedSlidingSheetOnLaunchState createState() =>
      _AnimatedSlidingSheetOnLaunchState();
}

class _AnimatedSlidingSheetOnLaunchState
    extends State<AnimatedSlidingSheetOnLaunch> {
  late SheetController _sheetController;

  @override
  void initState() {
    super.initState();
    _sheetController = SheetController();

    // Trigger animation when the widget is first built
    Future.delayed(Duration(milliseconds: 300), () {
      _sheetController.expand();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sliding Sheet Animation on Launch"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SlidingSheet(
        controller: _sheetController,
        elevation: 8,
        cornerRadius: 16,
        snapSpec: const SnapSpec(
          snap: true,
          snappings: [0.1, 0.5, 0.9],
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        body: Center(
          child: Text(
            "Main Content Area",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
        builder: (context, state) {
          return Container(
            color: Colors.white,
            height: 300,
            child: Center(
              child: Text(
                "Sliding Sheet Content",
                style: TextStyle(fontSize: 18),
              ),
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSlidingSheetOnLaunch(),
    ),
  );
}
