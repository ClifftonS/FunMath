import SwiftUI
import AVKit

@main
struct MyApp: App {
    @State var music: AVAudioPlayer!
    @State var musicURL = Bundle.main.url(forResource: "first-steps-141242", withExtension: "mp3")
    var body: some Scene {
        WindowGroup {
            MenuView().preferredColorScheme(.light).onAppear {
                if let audioPlayer = try? AVAudioPlayer(contentsOf: musicURL!) {
                    music = audioPlayer
                    music.volume = 0.15
                    music.numberOfLoops = -1
                    music.play()
                }
            }
        }
    }
}
