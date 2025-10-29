import 'package:flutter/material.dart';
import 'package:multi_s/widgets/fake_search_bar.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const FakeSearchBar(),
      ),

      body: const Stack(children: [SideNavigator(), CategoryView()]),
    );
  }
}

class SideNavigator extends StatelessWidget {
  const SideNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Positioned(
      bottom: 0,
      left: 0,
      child: Container(
        height: size.height * 0.8,
        width: size.width * 0.2,
        color: Colors.grey.shade300,
      ),
    );
  }
}

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      bottom: 0,
      right: 0,
      child: Container(
        height: size.height * 0.8,
        width: size.width * 0.8,
        color: Colors.white,
      ),
    );
  }
}
