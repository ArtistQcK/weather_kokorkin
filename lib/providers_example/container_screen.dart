import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_kokorkin/providers_example/color_provider.dart';

class ContainerPage extends StatelessWidget {
  const ContainerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ColorProvider>(
        builder: (BuildContext context, value, Widget? child) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              color: value.colorValue,
              child: Center(
                child: Text(
                  "Container",
                ),
              ),
            ),
            const SizedBox(
              height: 20,
              width: double.infinity,
            ),
            Switch(value: value.isSwitched
            , onChanged: (valueS) {
              value.changeSwitch(valueS);
            }),
          ],
        ),
      ),
    );
  }
}
