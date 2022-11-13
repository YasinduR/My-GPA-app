
import 'package:flutter/material.dart';

ThemeMode THM = ThemeMode.dark;

ThemeMode toggleMode(THM) {
  ThemeMode NTHM = THM == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  return NTHM;
}





/*
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeModel>(
      create: (_) => ThemeModel(),
      child: Consumer<ThemeModel>(
        builder: (_, model, __) {
          ThemeModel y = model;
          return MaterialApp(
              theme: ThemeData.light(), // Provide light theme.
              darkTheme: ThemeData.dark(), // Provide dark theme.
              themeMode: model.mode, // Decides which theme to show.
              home: const MyHomePage(title: 'GPA Calculator',model:y)
              appBar: AppBar(title: Text('Light/Dark Theme'),model:model),
          body: ElevatedButton(
          onPressed: () => model.toggleMode(),
          child: Text('Toggle Theme'),
          ),
          ),
          );
        },
      ),
    );
  }
}

class ThemeModel with ChangeNotifier {
  ThemeMode _mode;
  ThemeMode get mode => _mode;
  ThemeModel({ThemeMode mode = ThemeMode.light}) : _mode = mode;

  void toggleMode() {
    _mode = _mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
*/

