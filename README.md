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

## Detail

- `Resources/Simple.html`をWebView画面に表示しています。
- buttonをクリックすると `webview-interstitial://click-show-interstitial`を読み込むように組んであります。
- `UIWebViewDelegate`の`webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType)`のrequestから`webview-interstitial://click-show-interstitial`の時だけ、AdMobのインタースティシャル広告を表示するようになっています。
- ボタンを押されてから読み込みを開始して、読み込みが終わってから表示となるため少しだけ時間があくので、UIで明示的に読み込み中ですなindicatorを表示しています。
- 使っているライブラリは [pkluz/PKHUD: A Swift based reimplementation of the Apple HUD (Volume, Ringer, Rotation,…) for iOS 8.](https://github.com/pkluz/PKHUD)です