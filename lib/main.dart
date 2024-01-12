import 'package:flutter/material.dart';
import 'all_package.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  constants = Constants();
  dioClient = DioClient();
  runApp(const MyApp());
}
  
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      constants.screenHeight = constrains.maxHeight;
      constants.screenWidth = constrains.maxWidth;
      return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      );
    });
  }
}
