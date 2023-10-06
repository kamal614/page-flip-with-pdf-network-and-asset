import 'dart:async';

import 'package:example/kamal_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfScreen extends StatefulWidget {
  // String pdfPath;
  int currentPage;
  PdfScreen(
      {super.key,
      // required this.pdfPath
      required this.currentPage});

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();

  int? pages = 0;
  // int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';
  int totalPageCount = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        body:

            //  PDFView(
            //   filePath: remotePDFpath, // URL of the PDF
            //   // pageNumber: pageNumber, // Specific page number
            //   pageFling: false, // Disable page scrolling
            //   onViewCreated: (PDFViewController pdfViewController) {
            //     // You can access the PDFViewController for further control if needed.
            //   },
            // ),

            PDFView(
          filePath: remotePDFpath,
          enableSwipe: false,
          swipeHorizontal: true,
          autoSpacing: false,
          pageFling: true,
          pageSnap: true,
          fitEachPage: true,

          defaultPage: widget.currentPage,
          fitPolicy: FitPolicy.BOTH,
          preventLinkNavigation:
              false, // if set to true the link is handled in flutter
          // onRender: (_pages) {
          //   setState(() {
          //     pages = _pages;
          //     isReady = true;
          //   });
          // },
          // onError: (error) {
          //   setState(() {
          //     errorMessage = error.toString();
          //   });
          //   print(error.toString());
          // },
          // onPageError: (page, error) {
          //   setState(() {
          //     errorMessage = '$page: ${error.toString()}';
          //   });
          //   print('$page: ${error.toString()}');
          // },
          onViewCreated: (PDFViewController pdfViewController) {
            _controller.complete(pdfViewController);
          },
          onLinkHandler: (String? uri) {
            print('goto uri: $uri');
          },
          // onPageChanged: (int? page, int? total) {
          //   print('page change: $page/$total');
          //   setState(() {
          //     // currentPage = page;
          //     totalPageCount = total ?? 0;
          //   });
          // },
        ),
      ),
    );
  }
}
