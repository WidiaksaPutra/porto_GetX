import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:month_year_picker/month_year_picker.dart';

class ExampleApp extends StatelessWidget {
  // ------------------------------- CONSTRUCTORS ------------------------------
  const ExampleApp({
    Key? key,
  }) : super(key: key);

  // --------------------------------- METHODS ---------------------------------
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Month Year Picker Example',
      home: MyHomePage(),
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        MonthYearPickerLocalizations.delegate,
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  // ------------------------------- CONSTRUCTORS ------------------------------
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  // --------------------------------- METHODS ---------------------------------
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime? _selected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Month Year Picker Example')),
      body: Row(
        children: [
          TextButton(
            child: (_selected == null) ? const Text('DEFAULT LOCALE') : Text(_selected.toString()),
            onPressed: () => _onPressed(context: context),
          ),
          TextButton(
            child: const Text('DEFAULT LOCALE2'),
            onPressed: () => _onPressed2(context: context),
          ),
        ],
      ),
    );
  }

  Future<void> _onPressed({
    required BuildContext context,
  }) async {
    final selected = await showMonthYearPicker(
      context: context,
      initialDate: _selected ?? DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 10),
      lastDate: DateTime.now(),
      locale: const Locale('in'),
    );
    if (selected != null) {
      setState(() {
        _selected = selected;
      });
    }
  }

  Future<void> _onPressed2({
    required BuildContext context,
  }) async {
    final selected = await showMonthYearPicker(
      context: context,
      initialDate: _selected ?? DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 10),
      lastDate: DateTime.now(),
      locale: Locale('in'),
    );
    if (selected != null) {
      setState(() {
        _selected = selected;
      });
      print(_selected);
    }
  }
}