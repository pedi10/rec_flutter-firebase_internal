
<div align="center">
  <div style="background: linear-gradient(135deg, #FF6B35 0%, #F7931E 100%); 
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
      🔥 Firebase Integration
    </h1>
    <h2 style="color: rgba(255,255,255,0.9); 
               font-size: 1.2em; 
               font-weight: 300; 
               margin: 10px 0 0 0; 
               text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      Part 2 - Cheat Sheet
    </h2>
  </div>
</div>

---

## 📋 Table of Contents

| Step | Topic | Description |
|------|-------|-------------|
| [Step 1](#step-1-create-firebase-project) | **Firebase Setup** | Create Firebase project in console |
| [Step 2](#step-2-integrate-firebase-with-script) | **Integration** | Use FlutterFire CLI to configure and download files |
| [Step 3](#step-3-firestore-database-setup) | **Firestore** | Set up Cloud Firestore and implement data fetching |
| [Step 4](#step-4-realtime-database-setup) | **Realtime DB** | Configure Realtime Database for control features |
| [Step 5](#step-5-google-maps-integration) | **Google Maps** | Implement interactive map with location services |
| [Step 6](#step-6-deployment) | **Deploy** | Deploy app to Firebase Hosting |

---

## Step 1: Create Firebase Project

Create a new Firebase project from the Firebase Console to host your app's backend services.

**Console Setup**:
1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Create a project"
3. Enter your project name
4. Disable Google Analytics
5. Click "Create project"

---

## Step 2: Integrate Firebase with Script

**Replace PROJECT_ID and run this script**:

```bash
# Firebase setup - REPLACE "PROJECT_ID" with your actual project ID
dart pub global activate flutterfire_cli && 
flutterfire configure --project=PROJECT_ID && 
flutter pub add firebase_core cloud_firestore google_maps_flutter && 
flutterfire configure

# Download all files (Works on Windows, macOS, and Linux)
curl -o lib/main.dart "https://raw.githubusercontent.com/pedi10/umee_rec_flutter-firebase_internal/main/Final%20Codes/main.dart" && 
curl -o lib/config.dart "https://raw.githubusercontent.com/pedi10/umee_rec_flutter-firebase_internal/main/Final%20Codes/config.dart" && 
curl -o lib/control.dart "https://raw.githubusercontent.com/pedi10/umee_rec_flutter-firebase_internal/main/Final%20Codes/control.dart" && 
curl -o lib/dashboard_firestore.dart "https://raw.githubusercontent.com/pedi10/umee_rec_flutter-firebase_internal/main/Final%20Codes/dashboard_firestore.dart" && 
curl -o lib/map_page.dart "https://raw.githubusercontent.com/pedi10/umee_rec_flutter-firebase_internal/main/Final%20Codes/map_page.dart" && 
curl -o web/index.html "https://raw.githubusercontent.com/pedi10/umee_rec_flutter-firebase_internal/main/Final%20Codes/index.html"
```

**Verification**:
- Check `pubspec.yaml` for new dependencies
- Verify `firebase_options.dart` was created
- Confirm `web/index.html` has Firebase and Maps scripts
---

## Step 3: Firestore Database Setup

**Firebase Console Setup**:
1. In Firebase Console, go to **"Firestore Database"**
2. Click **"Create database"**
3. **Start in test mode** (for development)
4. Choose location: `us-central1` (or closest to you)
5. Click **"Done"**
6. Create collection: `robots`

**Verification**:
- Temperature chart updates by refresh button
- Battery level displays live data
- Button randomize battery level in firestore

---

## Step 4: Realtime Database Setup

**Firebase Console Setup**:
1. In Firebase Console, go to **"Realtime Database"**
2. Click **"Create Database"**
3. **Start in test mode**
4. Choose location: `us-central1`
5. Click **"Done"**

**Verification**:
- Realtime database responds to input changes

---

## Step 5: Google Maps Integration

**Enable Maps API**:
1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Select your Firebase project
3. Go to **"APIs & Services" > "Library"**
4. Search and enable **"Maps JavaScript API"**
5. Go to **"Credentials"** and copy API key

---

## Step 6: Deployment

**Deploy to Firebase Hosting**:

```bash
# Build and deploy in one command
flutter build web && firebase init hosting && firebase deploy
```

**Manual Setup**:
1. Run `firebase init hosting`
2. Select existing project
3. Set public directory: `build/web`
4. Configure as single-page app: **Yes**
5. Set up automatic builds: **No**
6. Run `flutter build web`
7. Run `firebase deploy`

**Verification**:
- Visit your live app URL
- Test all features work online
---


🚀 **Congratulations!** You've built a Flutter app with Firebase!
