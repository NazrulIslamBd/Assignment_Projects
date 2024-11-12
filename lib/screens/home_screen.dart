import 'package:assignment_ice_cream/screens/widgets/circle_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF7FF),
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: const Color(0xFFFFC107),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.phone),
            onPressed: () {},
          ),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleWidget(
                icon: Icons.icecream,
                label: 'Ice cream is very delicious right?',
              ),
              CircleWidget(
                icon: Icons.code,
                label: 'Programming is not boring if you love it',
              ),
              CircleWidget(
                icon: Icons.egg,
                label:
                    'If you submit code directly copy from ChatGPT then mark will 0',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
