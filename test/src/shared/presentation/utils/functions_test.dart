import 'package:flutter_test/flutter_test.dart';
import 'package:pinch/src/shared/presentation/utils/functions.dart';

void main() {
  setUp(() {});

  test('method fixUrl', () async {
    const urlMatcher =
        'https://images.igdb.com/igdb/image/upload/t_cover_big/yektasaxw6l4ejte7ljb.jpg';
    const url =
        '//images.igdb.com/igdb/image/upload/t_thumb/yektasaxw6l4ejte7ljb.jpg';
    final result = fixUrl(url);
    expect(result, urlMatcher);
  });
}
