import 'package:app/src/Widgets/rotation_animation_icon.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late Future<bool> _loadingFuture = _loadData();
  final FlutterSecureStorage storage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _loadingFuture = _loadData();
  }

  Future<bool> _loadData() async {
    String? key = await storage.read(key: "user_auth");
    if (key == "True") {
      return true;
    }
    else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: _loadingFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RotationAnimationIcon(),
                  Text(
                    "Gamer`s Brew",
                    style: GoogleFonts.spaceGrotesk(
                      textStyle: TextStyle(fontSize: 80, color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            Center(
              child: Text(
                "Ошибка загрузки",
                style: GoogleFonts.spaceGrotesk(
                  textStyle: TextStyle(fontSize: 80, color: Colors.white),
                ),
              ),
            );
          } else {
            if (snapshot.data == true) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).pushReplacementNamed("/main");
              });
            } else {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).pushReplacementNamed("/authorization");
              });
            }
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RotationAnimationIcon(),
                Text(
                  "Gamer`s Brew",
                  style: GoogleFonts.spaceGrotesk(
                    textStyle: TextStyle(fontSize: 80, color: Colors.white),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
