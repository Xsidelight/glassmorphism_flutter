import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const GlassmorphismApp()));
}
