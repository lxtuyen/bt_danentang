import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 48,
            backgroundImage: AssetImage("assets/R.png"),
          ),
          const Text("LeXuanTuyen",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
          const SizedBox(
            height: 10,
          ),
          const Text("Flutter Developer"),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListTile(
              leading: const Icon(Icons.phone),
              title: const Text("0979821662"),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListTile(
              leading: const Icon(Icons.email),
              title: const Text("tuyenlx.22itb@vku.udn.vn"),
            ),
          ),
        ],
      )),
    );
  }
}