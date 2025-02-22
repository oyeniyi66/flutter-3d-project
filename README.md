<<<<<<<<<<<<<<<<<<<<<<<<<<<<3D Avatar Interaction>>>>>>>>>>>>>>>>>>>>>>>>>>>>

Version 1.0.0 - Published February 2025

Contents
Overview
Features
Avatar Actions
Installation
Usage
FAQ
Notes


Overview:

This Flutter application allows users to interact with 3D avatars using the flutter_3d_controller package. Users can switch between various animations for male and female avatars, including jumping, running, walking, and dancing.
The app supports touch-based interactions, smooth animation transitions, and dynamic avatar loading. It is designed for both mobile and desktop platforms.

Features: Interactive 3D avatars (Male & Female)

Supports multiple animations:
Standing
Jumping
Running
Walking
Dancing


Independent avatar controls
Touch-based interaction for mobile
Error handling for avatar loading
Beautiful UI with a dark theme


Avatar Actions

The following actions are available for each avatar:

Male Avatar/
Standing
Walking
Running
Jumping
Dancing


Female Avatar/
Standing
Walking
Running
Jumping
Dancing


Installation

1. Clone the repository:  git clone https://github.com/oyeniyi66/flutter-3d-project.git

2. Navigate to the project directory: cd flutter-3d-avatar

3. Install dependencies: flutter pub get

4. Run the application: flutter run



Usage:

Click on action buttons to trigger animations.
Use the refresh button to reset avatars to the standing position.
Enjoy real-time 3D interaction with touch-enabled controls.


FAQ:

Are these animations preloaded?
Yes, the animations are preloaded as .glb files and dynamically swapped when an action is selected.
Can I use my own 3D models?
Yes! You can replace the assets/male/.glb and assets/female/.glb files with your own models.
What platforms does this app support?
This app runs on Android, iOS, Windows, macOS, and Linux.
Notes
Ensure that you have Git Large File Storage (LFS) installed for handling .glb files.
The flutter_3d_controller package is required for rendering 3D models.
The application is optimized for smooth rendering performance.




