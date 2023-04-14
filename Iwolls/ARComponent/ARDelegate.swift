//
//  ARDelegate.swift
//  ARDelegateTest
//
//  Created by Hanifah BN on 10/04/23.
//

import Foundation
import ARKit
import RealityKit


class ARDelegate: NSObject, ARSCNViewDelegate, ObservableObject {
    @Published var length : Double = 0
    @Published var width : Double = 0
    @Published var state : String = "ll"
    
    var test: String = ""
    
    private var arView: ARSCNView?
    private var circles:[SCNNode] = []
    private var trackedNode:SCNNode?
    
    var lengthStart = SCNNode()
    var lengthEnd = SCNNode()
    
    let lineWidth = CGFloat(0.003)
    let realTimeLineName = "realTimeLine"
    var distanceNodes = NSMutableArray()
    var realTimeLineNode: LineNode?
    
    func setARView(_ arView: ARSCNView) {
        self.arView = arView
        
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.vertical]
        arView.session.run(configuration)
        
        arView.delegate = self
        arView.scene = SCNScene()
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
//        arView.addGestureRecognizer(tapGesture)
        
//                let node = SCNNode()
//                node.geometry = SCNBox(width: 0.5, height: 0.1, length: 0.3, chamferRadius: 0)
//                node.geometry?.firstMaterial?.diffuse.contents = UIColor.green
//
//                arView.scene.rootNode.addChildNode(node)
        
    }
    
    @objc func addCircleAtCenter(){
        
        guard let arView = arView,
              let query = arView.raycastQuery(from: arView.center,
                                        allowing: .existingPlaneGeometry,
                                        alignment: .vertical) else { return }
        if let node = nodeAtLocation(arView.center) {
            removeCircle(node: node)
        }
        else if let result = raycastResult(fromLocation: arView.center) {
            addCircle(raycastResult: result)
            
//            guard let hitResultPosition = raycastResult(fromLocation: arView.center)  else {
//                return
//            }
//
//            if(circles.count == 1){
//                let realTimeLine = LineNode(from: SCNVector3(0, 0, 0),
//                                            to: SCNVector3(0, 0, 0),
//                                            lineColor: UIColor.systemRed,
//                                            lineWidth: lineWidth)
//                realTimeLine.name = realTimeLineName
//                realTimeLineNode = realTimeLine
//                arView.scene.rootNode.addChildNode(realTimeLine)
//            }
        }
    }
    
//    @objc func handleTap(recognizer: UITapGestureRecognizer){
//        guard let arView = arView else { return }
//        let location = recognizer.location(in: arView)
//        if let node = nodeAtLocation(location) {
//            removeCircle(node: node)
//        }
//        else if let result = raycastResult(fromLocation: location) {
//            addCircle(raycastResult: result)
//        }
//    }
    
    private func addCircle(raycastResult: ARRaycastResult) {
        var color : String
        
        if circles.count >= 4 {
            for circle in circles {
                circle.removeFromParentNode()
            }
            circles.removeAll()
        }
        if circles.count < 2{
            color = "Red"
        }
        else{
            color = "Green"
        }
    
        let circleNode = Placement.createCircle(fromRaycastResult: raycastResult, color : color)

        arView?.scene.rootNode.addChildNode(circleNode)
        circles.append(circleNode)
        
        nodesUpdated()
    }
    
    private func nodesUpdated() {
        if circles.count == 2 {
            length = Placement.calculateDistance(firstNode: circles[0], secondNode: circles[1])
        }
        else if circles.count == 4 {
            width = Placement.calculateDistance(firstNode: circles[2], secondNode: circles[3])
        }
    }
    
    @objc func reset(){
        for circle in circles {
            circle.removeFromParentNode()
        }
        circles.removeAll()
        
        length = 0
        width = 0
    }
    
    private func nodeAtLocation(_ location:CGPoint) -> SCNNode? {
        guard let arView = arView else { return nil }
        let result = arView.hitTest(location, options: nil)
        return result.first?.node
    }
    
    func removeCircle(node:SCNNode) {
        node.removeFromParentNode()
        circles.removeAll(where: { $0 == node })
    }


    private func raycastResult(fromLocation location: CGPoint) -> ARRaycastResult? {
        guard let arView = arView,
              let query = arView.raycastQuery(from: arView.center,
                                        allowing: .existingPlaneGeometry,
                                        alignment: .vertical) else { return nil }
        let results = arView.session.raycast(query)
        return results.first
    }
    
