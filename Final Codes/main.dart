// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rec_complete_app/firebase_options.dart';
import 'dashboard_firestore.dart';
import 'dashboard.dart';
import 'map_page.dart';
import 'control.dart';
import 'config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Set the title of the app
      title: 'REC Robot Telemetry Demo App',

      // Use the dark theme for the app
      theme: ThemeData.dark(),

      // Define the Customized Dark theme
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1C1C1E),
        cardTheme: CardThemeData(
          color: const Color(0xFF2C2C30),
          surfaceTintColor: const Color(0xFF2C2C30),
          elevation: 3,
        ),
        primaryColor: const Color(0xFF007BFF),
        textTheme: ThemeData.dark().textTheme.copyWith(
          headlineLarge: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),

      // Disable the debug banner in the top right corner
      debugShowCheckedModeBanner: false,

      // Set the home page of the app
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Define the current index for the bottom navigation bar
  int currentIndex = 0;

  // List of screens to display based on the bottom navigation bar index
  final List<Widget> screens = [
    const DashboardScreen(),
    //const Dashboard(),
    const ControlScreen(),
    const MapPage(),
    const ConfigScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Display the current screen based on the selected bottom navigation index
      body: screens[currentIndex],

      // Create a custom bottom navigation bar with rounded corners
      bottomNavigationBar: Container(
        // Add margin around the navigation bar
        margin: const EdgeInsets.all(16),

        // Style the container with rounded corners and theme-based color
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Theme.of(context).cardColor,
        ),

        child: ClipRRect(
          // Clip the container to have rounded corners
          borderRadius: BorderRadius.circular(50),
          child: BottomNavigationBar(
            // Use fixed type to show all tabs equally
            type: BottomNavigationBarType.fixed,

            // Make background transparent to show container decoration
            backgroundColor: Colors.transparent,
            elevation: 3,

            // Track which tab is currently selected
            currentIndex: currentIndex,

            // Style selected and unselected items
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),

            // Handle tab selection - update current index and rebuild UI
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },

            // Define the navigation tabs with icons and labels
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.gamepad),
                label: 'Control',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Config',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
