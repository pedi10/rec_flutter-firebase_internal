
<div align="center">
  <div style="background: linear-gradient(135deg, #007BFF 0%, #001F3F 100%); 
              padding: 40px 20px; 
              border-radius: 15px; 
              margin: 20px 0; 
              box-shadow: 0 10px 30px rgba(0,0,0,0.3);">
    <h1 style="color: white; 
               font-size: 2.5em; 
               font-weight: bold; 
               margin: 0; 
               text-shadow: 2px 2px 4px rgba(0,0,0,0.3); 
               letter-spacing: 1px;">
      Dashboard UI
    </h1>
    <h2 style="color: rgba(255,255,255,0.9); 
               font-size: 1.2em; 
               font-weight: 300; 
               margin: 10px 0 0 0; 
               text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      Part 1 - Cheat Sheet
    </h2>  </div>
</div>

---

## 📋 Table of Contents

| Step | Topic | Description |
|------|-------|-------------|
| [Step 1](#step-1-set-up-a-new-flutter-project) | **Project Setup** | Create a new Flutter project and configure dark theme |
| [Step 2](#step-2-clean-up-maindart-with-empty-scaffold) | **Clean Scaffold** | Remove default counter, set up StatefulWidget foundation |
| [Step 3](#step-3-add-column-and-empty-ui-functions) | **UI Structure** | Add Column layout and define empty UI component functions |
| [Step 4](#step-4-implement-greeting-text-and-add-padding) | **Greeting & Padding** | Create styled greeting text and add proper spacing |
| [Step 5](#step-5-implement-battery-card-with-variable) | **Battery Card** | Build battery status card with percentage display |
| [Step 6](#step-6-add-stack-to-battery-card) | **Visual Enhancement** | Add circular progress indicator with Stack layout |
| [Step 7](#step-7-add-temperature-card-with-fl_chart) | **Chart Integration** | Implement temperature visualization with fl_chart |

---

## Step 1: Set Up a New Flutter Project
Open Visual Studio Code, create a new Flutter project, run the app, and explore hot reload to understand dynamic updates. Configure the app to use a dark theme for the UI.  
- Checklist:
  - Go to `View` > `Command Palette` in VS Code.
  - Select `Flutter: New Project`.
  - Choose `Application`.
  - Select a folder and name the project.
  - Press `F5` to run the app once ready.

## Step 2: Clean Up main.dart with Empty Scaffold
Edit `main.dart` to remove the default counter example, setting up a `StatefulWidget` with an empty `Scaffold` as a foundation for building the UI.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'REC Robot Telemetry Demo App',
      theme: ThemeData.dark(),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
```

## Step 3: Add Column and Empty UI Functions
Modify `_MyHomePageState` to include a `Column` in the `Scaffold` body. Define empty `greetingText`, `batteryCard`, and `temperatureCard` functions outside `build` to structure UI components.

```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            // Greeting Text
            greetingText(),
            SizedBox(height: 16),

            // Battery Card
            batteryCard(),
            SizedBox(height: 16),

            // Temperature Card
            temperatureCard(),
            SizedBox(height: 16),
        ],
      ),
    );
  }

  // Greeting Text
  Widget greetingText() {
    return Container();
  }

  // Battery Card
  Widget batteryCard() {
    return Container();
  }

  // Temperature Card
  Widget temperatureCard() {
    return Container();
  }
}
```

## Step 4: Implement Greeting Text and Add Padding
Update the `greetingText` function to display a styled "Hi Ken!" text. Then wrap the `Column` in a `Padding` widget to add spacing around the UI.

**greetingText Function**:
```dart
Widget greetingText() {
  return Text(
    'Hi Ken!',
    style: TextStyle(fontSize: 18),
  );
}
```

**Scaffold with Padding**:
```dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting Text
            greetingText(),
            SizedBox(height: 16),

            // Battery Card
            batteryCard(),
            SizedBox(height: 16),

            // Temperature Card
            temperatureCard(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
```

## Step 5: Implement Battery Card with Variable
Define a `battery` variable above the `build` and update the `batteryCard` function to display a `Card` with a `Row` showing a title and battery percentage as text, setting up for a visual upgrade.

```dart
int battery = 85;

Widget batteryCard() {
  return Card(
    surfaceTintColor: Colors.blue,
    child: Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 25, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Robot Battery',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            '$battery%',
            style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}
```

## Step 6: Add Stack to Battery Card
Replace the battery percentage `Text` with a `Stack` containing a `CircularProgressIndicator` and `Text` to visualize the battery level. Update the `batteryCard` function. (Copy-paste to save time.)

**Stack Code**:
```dart
Stack(
  alignment: Alignment.center,
  children: [
    SizedBox(
      width: 70,
      height: 70,
      child: CircularProgressIndicator(
        value: battery / 100,
        color: Colors.white,
        strokeWidth: 6,
        backgroundColor: Colors.white.withOpacity(0.3),
      ),
    ),
    Text(
      '$battery%',
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  ],
)
```

**Updated batteryCard Function**:
```dart
Widget batteryCard() {
  return Card(
    surfaceTintColor: Colors.blue,
    child: Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 25, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Robot Battery',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 70,
                height: 70,
                child: CircularProgressIndicator(
                  value: battery / 100,
                  color: Colors.white,
                  strokeWidth: 6,
                  backgroundColor: Colors.white.withOpacity(0.3),
                ),
              ),
              Text(
                '$battery%',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
```

## Step 7: Add Temperature Card with fl_chart
Add the `fl_chart` package to `pubspec.yaml` to enable charting. Implement the temperature card with a line chart using provided data to visualize temperature trends. (Copy-paste to save time.)

**pubspec.yaml**:
```yaml
dependencies:
  flutter:
    sdk: flutter

  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^1.0.8
  fl_chart: ^1.0.0
```

**fl_chart Import**:
```dart
import 'package:fl_chart/fl_chart.dart';
```

**Temperature Data**:
```dart
List<FlSpot> temperatureData = [
  const FlSpot(0, 18),
  const FlSpot(2, 17),
  const FlSpot(4, 16),
  const FlSpot(6, 19),
  const FlSpot(8, 22),
  const FlSpot(10, 26),
  const FlSpot(12, 29),
  const FlSpot(14, 32),
  const FlSpot(16, 30),
  const FlSpot(18, 27),
  const FlSpot(20, 24),
  const FlSpot(22, 21),
  const FlSpot(24, 19),
];
```

**temperatureCard Function**:
```dart
Widget temperatureCard() {
  return Card(
    child: Container(
      height: 300,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Temperature',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 35),
          Expanded(
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: true, drawVerticalLine: false),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      interval: 2,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 5,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        return Text(
                          '${value.toInt()}°C',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        );
                      },
                      reservedSize: 42,
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: false,
                  border: Border.all(color: Colors.grey.withOpacity(0.3)),
                ),
                minX: 0,
                maxX: 24,
                minY: 15,
                maxY: 35,
                lineBarsData: [
                  LineChartBarData(
                    spots: temperatureData,
                    isCurved: true,
                    curveSmoothness: 0.3,
                    color: Theme.of(context).primaryColor,
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) {
                        return FlDotCirclePainter(
                          radius: 4,
                          color: Theme.of(context).primaryColor,
                          strokeWidth: 2,
                          strokeColor: Colors.white,
                        );
                      },
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
```