//    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
//        guard let arView = arView else { return }
//        let dotNodes = circles as [SCNNode]
//        if dotNodes.count > 0, let currentCameraPosition = arView.pointOfView {
//            updateScaleFromCameraForNodes(dotNodes, fromPointOfView: currentCameraPosition)
//        }
//
//        if let realTimeLineNode = self.realTimeLineNode,
//            let hitResultPosition = hitResult(forPoint: arView.center),
//            let startNode = distanceNodes.firstObject as? SCNNode {
//            realTimeLineNode.updateNode(vectorA: startNode.position, vectorB: hitResultPosition, color: nil)
//            let distance = distance(betweenPoints: startNode.position, point2: SCNVector3(0, 0, 0))
//            DispatchQueue.main.async { [unowned self] in
//                self.lengthLabel.text = String(format: "%.2fm", distance)
//            }
//        }
//    }
    
//    func session(_ session: ARSession, cameraDidChangeTrackingState camera: ARCamera) {
//        switch camera.trackingState {
//        case .normal:
//            break
//        default:
//            break
//        }
//    }
//
//    func distance(betweenPoints point1: SCNVector3, point2: SCNVector3) -> CGFloat {
//        let dx = point2.x - point1.x
//        let dy = point2.y - point1.y
//        let dz = point2.z - point1.z
//        return CGFloat(sqrt(dx*dx + dy*dy + dz*dz))
//    }
//
//    func hitResult(forPoint point: CGPoint) -> SCNVector3? {
//        guard let arView = arView,
//              let query = arView.raycastQuery(from: arView.center,
//                                        allowing: .existingPlaneGeometry,
//                                        alignment: .vertical) else { return nil }
//        let results = arView.session.raycast(query)
//        if let result = results.first {
//            let vector = result.worldTransform.columns.3
//            return SCNVector3(vector.x, vector.y, vector.z)
//        } else {
//            return nil
//        }
//    }
//
//    func updateScaleFromCameraForNodes(_ nodes: [SCNNode], fromPointOfView pointOfView: SCNNode){
//
//        nodes.forEach { (node) in
//
//            //1. Get The Current Position Of The Node
//            let positionOfNode = SCNVector3ToGLKVector3(node.worldPosition)
//
//            //2. Get The Current Position Of The Camera
//            let positionOfCamera = SCNVector3ToGLKVector3(pointOfView.worldPosition)
//
//            //3. Calculate The Distance From The Node To The Camera
//            let distanceBetweenNodeAndCamera = GLKVector3Distance(positionOfNode, positionOfCamera)
//
//            //4. Animate Their Scaling & Set Their Scale Based On Their Distance From The Camera
//            SCNTransaction.begin()
//            SCNTransaction.animationDuration = 0.5
//            switch distanceBetweenNodeAndCamera {
//            case 0 ... 0.5:
//                node.simdScale = simd_float3(0.25, 0.25, 0.25)
//            case 0.5 ... 1.5:
//                node.simdScale = simd_float3(0.5, 0.5, 0.5)
//            case 1.5 ... 2.5:
//                node.simdScale = simd_float3(1, 1, 1)
//            case 2.5 ... 3:
//                node.simdScale = simd_float3(1.5, 1.5, 1.5)
//            case 3 ... 3.5:
//                node.simdScale = simd_float3(2, 2, 2)
//            case 3.5 ... 5:
//                node.simdScale = simd_float3(2.5, 2.5, 2.5)
//            default:
//                node.simdScale = simd_float3(3, 3, 3)
//            }
//            SCNTransaction.commit()
//        }
//
//    }
}
