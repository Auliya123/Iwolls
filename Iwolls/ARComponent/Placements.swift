//
//  Placement.swift
//  ARDelegateTest
//
//  Created by Hanifah BN on 10/04/23.
//

import Foundation
import ARKit

class Placement {
    
    static func createCircle(fromRaycastResult result:ARRaycastResult, color: String) -> SCNNode {
        let circleGeometry = SCNSphere(radius: 0.010)
        
        let material = SCNMaterial()
        if(color == "Red"){
            material.diffuse.contents = UIColor.systemRed
        }
        else{
            material.diffuse.contents = UIColor.systemGreen
        }
        
        circleGeometry.materials = [material]
        
        let circleNode = SCNNode(geometry: circleGeometry)
        circleNode.simdWorldTransform = result.worldTransform
        
        return circleNode
    }
    
    static func calculateDistance(first: SCNVector3, second: SCNVector3) -> Double {
        var distance:Double = Double(sqrt(
            pow(second.x - first.x, 2) +
            pow(second.y - first.y, 2) +
            pow(second.z - first.z, 2)
        ))
        
//        distance *= 100 // convert in cm
        return abs(distance)
    }
    
    static func calculateDistance(firstNode: SCNNode, secondNode:SCNNode) -> Double {
        return calculateDistance(first: firstNode.position, second: secondNode.position)
    }
}

