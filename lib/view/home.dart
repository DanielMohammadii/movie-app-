import 'package:flutter/material.dart';
import 'package:movieapp/widget/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: const [
              SizedBox(height: 25),
              PopularPeople(),
              SizedBox(height: 30),
              TopRated(),
              SizedBox(height: 30),
              PopularTvShow(),
            ],
          ),
        ),
      ),
    );
  }
}
