import 'package:flutter_web_ui/ui.dart' as ui;

import 'package:pokeappen/main.dart' as app;

main() async {
  await ui.webOnlyInitializePlatform();
  app.main();
}
