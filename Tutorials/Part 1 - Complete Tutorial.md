
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
      🎓 Flutter Dashboard Tutorial
    </h1>
    <h2 style="color: rgba(255,255,255,0.9); 
               font-size: 1.2em; 
               font-weight: 300; 
               margin: 10px 0 0 0; 
               text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      Complete Step-by-Step Guide
    </h2>
  </div>
</div>

---

## 📖 What You'll Learn

By the end of this tutorial, you'll understand:
- **Flutter Project Structure** - How Flutter apps are organized and configured
- **Widget Composition** - Building UIs by combining smaller widgets
- **State Management** - Managing dynamic data in your app
- **Material Design** - Using Flutter's built-in design system
- **Custom Layouts** - Creating responsive layouts with Columns, Rows, and Stacks
- **Package Integration** - Adding third-party libraries to enhance functionality
- **Dark Theme Implementation** - Creating modern, professional-looking apps

---

## 📋 Table of Contents

| Step | Topic | Description | Duration |
|------|-------|-------------|----------|
| [Step 1](#step-1-understanding-flutter-project-setup) | **Project Setup** | Create and understand Flutter project structure | 10 min |
| [Step 2](#step-2-understanding-widgets-and-clean-architecture) | **Clean Architecture** | Learn about widgets and create a foundation | 8 min |
| [Step 3](#step-3-layout-fundamentals-with-columns-and-functions) | **Layout Basics** | Master Column layouts and widget organization | 7 min |
| [Step 4](#step-4-styling-and-spacing-fundamentals) | **Styling & Spacing** | Learn text styling and layout spacing | 8 min |
| [Step 5](#step-5-cards-and-state-management) | **Cards & State** | Understand Card widgets and state variables | 10 min |
| [Step 6](#step-6-advanced-layouts-with-stacks) | **Advanced Layouts** | Master Stack widgets for complex UIs | 12 min |
| [Step 7](#step-7-data-visualization-and-package-management) | **Data Visualization** | Integrate charts and manage dependencies | 15 min |

**Total Estimated Time**: 70 minutes

---

## Step 1: Understanding Flutter Project Setup

### 🎯 Learning Objectives
- Understand Flutter project structure
- Learn about the main.dart entry point
- Configure app-wide themes
- Experience hot reload development

### 📚 Theory: What is Flutter?

Flutter is Google's UI toolkit for building natively compiled applications. When you create a Flutter project, you're setting up a cross-platform codebase that can run on iOS, Android, web, and desktop from a single source.

**Key Concepts:**
- **Widgets**: Everything in Flutter is a widget - buttons, text, layouts, even your entire app
- **Hot Reload**: Save your code and see changes instantly without losing app state
- **Material Design**: Google's design system built into Flutter
- **Dart Language**: Flutter uses Dart, a modern programming language optimized for UI development

### 🛠️ Practical Implementation

**Step 1a: Create Your Project**
1. Open Visual Studio Code
2. Press `Ctrl+Shift+P` to open Command Palette
3. Type "Flutter: New Project" and select it
4. Choose "Application"
5. Select a folder and name your project (e.g., "robot_dashboard")
6. Wait for the project to be created

**Step 1b: Explore Project Structure**
```
lib/
  main.dart          ← Your app's entry point
pubspec.yaml         ← Project configuration and dependencies
android/             ← Android-specific code
ios/                 ← iOS-specific code
```

**Step 1c: Run Your App**
- Press `F5` to run the app
- You'll see the default Flutter counter app
- Try the hot reload: change some text and save (`Ctrl+S`)

### 🎨 Why Dark Theme?

Dark themes are popular because they:
- Reduce eye strain in low-light environments
- Look modern and professional
- Save battery on OLED screens
- Are preferred by many developers

---

## Step 2: Understanding Widgets and Clean Architecture

### 🎯 Learning Objectives
- Understand the widget tree concept
- Learn about StatefulWidget vs StatelessWidget
- Create a clean foundation for building UIs
- Understand the Scaffold widget

### 📚 Theory: The Widget Tree

Flutter builds UIs using a tree of widgets. Each widget describes part of the user interface:

```
MyApp (MaterialApp)
  └── MyHomePage (Scaffold)
      └── Body (Column)
          ├── Text Widget
          ├── Card Widget
          └── Chart Widget
```

**StatelessWidget vs StatefulWidget:**
- **StatelessWidget**: UI that doesn't change (like a label)
- **StatefulWidget**: UI that can change over time (like a counter)

### 🛠️ Practical Implementation

Let's replace the default counter app with our clean foundation:

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

### 📖 Code Explanation

**MaterialApp Widget:**
- Root widget that provides Material Design styling
- Handles navigation, themes, and localization
- `theme: ThemeData.dark()` applies dark theme globally

**Scaffold Widget:**
- Provides basic Material Design layout structure
- Handles app bars, drawers, floating action buttons
- Currently empty - we'll add content next

**Key Pattern:**
- `MyApp` is stateless (theme won't change)
- `MyHomePage` is stateful (will hold changing data like battery level)

### 🧪 Test It
Save the file and see your app reload with a blank dark screen. This is your clean foundation!

---

## Step 3: Layout Fundamentals with Columns and Functions

### 🎯 Learning Objectives
- Master Column widgets for vertical layouts
- Learn widget function organization
- Understand layout properties (alignment, spacing)
- Practice code organization patterns

### 📚 Theory: Layout Widgets

Flutter provides several layout widgets:
- **Column**: Arranges children vertically
- **Row**: Arranges children horizontally  
- **Stack**: Overlays children on top of each other
- **Container**: Single-child layout widget with styling options

**Column Properties:**
- `mainAxisAlignment`: How children align along the vertical axis
- `crossAxisAlignment`: How children align along the horizontal axis
- `children`: List of child widgets

### 🛠️ Practical Implementation

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

### 📖 Code Explanation

**Column Layout:**
- `mainAxisAlignment: MainAxisAlignment.start`: Children start at the top
- `crossAxisAlignment: CrossAxisAlignment.start`: Children align to the left
- `children`: List containing our UI components

**SizedBox Widget:**
- Creates empty space between widgets
- `SizedBox(height: 16)` adds 16 pixels of vertical spacing

**Function Organization:**
- Each UI component is a separate function returning a Widget
- This makes code readable and reusable
- Functions are currently returning empty `Container()` widgets

**Why This Pattern?**
- **Separation of Concerns**: Each function handles one UI component
- **Readability**: Easy to understand what each part does
- **Maintainability**: Easy to modify individual components
- **Reusability**: Functions can be called multiple times if needed

### 🧪 Test It
Your app still shows a blank screen, but the structure is now in place for adding content.

---

## Step 4: Styling and Spacing Fundamentals

### 🎯 Learning Objectives
- Learn Text widget styling
- Understand Padding widgets
- Master spacing and layout techniques
- Apply consistent design patterns

### 📚 Theory: Styling in Flutter

Flutter provides rich styling options:

**Text Styling:**
- `fontSize`: Size of the text
- `fontWeight`: Boldness of the text
- `color`: Text color
- `letterSpacing`: Space between letters

**Spacing Widgets:**
- `Padding`: Adds space around a widget
- `Margin`: Space outside a widget (via Container)
- `SizedBox`: Creates empty space

### 🛠️ Practical Implementation

**Update the greetingText function:**
```dart
Widget greetingText() {
  return Text(
    'Hi Ken!',
    style: TextStyle(fontSize: 18),
  );
}
```

**Add Padding to the entire layout:**
```dart
Scaffold(
  body: Padding(
    padding: EdgeInsets.all(25),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        greetingText(),
        SizedBox(height: 16),
        batteryCard(),
        SizedBox(height: 16),
        temperatureCard(),
        SizedBox(height: 16),
      ],
    ),
  ),
)
```

### 📖 Code Explanation

**Text Styling:**
- `TextStyle(fontSize: 18)`: Makes text larger and more readable
- Text automatically uses the theme's color (white in dark theme)

**Padding Widget:**
- `EdgeInsets.all(25)`: Adds 25 pixels of space on all sides
- Prevents content from touching screen edges
- Creates breathing room for better visual hierarchy

**Layout Hierarchy:**
```
Scaffold
  └── Padding (25px all around)
      └── Column (vertical layout)
          ├── Text "Hi Ken!"
          ├── SizedBox (16px spacing)
          ├── Empty Container (future battery card)
          ├── SizedBox (16px spacing)
          └── Empty Container (future temperature card)
```

### 🎨 Design Principles Applied
- **Consistency**: Same spacing (16px) between all elements
- **Breathing Room**: Padding prevents cramped layout
- **Visual Hierarchy**: Text size indicates importance
- **Dark Theme**: Automatic white text on dark background

### 🧪 Test It
Save and see "Hi Ken!" appear in the top-left corner with proper spacing from the screen edge.

---

## Step 5: Cards and State Management

### 🎯 Learning Objectives
- Understand state variables in Flutter
- Learn Card widget for grouped content
- Master Row layouts for horizontal content
- Implement dynamic data display

### 📚 Theory: State Management

State represents data that can change over time. In Flutter:
- **State variables**: Store changing data (like battery level)
- **setState()**: Tells Flutter to rebuild the UI when data changes
- **Widget rebuilding**: Flutter automatically updates the UI when state changes

**Card Widget Benefits:**
- Groups related content together
- Provides Material Design elevation (shadow)
- Consistent styling across the app
- Built-in padding and margin handling

### 🛠️ Practical Implementation

**Add state variable above the build method:**
```dart
class _MyHomePageState extends State<MyHomePage> {
  int battery = 85;  // This can change over time

  @override
  Widget build(BuildContext context) {
    // ... existing code
  }
```

**Implement the batteryCard function:**
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

### 📖 Code Explanation

**State Variable:**
- `int battery = 85;`: Stores the current battery percentage
- Can be updated later with `setState(() => battery = newValue)`
- Placed at class level so all methods can access it

**Card Widget:**
- `surfaceTintColor: Colors.blue`: Gives the card a blue tint
- Material Design elevation creates subtle shadow
- Contains all related battery information

**Row Layout:**
- `mainAxisAlignment: MainAxisAlignment.spaceBetween`: Spreads children apart
- `crossAxisAlignment: CrossAxisAlignment.center`: Centers children vertically
- Perfect for label-value pairs

**Padding Breakdown:**
- `EdgeInsets.fromLTRB(16, 16, 25, 16)`: Left, Top, Right, Bottom padding
- Extra right padding (25) balances the large percentage text

**Text Styling:**
- Title: `fontSize: 18, fontWeight: FontWeight.bold`
- Percentage: `fontSize: 42, fontWeight: FontWeight.bold`
- String interpolation: `'$battery%'` displays the variable value

### 🎨 UI Layout Analysis
```
Card (blue tint, shadow)
  └── Padding (16,16,25,16)
      └── Row (space between children)
          ├── Text "Robot Battery" (18px, bold)
          └── Text "85%" (42px, bold)
```

### 🧪 Test It
You should see a blue-tinted card with "Robot Battery" on the left and "85%" on the right in large text.

---

## Step 6: Advanced Layouts with Stacks

### 🎯 Learning Objectives
- Master Stack widgets for overlapping content
- Understand CircularProgressIndicator
- Learn advanced positioning techniques
- Create visually appealing progress displays

### 📚 Theory: Stack Widgets

Stack allows you to overlay widgets on top of each other:
- **Positioned widgets**: Children can be placed at specific locations
- **Alignment**: Control how children align within the stack
- **Z-order**: Later children appear on top of earlier ones

**CircularProgressIndicator:**
- Shows progress as a circular arc
- `value`: Progress from 0.0 to 1.0 (null for indeterminate)
- `color`: Color of the progress arc
- `backgroundColor`: Color of the unfilled portion
- `strokeWidth`: Thickness of the progress line

### 🛠️ Practical Implementation

**Replace the percentage Text with a Stack:**
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

### 📖 Code Explanation

**Stack Layout:**
- `alignment: Alignment.center`: Centers all children in the stack
- Two children: CircularProgressIndicator (bottom) and Text (top)

**SizedBox Wrapper:**
- `width: 70, height: 70`: Constrains the progress indicator size
- Without this, the indicator might be too large

**CircularProgressIndicator Properties:**
- `value: battery / 100`: Converts 85 to 0.85 (85% progress)
- `color: Colors.white`: Progress arc is white
- `strokeWidth: 6`: Makes the arc thicker and more visible
- `backgroundColor: Colors.white.withOpacity(0.3)`: Semi-transparent background

**Overlay Text:**
- `fontSize: 14`: Smaller than before to fit inside the circle
- `color: Colors.white`: Matches the progress indicator
- Positioned in center of the circular indicator

### 🎨 Visual Design Analysis

The Stack creates a layered effect:
1. **Bottom Layer**: Circular progress track (semi-transparent white)
2. **Middle Layer**: Progress arc (solid white, 85% complete)
3. **Top Layer**: "85%" text (centered, white)

This creates a professional-looking battery indicator that's both functional and visually appealing.

### 🔄 Dynamic Behavior

To test the dynamic nature, you could temporarily add a button to change the battery value:
```dart
// Temporary test - you can add this inside the Column
ElevatedButton(
  onPressed: () {
    setState(() {
      battery = battery > 10 ? battery - 10 : 100;
    });
  },
  child: Text('Test Battery'),
)
```

### 🧪 Test It
You should see a circular progress indicator showing 85% completion with the percentage text centered inside.

---

## Step 7: Data Visualization and Package Management

### 🎯 Learning Objectives
- Understand Flutter package management
- Learn data visualization with charts
- Master complex widget hierarchies
- Implement professional data displays

### 📚 Theory: Package Management

Flutter uses `pubspec.yaml` for dependency management:
- **Dependencies**: External packages your app uses
- **Version constraints**: Specify which package versions are compatible
- **pub get**: Downloads and installs packages

**fl_chart Package:**
- Popular Flutter charting library
- Supports line charts, bar charts, pie charts
- Highly customizable and performant
- Material Design compatible

### 🛠️ Practical Implementation

**Step 7a: Add the Package**

Edit `pubspec.yaml`:
```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  fl_chart: ^1.0.0  # Add this line
```

**Step 7b: Install the Package**
Run in terminal: `flutter pub get`

**Step 7c: Import and Add Data**

Add import at the top of `main.dart`:
```dart
import 'package:fl_chart/fl_chart.dart';
```

Add temperature data as a class variable:
```dart
class _MyHomePageState extends State<MyHomePage> {
  int battery = 85;
  
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

**Step 7d: Implement Temperature Card**

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

### 📖 Code Explanation

**Data Structure:**
- `FlSpot(x, y)`: Represents a point on the chart
- X-axis: Hours (0-24)
- Y-axis: Temperature in Celsius (15-35)

**Chart Configuration:**
- `gridData`: Shows horizontal grid lines only
- `titlesData`: Configures axis labels and titles
- `borderData`: Removes chart border for cleaner look
- `minX/maxX/minY/maxY`: Sets chart boundaries

**Line Styling:**
- `isCurved: true`: Smooth curved line instead of straight segments
- `curveSmoothness: 0.3`: Controls how curved the line is
- `color: Theme.of(context).primaryColor`: Uses app's primary color
- `barWidth: 3`: Line thickness

**Visual Enhancements:**
- `dotData`: Shows data points as circles
- `belowBarData`: Fills area under the line with semi-transparent color
- `isStrokeCapRound: true`: Rounded line ends

**Widget Hierarchy:**
```
Card
  └── Container (300px height, 16px padding)
      └── Column
          ├── Text "Temperature" (title)
          ├── SizedBox (35px spacing)
          └── Expanded (fills remaining space)
              └── LineChart (complex chart widget)
```

### 🎨 Professional Chart Features

This implementation includes:
- **Responsive scaling**: Chart adapts to available space
- **Interactive tooltips**: Touch points to see values
- **Smooth animations**: Chart animates when data changes
- **Accessibility**: Screen reader compatible
- **Theme integration**: Colors match app theme

### 🧪 Test It
You should see a professional-looking temperature chart showing a daily temperature cycle from 6 AM to 6 AM the next day.

---

## 🎉 Congratulations!

You've built a complete Flutter dashboard with:
- ✅ **Project setup and configuration**
- ✅ **Widget composition and layout**
- ✅ **State management**
- ✅ **Custom styling and theming**
- ✅ **Complex layouts with Stacks**
- ✅ **Data visualization with charts**
- ✅ **Package management**
