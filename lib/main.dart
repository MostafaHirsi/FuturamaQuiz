import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/info.dart';

void main() {
  runApp(
    const ProviderScope(
      observers: [],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Futurama Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Person person = ref.watch(personProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Name: ${person.name}",
            ),
            Text(
              "Age: ${person.age}",
            ),
            TextField(
              onSubmitted: person.changeName,
            ),
            TextButton(
              onPressed: person.increaseAge,
              child: Text("+"),
            )
          ],
        ),
      ),
    );
  }
}
