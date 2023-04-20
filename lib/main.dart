import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:futurama_quiz/models/character/character.dart';
import 'package:futurama_quiz/notifiers/futurama_change_notifier.dart';
import 'package:futurama_quiz/providers/futurama.dart';

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
    FuturamaChangeNotifier futuramaChangeNotifier =
        ref.watch(futuramaChangeNotifierProvider);
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            if (futuramaChangeNotifier.futuramaState.charactersState.isLoading)
              const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            if (!futuramaChangeNotifier
                    .futuramaState.charactersState.isLoading &&
                futuramaChangeNotifier
                    .futuramaState.charactersState.characters.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: futuramaChangeNotifier
                      .futuramaState.charactersState.characters.length,
                  itemBuilder: (context, index) {
                    Character character = futuramaChangeNotifier
                        .futuramaState.charactersState.characters[index];
                    return ListTile(
                      title: Text(
                          '${character.name?.first} ${character.name?.middle} ${character.name?.last} '),
                    );
                  },
                ),
              ),
            if (!futuramaChangeNotifier.futuramaState.charactersState.isLoading)
              Spacer(),
            ElevatedButton(
              onPressed: futuramaChangeNotifier.fetchCharacters,
              child: Text("Fetch"),
            ),
          ],
        ),
      ),
    );
  }
}
