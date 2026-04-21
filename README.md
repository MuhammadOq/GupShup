# GupShup - WhatsApp Clone

A complete, fully functional WhatsApp-clone app built with Flutter and Firebase.

## Features
- **Phone Auth**: Secure login via Firebase Phone Authentication.
- **Real-time Chat**: 1-to-1 and Group messaging with Firestore.
- **Voice & Video Calls**: Powered by Agora RTC SDK.
- **AI Integration**: Chat summaries and smart responses using Gemini AI.
- **Status/Stories**: Share photos and videos with contacts.
- **Push Notifications**: Integrated with OneSignal and FCM.
- **RTL Support**: Full support for Urdu (Nastaleeq font included).

## Tech Stack
- **Framework**: Flutter 3.x
- **State Management**: Riverpod 2.x
- **Navigation**: go_router
- **Backend**: Firebase (Auth, Firestore, Storage, Messaging)
- **RTC**: Agora RTC SDK
- **AI**: Google Gemini API
- **Notifications**: OneSignal

## Setup Instructions
1. **Firebase Setup**:
   - Create a new Firebase project.
   - Enable Phone Authentication.
   - Setup Firestore and Storage with the provided rules.
   - Add your `google-services.json` (Android) and `GoogleService-Info.plist` (iOS).

2. **API Keys**:
   - Update `lib/core/constants/app_constants.dart` with your:
     - Agora App ID
     - OneSignal App ID
     - Gemini API Key

3. **Dependencies**:
   ```bash
   flutter pub get
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Run the App**:
   ```bash
   flutter run
   ```

## Folder Structure
- `lib/core`: Themes, constants, router, and global widgets.
- `lib/features`: Feature-based modules (Auth, Chat, Call, etc.).
- `lib/models`: Freezed data models.
- `lib/providers`: Riverpod state providers.
- `lib/services`: External service integrations (Firebase, Agora, Gemini).
