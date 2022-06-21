import 'package:dark_theme/theme/theme_controller.dart';
import 'package:dark_theme/theme/theme_manager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    // TODO: implement initState
    super.initState();
  }

  themeListener(){
    if(mounted){
      setState((){

      });
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Dark Theme"),
          centerTitle: true,
          actions: [Switch(value: _themeManager.themeMode == ThemeMode.dark, onChanged: (newValue){
            _themeManager.toggleTheme(newValue);
          })],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Dark Theme App")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
