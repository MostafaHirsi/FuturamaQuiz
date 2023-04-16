import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:futurama_quiz/notifiers/futurama_change_notifier.dart';

import '../api/futurama_provider.dart';
import '../repository/futurama_repository.dart';
import 'dio.dart';

final futuramaApiService = Provider<FuturamaApiService>((ref) {
  return FuturamaApiService(ref.read(dioClientProvider));
});

final futuramaRepositoryProvider = Provider<FuturamaRepository>((ref) {
  return FuturamaRepository(ref.read(futuramaApiService));
});

final futuramaChangeNotifierProvider =
    ChangeNotifierProvider<FuturamaChangeNotifier>((ref) {
  return FuturamaChangeNotifier(ref.read(futuramaRepositoryProvider));
});
