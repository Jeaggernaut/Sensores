import 'package:flutter/material.dart';
import '../controllers/health_controller.dart';
import '../controllers/theme_controller.dart';
import 'fingerprint_page_view.dart';
import 'heart_rate_info_page_view.dart';

class HomePage extends StatefulWidget {
  final ThemeController themeController;
  final VoidCallback onThemeChanged;

  const HomePage({
    required this.themeController,
    required this.onThemeChanged,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final HealthController _healthController = HealthController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _updateHeartRate() {
    setState(() {
      _healthController.detectFingerprint();
    });
  }

  void _toggleTheme() {
    widget.themeController.toggleTheme();
    widget.onThemeChanged();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sistema Sensores'),
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Sistema Sensores',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: Icon(widget.themeController.isDarkMode ? Icons.dark_mode : Icons.light_mode),
              title: Text(widget.themeController.isDarkMode ? 'Modo Oscuro' : 'Modo Claro'),
              trailing: Switch(
                value: widget.themeController.isDarkMode,
                onChanged: (_) => _toggleTheme(),
              ),
              onTap: _toggleTheme,
            ),
          ],
        ),
      ),
      body: _selectedIndex == 0 
          ? FingerPrintPageView(
              controller: _healthController,
              onHeartRateChanged: _updateHeartRate,
            )
          : HeartRateInfoPageView(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.fingerprint),
            label: 'Huella',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Ritmo Cardiaco',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
