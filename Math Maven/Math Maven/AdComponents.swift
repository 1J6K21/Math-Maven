import SwiftUI
import GoogleMobileAds

// Ad Settings
class AdSettings: ObservableObject {
    @AppStorage("AdsEnabled") var adsEnabled: Bool = true
    static let shared = AdSettings()
    
    private init() {}
}

// Banner Ad View
struct BannerAdView: UIViewRepresentable {
    @ObservedObject private var adSettings = AdSettings.shared
    
    func makeUIView(context: Context) -> BannerView {
        guard adSettings.adsEnabled else {
            // Return an empty view when ads are disabled
            return BannerView(adSize: AdSizeBanner)
        }
        
        let bannerView = BannerView(adSize: AdSizeBanner)
        // TODO: ⚠️ REQUIRED: Replace with your actual ad unit ID from AdMob console
        // Current placeholder: ca-app-pub-xxxxxxxxxxxxxxxx/yyyyyyyyyy
        bannerView.adUnitID = "ca-app-pub-xxxxxxxxxxxxxxxx/yyyyyyyyyy"
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootViewController = windowScene.windows.first?.rootViewController {
            bannerView.rootViewController = rootViewController
            bannerView.load(Request())
        }
        return bannerView
    }
    
    func updateUIView(_ uiView: BannerView, context: Context) {}
}

// Ad Settings Toggle View
struct AdSettingsView: View {
    @ObservedObject private var adSettings = AdSettings.shared
    
    var body: some View {
        Toggle("Enable Ads", isOn: $adSettings.adsEnabled)
            .padding()
            .onChange(of: adSettings.adsEnabled) { newValue in
                // You can add analytics or other tracking here if needed
                print("Ads enabled: \(newValue)")
            }
    }
} 