import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/view/weather_forecast_view.dart';

void main() {
  testWidgets('天気予報画面に晴れの画像が表示される', (widgetTester) async {
    await widgetTester
        .pumpWidget(const ProviderScope(child: WeatherForecastView()));
  });
}
