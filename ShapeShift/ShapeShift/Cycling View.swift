//
//  Cycling View.swift
//  ShapeShift
//
//  Created by Elisha Ho on 10/8/24.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    var body: some View {
        VStack {
            Text("How to Cycle to Lose Weight")
                .font(.title)
                .padding()

            VideoPlayer(player: AVPlayer(url: Bundle.main.url(forResource: "cycling_video", withExtension: "mp4")!))
                .frame(height: 300)
                .padding()
        }
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView()
    }
}
