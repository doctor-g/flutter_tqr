import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tqr/models/database.dart';
import 'package:flutter_tqr/util/parser.dart';

void main() {
  late CardDatabase database;

  setUp(() async {
    // Ensure the asset can be loaded  via the rootbundle
    TestWidgetsFlutterBinding.ensureInitialized();

    // Parse the data
    ThunderstoneYamlCardParser parser = new ThunderstoneYamlCardParser();
    String string = await rootBundle.loadString('assets/cards.yaml');
    database = parser.parse(string);
  });

  test('All cards have names', () {
    database.quests.forEach((quest) {
      quest.cards.forEach((card) {
        expect(card.name, isNotNull);
      });
    });
  });
}
