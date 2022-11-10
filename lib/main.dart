import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agora Video Call Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyVideoCallPage(),
    );
  }
}

class MyVideoCallPage extends StatefulWidget {
  const MyVideoCallPage({Key? key}) : super(key: key);

  @override
  State<MyVideoCallPage> createState() => _MyVideoCallPageState();
}

class _MyVideoCallPageState extends State<MyVideoCallPage> {

  final AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: "App id from agora console",
      channelName: "TestingChannel channel name",
      tempToken: "Temp token from agora console using channel id"
    ),
  );

// Initialize the Agora Engine
  @override
  void initState() {
    super.initState();
    initAgora();
  }

  void initAgora() async {
    await client.initialize();
  }

// Build your layout
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              AgoraVideoViewer(client: client),
              AgoraVideoButtons(client: client),
            ],
          ),
        ),
      ),
    );
  }

}

