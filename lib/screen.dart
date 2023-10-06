import 'package:example/pdf_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageFlipWidget(
        key: _controller,
        backgroundColor: Colors.white,
        lastPage: Container(
            color: Colors.white,
            child: const Center(child: Text('Last Page!'))),
        children: <Widget>[
          // for (var i = 0; i < 10; i++) DemoPage(page: i),
          for (var i = 0; i < 10; i++) PdfScreen(currentPage: i)
          // DemoPage(page: 1),
        ],
      ),
    );
  }
}
