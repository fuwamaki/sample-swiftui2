//
//  SampleMazeView.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by fuwamaki on 2023/10/27.
//

import SwiftUI
import PencilKit

struct SampleMazeView: View {

    private let penKitView = PenKitView()

    var body: some View {
        VStack {
            Button {
                penKitView.clear()
            } label: {
                Text("clear")
            }
            ZStack {
                MazeView()
                penKitView
            }
        }
    }
}

struct SampleMazeView_Previews: PreviewProvider {
    static var previews: some View {
        SampleMazeView()
    }
}

private struct PenKitView: UIViewRepresentable {
    var canvasView = PKCanvasView()
    typealias UIViewType = PKCanvasView

    func clear() {
        canvasView.drawing = PKDrawing()
    }

    func makeUIView(context: Context) -> PKCanvasView {
        canvasView.drawingPolicy = .anyInput
        canvasView.backgroundColor = .clear
        return canvasView
    }

    func updateUIView(_ uiView: PKCanvasView, context: Context) {}
}

private struct MazeView: View {
    let maze: [[Bool]] = [
        [true, false, true, true, true, true, true, true],
        [true, false, false, false, false, true, false, true],
        [true, true, true, true, false, false, false, true],
        [true, false, false, false, false, true, true, true],
        [true, false, true, true, true, false, false, true],
        [true, false, true, false, true, false, true, true],
        [true, false, false, false, false, false, false, true],
        [true, true, true, true, true, true, false, true],
    ] // 迷路データ。trueは壁、falseは通路を表します。

    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<maze.count, id: \.self) { row in
                HStack(spacing: 0) {
                    ForEach(0..<maze[row].count, id: \.self) { col in
                        CellView(isWall: maze[row][col])
                    }
                }
            }
        }
    }
}

private struct CellView: View {
    let isWall: Bool

    var body: some View {
        Rectangle()
            .fill(isWall ? Color.black : Color.white)
            .frame(width: 40, height: 40) // セルのサイズを設定
            .border(Color.gray.opacity(0.2), width: 1) // グリッド線を描画
    }
}
