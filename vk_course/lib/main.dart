import 'package:flutter/material.dart';
import 'src/widgets/navigation_widgets.dart';

void main() {
  runApp(const MainApp());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _indexNav = 0;

  void _incrementIndexNav(int index) {
    setState(() {
      _indexNav = index;
    });
  }

  final List<Widget> _pages = [
    const HomePage(),
    const ArticlePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return Column(
              children: [
                Expanded(
                  child: IndexedStack(
                    index: _indexNav,
                    children: _pages,
                  ),
                ),
                CustomBottomNavigationBar(
                  currentIndex: _indexNav,
                  onTap: _incrementIndexNav,
                ),
              ],
            );
          } else {
            return Row(
              children: [
                SafeArea(
                  child: CustomNavigationRail(
                    currentIndex: _indexNav,
                    onDestinationSelected: _incrementIndexNav,
                  ),
                ),
                Expanded(
                  child: IndexedStack(
                    index: _indexNav,
                    children: _pages,
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 214, 122, 69),
      child: const Center(
        child: Text(
          'Đây là Trang chủ',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 214, 122, 69),
      child: const Center(
        child: Text(
          'Đây là Bài viết',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      home: const MyHomePage(),
    );
  }
}
