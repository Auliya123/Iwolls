//
//  ARViewRepresentable.swift
//  ARDelegateTest
//
//  Created by Hanifah BN on 10/04/23.
//

import ARKit
import SwiftUI

extension ARSCNView : ARCoachingOverlayViewDelegate{
    
    func addCoaching(){
        
        let coachingOverlay = ARCoachingOverlayView()
        coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        coachingOverlay.delegate = self
        coachingOverlay.session = self.session
        coachingOverlay.goal = .verticalPlane
        self.addSubview(coachingOverlay)
    }
}

struct ARViewRepresentable: UIViewRepresentable {
    let arDelegate:ARDelegate
    
    func makeUIView(context: Context) -> some UIView {
        let arView = ARSCNView(frame: .zero)
        arDelegate.setARView(arView)
        arView.addCoaching()
        return arView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct ARViewRepresentable_Previews: PreviewProvider {
    static var previews: some View {
        ARViewRepresentable(arDelegate: ARDelegate())
    }
}

