# WebView-Interstitial-iOS

WebViewからhookを受け取ってインタースティシャル広告の読み込み + 再生をするサンプル

## Env

| Tool | Version |
|:---|:---:|
| Xcode | 11.4.1 |
| CocoaPods | 1.9.1 |
| GoogleMobileAdsSDK | 7.59.0 |

### AdMob

| Key | Value |
|:---|:----:|
| AppID | ca-app-pub-3940256099942544~1458002511 |
| Interstitial AdUnit ID | ca-app-pub-3940256099942544/4411468910 |

AdMobのテストIDを使用しています。

詳しくは [テスト広告 | iOS | Google Developers](https://developers.google.com/admob/ios/test-ads?hl=ja)を参照ください。

## Setup

```shell
$ gem install cocoapods
$ pod install --repo-update
```

