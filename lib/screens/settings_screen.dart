import 'package:flutter/material.dart';
import '../services/preferences_service.dart';

class SettingsScreen extends StatefulWidget {
  final Function(String) onSortChange;
  final String currentSort;
  final Function(bool) toggleTheme;

  SettingsScreen({
    required this.onSortChange,
    required this.currentSort,
    required this.toggleTheme,
  });

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late String _sortBy;
  bool _isDarkMode = false;
  final PreferencesService _prefsService = PreferencesService();

  @override
  void initState() {
    super.initState();
    _sortBy = widget.currentSort;
    _loadPreferences();
  }

  _loadPreferences() async {
    final isDarkMode = await _prefsService.getThemePreference();
    setState(() {
      _isDarkMode = isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sort books by:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              value: _sortBy,
              items: ['title', 'author', 'rating'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value.capitalize()),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _sortBy = newValue;
                  });
                  widget.onSortChange(newValue);
                  _prefsService.setSortPreference(newValue);
                }
              },
            ),
            SwitchListTile(
              title: Text('Dark Mode'),
              value: _isDarkMode,
              activeColor: Theme.of(context).colorScheme.secondary,
              onChanged: (bool value) {
                setState(() {
                  _isDarkMode = value;
                });
                _prefsService.setThemePreference(value);
                widget.toggleTheme(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}


