import 'dart:async';
import 'dart:io';

import 'package:example/screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class KamalScreen extends StatefulWidget {
  const KamalScreen({super.key});

  @override
  State<KamalScreen> createState() => _KamalScreenState();
}

String remotePDFpath = '';

class _KamalScreenState extends State<KamalScreen> {
  @override
  void initState() {
    // createFileOfPdfUrl();
    createFileOfPdfUrl().then((f) {
      setState(() {
        remotePDFpath = f.path;
      });
    });
    super.initState();
  }

  Future<File> createFileOfPdfUrl() async {
    Completer<File> completer = Completer();
    print("Start download file from internet!");
    try {
      const url =
          "https://currentcrime.com/wp-content/uploads/2023/09/Dainik-Current-Crime_21-sep-2023_230921_090455.pdf";
      final filename = url.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      print("Download files");
      print("${dir.path}/$filename");
      File file = File("${dir.path}/$filename");

      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              if (remotePDFpath.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              }
            },
            child: const Text("PDF")),
      ),
    );
  }
}
