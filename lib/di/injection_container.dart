import 'package:flutter_sapo_two/posts/di/posts_di.dart';
import 'package:get_it/get_it.dart';
import 'package:st_utils/st_utils.dart';

class Get {
  static final it = GetIt.instance;

  static Future<void> init() async {
    final modules = <ModuleDi>[
      PostModule(it),
    ];

    for (final element in modules) {
      element.registerModule();
    }
  }
}
