import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Beer Log'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, String>> beers = [
    {"name": "Beer Name 1", "brewery": "Brewery 1", "style": "Style 1"},
    {"name": "Beer Name 2", "brewery": "Brewery 2", "style": "Style 2"},
    {"name": "Beer Name 3", "brewery": "Brewery 3", "style": "Style 3"},
    {"name": "Beer Name 4", "brewery": "Brewery 4", "style": "Style 4"},
    {"name": "Beer Name 5", "brewery": "Brewery 5", "style": "Style 5"},
    // 他のビールデータをここに追加していく
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: beers.length,
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            height: 106,
            color: Colors.grey[700],
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: AspectRatio(
                      // 正方形の比率を設定
                        aspectRatio: 1.0,
                        child: SvgPicture.asset(
                            'assets/images/beer_sample.svg',
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        beers[index]["name"]!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Noto Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        beers[index]["brewery"]!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Noto Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        beers[index]["style"]!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Noto Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          );
        },
      )
    );
  }
}
