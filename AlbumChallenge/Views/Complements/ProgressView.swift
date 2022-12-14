
import SwiftUI

struct ProgressView: View {
    @State private var progress = 0.1
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    Color.gray.opacity(0.5),
                    lineWidth: 10
                )
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    Color.red
                    ,
                    style: StrokeStyle(
                        lineWidth: 10,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                // 1
                .animation(.easeOut, value: progress)

        }
        .onReceive(timer) {time in
            if progress < 1 {
                progress = progress + 0.2
            }
        }
        .frame(width: 100, height: 100)
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
    }
}
