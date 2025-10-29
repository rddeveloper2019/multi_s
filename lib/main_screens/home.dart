import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const CupertinoSearchTextField(),
          bottom: const TabBar(
            isScrollable: true,
            dividerColor: Colors.transparent,
            indicatorColor: Colors.yellow,
            indicatorWeight: 6,
            tabs: [
              RepeatedTab(label: 'men'),
              RepeatedTab(label: 'women'),
              RepeatedTab(label: 'electronics'),
              RepeatedTab(label: 'accessories'),
              RepeatedTab(label: 'shoes'),
              RepeatedTab(label: 'home & garden'),
              RepeatedTab(label: 'beauty'),
              RepeatedTab(label: 'kids'),
              RepeatedTab(label: 'bags'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('men')),
            Center(child: Text('women')),
            Center(child: Text('electronics')),
            Center(child: Text('accessories')),
            Center(child: Text('shoes')),
            Center(child: Text('home & garden')),
            Center(child: Text('beauty')),
            Center(child: Text('kids')),
            Center(child: Text('bags')),
          ],
        ),
      ),
    );
  }
}

class RepeatedTab extends StatelessWidget {
  final String label;
  const RepeatedTab({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(label, style: TextStyle(color: Colors.grey.shade600)),
    );
  }
}
