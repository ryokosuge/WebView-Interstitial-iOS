//
//  SimpleViewController.swift
//  WebViewInterstitial
//
//  Created by ryokosuge on 2020/05/19.
//  Copyright © 2020 ryokosuge. All rights reserved.
//

import UIKit
import GoogleMobileAds

private let interstitialAdUnitID = "ca-app-pub-3940256099942544/4411468910"

class SimpleViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView?

    private var interstitial: GADInterstitial?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        // delegate
        webView?.delegate = self

        // htmlの読み込み
        if let url = Bundle.main.url(forResource: "Simple", withExtension: "html") {
            let request = URLRequest(url: url)
            webView?.loadRequest(request)
        }
    }

}

// MARK: - UIWebViewDelegate

extension SimpleViewController: UIWebViewDelegate {

    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("did finish load webView: \(webView)")
    }

    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType) -> Bool {
        print(request)
        // requestからURLを取得する
        guard let url = request.url else {
            // 取得できないなら無効なリクエスト扱い
            return false
        }

        let scheme = url.scheme ?? "https"
        // 独自で定義したschemeじゃないなら
        // requestを許容する
        guard scheme == "webview-interstitial" else {
            return true
        }

        let host = url.host ?? ""
        if host == "click-show-interstitial" {
            // 表示するボタンを押されたので広告の読み込みを開始する
            loadAd()
            // WebView自体には何もさせたくないのでfalseを返す
            return false
        }

        return false
    }

}

// MARK: - Ad

extension SimpleViewController: GADInterstitialDelegate {

    private func loadAd() {
        guard interstitial == nil else {
            // interstitialがnilじゃないなら読み込み中 or 再生待ちなので
            // 読み込まない
            return
        }

        let interstitial = GADInterstitial(adUnitID: interstitialAdUnitID)
        self.interstitial = interstitial
        interstitial.delegate = self

        interstitial.load(GADRequest())
    }

    func interstitialDidReceiveAd(_ ad: GADInterstitial) {
        // 再生準備ができたのでそのまま再生処理に入る
        ad.present(fromRootViewController: self)
    }

    func interstitial(_ ad: GADInterstitial, didFailToReceiveAdWithError error: GADRequestError) {
        showErrorAlert(with: error.localizedDescription)
        interstitial = nil
    }

    func interstitialWillLeaveApplication(_ ad: GADInterstitial) {
        // 広告クリックでアプリ外へ遷移する
    }

    func interstitialWillPresentScreen(_ ad: GADInterstitial) {
        // 広告が表示される前
    }

    func interstitialWillDismissScreen(_ ad: GADInterstitial) {
        // 広告が閉じられる前
    }

    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        // 広告が閉じられたあと
        // interstitialを破棄する
        interstitial = nil
    }

}

extension SimpleViewController {

    private func showErrorAlert(with message: String) {
    }

}
