import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '3D Avatar Interaction',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false, // Removes the debug banner
      home: const AvatarScene(),
    );
  }
}

class AvatarScene extends StatefulWidget {
  const AvatarScene({super.key});

  @override
  State<AvatarScene> createState() => _AvatarSceneState();
}

class _AvatarSceneState extends State<AvatarScene> {
  final Flutter3DController maleController = Flutter3DController();
  final Flutter3DController femaleController = Flutter3DController();
  String maleAvatarSrc = 'assets/male/standing.glb';
  String femaleAvatarSrc = 'assets/female/standing.glb';

  void _setMaleAvatar(String action) {
    setState(() {
      if (action == 'Jumping') {
        maleAvatarSrc = 'assets/male/jumping.glb';
      } else if (action == 'Running') {
        maleAvatarSrc = 'assets/male/running.glb';
      } else if (action == 'Walking') {
        maleAvatarSrc = 'assets/male/walking.glb';
      } else if (action == 'Dancing') {
        maleAvatarSrc = 'assets/male/dancing.glb';
      } else {
        maleAvatarSrc = 'assets/male/standing.glb';
      }
    });
  }

  void _setFemaleAvatar(String action) {
    setState(() {
      if (action == 'Jumping') {
        femaleAvatarSrc = 'assets/female/jumping.glb';
      } else if (action == 'Running') {
        femaleAvatarSrc = 'assets/female/running.glb';
      } else if (action == 'Walking') {
        femaleAvatarSrc = 'assets/female/walking.glb';
      } else if (action == 'Dancing') {
        femaleAvatarSrc = 'assets/female/dancing.glb';
      } else {
        femaleAvatarSrc = 'assets/female/standing.glb';
      }
    });
  }

  // Reset both avatars to their standing position
  void _resetAvatars() {
    setState(() {
      maleAvatarSrc = 'assets/male/standing.glb';
      femaleAvatarSrc = 'assets/female/standing.glb';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '3D Avatar Interaction',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'Arial',
            color: Colors.deepPurpleAccent, // Beautiful color for the title
            shadows: [
              Shadow(
                blurRadius: 5.0,
                color: Colors.purpleAccent.withOpacity(0.5),
                offset: Offset(2.0, 2.0),
              ),
            ],
          ),
        ),
        centerTitle: true, // Centering the title for better presentation
        backgroundColor: Colors.black87, // Dark background for the AppBar
      ),
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                // Label for male avatar with "Start Over" button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Male Avatar',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.refresh),
                        onPressed: () => _setMaleAvatar('Standing'),
                        tooltip: 'Start Over',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Flutter3DViewer(
                    controller: maleController,
                    src: maleAvatarSrc,
                    enableTouch: true,
                    progressBarColor: Colors.orange,
                    onLoad: (String modelAddress) {
                      // Set the male avatar to standing position on load.
                      maleController.playAnimation(animationName: 'Stand');
                    },
                    onError: (String error) {
                      debugPrint('Male Avatar failed to load: $error');
                    },
                  ),
                ),
                // Action buttons for male avatar
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.directions_walk),
                      onPressed: () => _setMaleAvatar('Walking'),
                    ),
                    IconButton(
                      icon: const Icon(Icons.run_circle),
                      onPressed: () => _setMaleAvatar('Running'),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_upward),
                      onPressed: () => _setMaleAvatar('Jumping'),
                    ),
                    IconButton(
                      icon: const Icon(Icons.music_note),
                      onPressed: () => _setMaleAvatar('Dancing'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Divider between male and female avatars
          const VerticalDivider(
            color: Colors.white,
            width: 1,
            thickness: 2,
            indent: 10,
            endIndent: 10,
          ),
          Expanded(
            child: Column(
              children: [
                // Label for female avatar with "Start Over" button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Female Avatar',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Colors.pinkAccent,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.refresh),
                        onPressed: () => _setFemaleAvatar('Standing'),
                        tooltip: 'Start Over',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Flutter3DViewer(
                    controller: femaleController,
                    src: femaleAvatarSrc,
                    enableTouch: true,
                    progressBarColor: Colors.pink,
                    onLoad: (String modelAddress) {
                      // Set the female avatar to standing position on load.
                      femaleController.playAnimation(animationName: 'Stand');
                    },
                    onError: (String error) {
                      debugPrint('Female Avatar failed to load: $error');
                    },
                  ),
                ),
                // Action buttons for female avatar
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.directions_walk),
                      onPressed: () => _setFemaleAvatar('Walking'),
                    ),
                    IconButton(
                      icon: const Icon(Icons.run_circle),
                      onPressed: () => _setFemaleAvatar('Running'),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_upward),
                      onPressed: () => _setFemaleAvatar('Jumping'),
                    ),
                    IconButton(
                      icon: const Icon(Icons.music_note),
                      onPressed: () => _setFemaleAvatar('Dancing'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
