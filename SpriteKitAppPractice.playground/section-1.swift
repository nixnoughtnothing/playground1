// Playground - noun: a place where people can play

import UIKit
import SpriteKit
import XCPlayground

// define a constant number here for reuse.
let width:CGFloat = 400
let height:CGFloat = 400

let canvasWidth: UInt32 = UInt32(width)
let canvasHeight: UInt32 = UInt32(height)

// generate SpriteKit View
let view1:SKView = SKView(frame: CGRectMake(0, 0, width, height))

// generate scene then add blackColor to the background
let scene1:SKScene = SKScene(size: CGSizeMake(width, height))
scene1.backgroundColor = SKColor.blackColor();
view1.presentScene(scene1)

/* 物理エンジンのための世界(world)を設定
* 下向きに1の強さの重力
* CGVectorは平面ベクトル(x,y)を表現する構造体
*/
scene1.physicsWorld.gravity = CGVectorMake(0, -1)


// Creating random color generator
func randomColor()->SKColor{
    // 0:red,1:green, 2:blue, 3:yellow
    let random = arc4random()%4
    var color:SKColor!
    switch random{
    case 0:
        color = SKColor.redColor()
    case 1:
        color = SKColor.greenColor()
    case 2:
        color = SKColor.blueColor()
    case 3:
        color = SKColor.yellowColor()
    default:
        break
    }
    return color
}


for var i = 0; i < 100; i++ {
    // add circle
    let radius:CGFloat = 6 // define radious here
    let shape = SKShapeNode(circleOfRadius: radius)
    shape.fillColor = randomColor()
    shape.position = CGPoint(
        x:CGFloat(arc4random_uniform(canvasWidth)),
        y:CGFloat(arc4random_uniform(canvasHeight)))
    scene1.addChild(shape)
    
    // 円を物理法則
    shape.physicsBody = SKPhysicsBody(circleOfRadius: radius)
    
    // 物理パラメータを設定
    shape.physicsBody?.friction = 50
    shape.physicsBody?.restitution = 0.99
    shape.physicsBody?.mass = 20.0
    // shape.physicsBody?.velocity = CGVectorMake(10.0,0.0)
}


// 四隅に壁を設定
scene1.physicsBody = SKPhysicsBody(edgeLoopFromRect:CGRect(x:0, y:0, width:width ,height: height))


// PlaygroundのTimelineに表示
XCPShowView("Live View2", view1)



