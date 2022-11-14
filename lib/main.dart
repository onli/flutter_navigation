import 'package:flutter/material.dart';
import 'package:flutter_navigation/routes.dart';

void main() {
  runApp(const MyApp());
}

enum Transitions { scale, fade }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      onGenerateRoute: (settings) {
        if (routes.containsKey(settings.name)) {
          final args = settings.arguments as Map<String, dynamic>?;
          return PageRouteBuilder(
              settings: settings,
              pageBuilder: (context, animation, secondaryAnimation) =>
                  routes[settings.name]!(context),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                switch (args?['transition']) {
                  case Transitions.scale:
                    return ScaleTransition(scale: animation, child: child);
                  case Transitions.fade:
                    return FadeTransition(opacity: animation, child: child);
                  default:
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0.0, 1.0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    );
                }
              });
        }
        // Unknown route
        return MaterialPageRoute(builder: (context) => Container());
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pushNamed('/view1',
                          arguments: {
                            'content': 'Dynamic text',
                            'transition': Transitions.scale
                          }),
                  child: const Text('View 1')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () => Navigator.of(context).pushNamed('/view2',
                    arguments: {'transition': Transitions.fade}),
                child: const Text('View 2')),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () => Navigator.of(context).pushNamed('/view3'),
                child: const Text('View 3')),
          ),
        ],
      ),
    );
  }
}
