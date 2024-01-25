# ARCHITECTURE.md
## アーキテクチャ
```mermaid
flowchart LR
    id1(View) --> id2(notifier) -->  id1
    id2(notifier) --> id3(service) --> id2
    id3(service) --> id4(model) --> id3
```

### model
- レスポンスデータの最高気温、最低気温、および天気の状態（晴れ、曇り、雨など）を保持
- 天気情報をリクエストするためのデータ（エリア、日時）を保持
### service
- ビジネスロジックを含むサービス層で、外部サービスとの通信を行う
- リクエストを外部サービスに送信し、レスポンスを受け取り、適切な形式に変換
### notifier
- viewで扱う状態を管理
    - 天気情報を取得し、状態を更新
### view
- ユーザーに向けて表示されるインターフェースを構築
- view内のアクションに応じて、notifierを介してデータを取得しviewに反映

## Riverpod の Provider の依存関係図
```mermaid
flowchart TB
  subgraph Arrows
    direction LR
    start1[ ] -..->|read| stop1[ ]
    style start1 height:0px;
    style stop1 height:0px;
    start2[ ] --->|listen| stop2[ ]
    style start2 height:0px;
    style stop2 height:0px;
    start3[ ] ===>|watch| stop3[ ]
    style start3 height:0px;
    style stop3 height:0px;
  end
  subgraph Type
    direction TB
    ConsumerWidget((widget));
    Provider[[provider]];
  end

  weatherServiceProvider[["weatherServiceProvider"]];
  yumemiWeatherProvider[["yumemiWeatherProvider"]];
  weatherForecastViewStateNotifierProvider[["weatherForecastViewStateNotifierProvider"]];
  weatherDataStateNotifierProvider[["weatherDataStateNotifierProvider"]];
  WeatherForecastView((WeatherForecastView));
  WeatherImage((WeatherImage));
  CommonTemperatureText((CommonTemperatureText));

  weatherForecastViewStateNotifierProvider --> WeatherForecastView;
  weatherForecastViewStateNotifierProvider -.-> WeatherForecastView;
  weatherDataStateNotifierProvider ==> WeatherImage;
  weatherDataStateNotifierProvider ==> CommonTemperatureText;
  yumemiWeatherProvider ==> weatherServiceProvider;
```