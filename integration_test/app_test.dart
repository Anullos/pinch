import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:pinch/main.dart' as app;
import 'package:pinch/src/games/presentation/widgets/item_game_list.dart';
import 'package:pinch/src/shared/presentation/l10n/generated/l10n.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
      as IntegrationTestWidgetsFlutterBinding;

  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  group('end-to-end test', () {
    testWidgets('show games page with 10 elements loaded and click to go to details page',
        (WidgetTester tester) async {
      await app.main();
      await tester.pumpAndSettle();

      // delay to wait for the page to load
      await Future.delayed(const Duration(seconds: 5));
      // checks 10 elements games displayed
      expect(find.byType(ItemGameList), findsNWidgets(10));

      // Emulate a tap on the item game.
      await tester.ensureVisible(find.byType(ItemGameList).first);
      await tester.pumpAndSettle();
      await tester.tap(find.byType(ItemGameList).first);

      // delay to wait for the page to load
      await Future.delayed(const Duration(seconds: 2));
      tester.printToConsole('Go to game details');
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 1));

      // Verify the correct page by text appBar.
      expect(find.text(S.current.detailsGame), findsOneWidget);
    });
  });
}
