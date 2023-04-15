//
//  ContentView.swift
//  ARViewCoba
//
//  Created by Hanifah BN on 06/04/23.
//

import SwiftUI
import ARKit
import RealityKit

struct MeasureView: View {
    @ObservedObject var arDelegate = ARDelegate()
    var isOpening: Bool = false
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                ZStack{
                    ARViewRepresentable(arDelegate: arDelegate)
                    VStack(spacing: 20.0){
                        HStack{
                            Button {
                                arDelegate.reset()
                            }
                        label: {
                            Image(systemName: "arrow.counterclockwise")
                        }
                        .frame(width: 50, height: 50)
                        .padding(.horizontal, 5.0)
                        .buttonBorderShape(.roundedRectangle)
                        .controlSize(.large)
                        .foregroundColor(Color.black)
                        .background(Color.white)
                        .cornerRadius(10)
                        .opacity(0.6)
                            Spacer()
                            if(isOpening){
                                NavigationLink(destination: ResultView(length: arDelegate.length, width: arDelegate.width)){
                                    Text("Skip")
                                        .frame(width: 60, height: 50)
                                        .buttonBorderShape(.roundedRectangle)
                                        .controlSize(.large)
                                        .foregroundColor(Color.black)
                                        .background(Color.white)
                                        .cornerRadius(10)
                                        .opacity(0.6)
                                }
                            }
                        }
                        .padding(.horizontal, 20.0)
                        Text("Measure length and width of your \(isOpening ? "openings" : "wall")!")
                            .frame(width: /*@START_MENU_TOKEN@*/350.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/40.0/*@END_MENU_TOKEN@*/)
                            .background(.gray)
                            .foregroundColor(.white)
                            .font(.headline)
                            .cornerRadius(10)
                        //                Text(String(arDelegate.length))
                        //                    .frame(width: /*@START_MENU_TOKEN@*/350.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/40.0/*@END_MENU_TOKEN@*/)
                        //                    .background(.gray)
                        //                    .foregroundColor(.white)
                        //                    .font(.headline)
                        //                    .cornerRadius(10)
                        //                Text(String(arDelegate.width))
                        //                    .frame(width: /*@START_MENU_TOKEN@*/350.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/40.0/*@END_MENU_TOKEN@*/)
                        //                    .background(.gray)
                        //                    .foregroundColor(.white)
                        //                    .font(.headline)
                        //                    .cornerRadius(10)
                        Spacer()
                        HStack(){
                            Spacer()
                            Spacer()
                            Button(){
                                arDelegate.addCircleAtCenter()
                            }
                            label: {
                                Image(systemName: "plus")
                            }
                        .frame(width: 70, height: 70)
                        .foregroundColor(Color.black)
                        .background(Color.white)
                        .cornerRadius(50)
                        .opacity(0.6)
                        .font(.title)
                            Spacer()
                            NavigationLink(destination: AreaView(length: arDelegate.length, width: arDelegate.width, isOpening: isOpening)) {
                                Image(systemName: "checkmark")
                            }
                            .frame(width: 70, height: 70)
                            .foregroundColor(Color.black)
                            .background(Color.blue)
                            .cornerRadius(50)
                            .opacity(0.6)
                            .font(.title)
                        }
                        .padding(.horizontal, 20.0)
                    }
                    .padding(.vertical, 70.0)
                }
                .ignoresSafeArea()
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                Image(systemName: "circle.fill")
                    .foregroundColor(Color.white)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
      
}

extension ARView : ARCoachingOverlayViewDelegate{
    
    func addCoaching(){
        
        let coachingOverlay = ARCoachingOverlayView()
        coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        coachingOverlay.delegate = self
        coachingOverlay.session = self.session
        coachingOverlay.goal = .verticalPlane
        self.addSubview(coachingOverlay)
    }

}

//Because there's currently no view provided for Reality Kit in SwiftUI
struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let view = ARView(frame: .zero)
        
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.vertical]
        view.session.run(config)
        
        view.addCoaching()
        
        return view
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    func updateUIView(_ view: ARView, context: Context) {
    }
    
}

struct MeasureView_Previews: PreviewProvider {
    static var previews: some View {
        MeasureView()
    }
}
