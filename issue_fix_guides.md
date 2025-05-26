<div align="center">
  <div style="background: linear-gradient(135deg, #DC143C 0%, #B22222 100%); 
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
      🚨 Issue Fix Guide
    </h1>
    <h2 style="color: rgba(255,255,255,0.9); 
               font-size: 1.2em; 
               font-weight: 300; 
               margin: 10px 0 0 0; 
               text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      Facilitator's Troubleshooting Guide
    </h2>
  </div>
</div>

---

## 📋 Common Issues Index

| Issue Category | Problem | Quick Fix |
|----------------|---------|-----------|
| [Flutter Setup](#flutter-setup-issues) | SDK/Environment Issues | Flutter clean & dependencies |
| [Project Creation](#project-creation-issues) | Project won't start | Device/simulator setup |
| [Dependencies](#dependency-issues) | Package/Import errors | Pub get & version conflicts |
| [Firebase Setup](#firebase-setup-issues) | Firebase CLI/Config issues | Authentication & project setup |
| [Database Issues](#database-issues) | Firestore/Realtime DB errors | Rules & initialization |
| [Maps Integration](#maps-integration-issues) | Google Maps not loading | API keys & permissions |
| [Build/Deploy](#builddeploy-issues) | Compilation/hosting errors | Build configuration |

---

## 🛠️ Flutter Setup Issues

### ❌ Problem: "Flutter SDK not found" or "dart command not found"
**Symptoms:**
- VS Code shows "Flutter SDK not found"
- Terminal commands like `flutter doctor` fail
- Project creation fails

**✅ Solution:**
```powershell
# Check Flutter installation
flutter doctor -v

# If Flutter not found, reinstall or fix PATH
# On Windows, ensure Flutter is in system PATH
# Restart VS Code after PATH changes
```

**Prevention:**
- Always run `flutter doctor` before workshop
- Have Flutter installation guide ready as backup

---

### ❌ Problem: "No devices available" or simulator issues
**Symptoms:**
- `flutter devices` shows empty list
- Cannot run project with F5
- "No supported devices connected"

**✅ Solution:**
```powershell
# For Windows - Enable Windows developer mode
# For web development (recommended for workshop)
flutter config --enable-web
flutter devices

# If using Chrome
flutter run -d chrome
```

**Prevention:**
- Pre-configure web development: `flutter config --enable-web`
- Test Chrome browser compatibility before workshop

---

## 📦 Dependency Issues

### ❌ Problem: "Package not found" or import errors
**Symptoms:**
- Red underlines on import statements
- `flutter pub get` fails
- Dependencies not resolving

**✅ Solution:**
```powershell
# Clean and rebuild dependencies
flutter clean
flutter pub get

# If still failing, check pubspec.yaml syntax
flutter pub deps
```

**Common fixes:**
- Check `pubspec.yaml` indentation (use spaces, not tabs)
- Verify package names are spelled correctly
- Ensure compatible package versions

---

### ❌ Problem: "Version solving failed" or dependency conflicts
**Symptoms:**
- Conflicting package versions
- Cannot add new packages
- Build fails with version errors

**✅ Solution:**
```powershell
# Remove pubspec.lock and retry
Remove-Item pubspec.lock
flutter pub get

# If persistent, check package compatibility
flutter pub deps
```

**Workshop-specific packages:**
```yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^2.24.2
  cloud_firestore: ^4.13.6
  fl_chart: ^1.0.0
  google_maps_flutter: ^2.5.0
```

---

## 🔥 Firebase Setup Issues

### ❌ Problem: "Firebase CLI not installed" or authentication fails
**Symptoms:**
- `flutterfire configure` command not found
- Cannot authenticate with Firebase
- Project configuration fails

**✅ Solution:**
```powershell
# Install Firebase CLI globally
npm install -g firebase-tools

# Login to Firebase (opens browser)
firebase login

# Install FlutterFire CLI
dart pub global activate flutterfire_cli

# Configure project
flutterfire configure --project=YOUR_PROJECT_ID
```

**Alternative for workshop:**
- Use pre-configured `firebase_options.dart` file
- Provide backup configuration files

---

### ❌ Problem: "Firebase project not found" or wrong project selected
**Symptoms:**
- Firebase commands reference wrong project
- Data not appearing in console
- Authentication errors

**✅ Solution:**
```powershell
# List available projects
firebase projects:list

# Switch to correct project
firebase use YOUR_PROJECT_ID

# Reconfigure FlutterFire
flutterfire configure --project=YOUR_PROJECT_ID
```

**Prevention:**
- Double-check project ID before running scripts
- Keep project ID list handy for participants

---

## 🗄️ Database Issues

### ❌ Problem: "Permission denied" or Firestore rules blocking access
**Symptoms:**
- Data not loading from Firestore
- "Missing or insufficient permissions" error
- Read/write operations fail

**✅ Solution:**
**In Firebase Console:**
1. Go to Firestore Database → Rules
2. Set test mode rules:
```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if true;
    }
  }
}
```
3. Click "Publish"

**⚠️ Warning:** Only use test mode rules for workshop. Never in production!

---

### ❌ Problem: Realtime Database not receiving updates
**Symptoms:**
- Control page not responding
- Data not syncing in real-time
- Connection errors

**✅ Solution:**
**In Firebase Console:**
1. Go to Realtime Database → Rules
2. Set rules for development:
```json
{
  "rules": {
    ".read": true,
    ".write": true
  }
}
```
3. Check database URL in code matches console

**Code verification:**
```dart
// Ensure correct database URL format
final DatabaseReference _database = FirebaseDatabase.instanceFor(
  app: Firebase.app(),
  databaseURL: 'https://YOUR-PROJECT-ID-default-rtdb.firebaseio.com/'
).ref();
```

---

## 🗺️ Maps Integration Issues

### ❌ Problem: Google Maps not loading or showing gray screen
**Symptoms:**
- Map shows gray/blank area
- "Failed to load map" error
- API key errors in console

**✅ Solution:**
1. **Enable Maps JavaScript API** in Google Cloud Console
2. **Get API key:**
   - Go to Google Cloud Console
   - APIs & Services → Credentials
   - Create or copy existing API key
3. **Add to `web/index.html`:**
```html
<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY"></script>
```

**Quick fix for workshop:**
- Provide working API key
- Use backup HTML file with pre-configured scripts

---

### ❌ Problem: "This page can't load Google Maps correctly"
**Symptoms:**
- API billing error message
- Maps quota exceeded
- Repeated API calls

**✅ Solution:**
- Check Google Cloud Console billing
- Verify API quotas and limits
- Restart browser to clear cache

**Workshop backup:**
- Have multiple API keys ready
- Use static map images as fallback

---

## 🚀 Build/Deploy Issues

### ❌ Problem: "Flutter build web" fails or incomplete build
**Symptoms:**
- Build process stops with errors
- Missing files in build output
- White screen on deployed app

**✅ Solution:**
```powershell
# Clean build and retry
flutter clean
flutter pub get
flutter build web --release

# Check for specific errors
flutter build web --verbose
```

**Common fixes:**
- Ensure web support is enabled: `flutter config --enable-web`
- Check `web/index.html` has all required scripts
- Verify no import errors in code

---

### ❌ Problem: Firebase deployment fails or 404 errors
**Symptoms:**
- `firebase deploy` command fails
- Deployed app shows 404
- Hosting not updating

**✅ Solution:**
```powershell
# Initialize hosting properly
firebase init hosting

# Ensure correct build directory
# In firebase.json, set: "public": "build/web"

# Build and deploy
flutter build web
firebase deploy --only hosting
```

**Common mistakes:**
- Wrong public directory in `firebase.json`
- Not building before deploying
- Incorrect project selected

---

## 🎯 Quick Diagnosis Commands

### Emergency Flutter Reset
```powershell
# Nuclear option - clean everything
flutter clean
flutter pub get
```

### Environment Check
```powershell
# Comprehensive environment check
flutter doctor -v
flutter config
flutter devices
firebase --version
dart --version
```