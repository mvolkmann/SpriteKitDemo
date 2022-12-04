import SpriteKit
import SwiftUI

class GameScene: SKScene {
    let boxSize = 50

    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }

    private func randomColor() -> UIColor {
        UIColor(
            red: .random(in: 0 ... 1),
            green: .random(in: 0 ... 1),
            blue: .random(in: 0 ... 1),
            alpha: 1
        )
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let size = CGSize(width: boxSize, height: boxSize)
        // let box = SKSpriteNode(color: .red, size: size)
        let box = SKSpriteNode(color: randomColor(), size: size)
        box.position = location
        box.physicsBody = SKPhysicsBody(rectangleOf: size)
        addChild(box)
    }
}

struct ContentView: View {
    let size = CGSize(width: 300, height: 400)
    var scene: SKScene {
        let scene = GameScene()
        scene.size = size
        scene.scaleMode = .fill
        return scene
    }

    var body: some View {
        VStack {
            Text("Tap to drop a box.").font(.title)
            SpriteView(scene: scene)
                .frame(width: size.width, height: size.height)
                .ignoresSafeArea()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
