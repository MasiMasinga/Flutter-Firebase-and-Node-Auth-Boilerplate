import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Home'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
          child: Column(
            children: [
              const Text(
                'Masibonge Masinga',
                style: TextStyle(fontSize: 24),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 50.0, horizontal: 20.0),
                child: SizedBox(
                  width: 325,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Logout'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
