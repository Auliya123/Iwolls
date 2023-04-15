//
//  AreaView.swift
//  ARDelegateTest
//
//  Created by Hanifah BN on 10/04/23.
//

import SwiftUI
import Foundation

struct AreaView: View {
     var length : Double
     var width : Double
    var isOpening : Bool = false
    
    
    var body: some View {
        VStack(spacing: 15.0){
            Text("\(isOpening ? "Excluded Space" : "Wall") Details")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .padding(.bottom, 10.0)
            HStack{
                Text("Length")
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 27))
                Spacer()
                Text(String(format: "%.2f m", length))
                    .multilineTextAlignment(.trailing)
                    .font(.system(size: 27))
            }
            .padding(.horizontal, 70.0)
            HStack{
                Text("Width")
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 27))
                Spacer()
                Text(String(format: "%.2f m", width))
                    .multilineTextAlignment(.trailing)
                    .font(.system(size: 27))
            }
            .padding(.horizontal, 70.0)
            HStack{
                Text("Area")
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 27))
                Spacer()
                Text(String(format: "%.2f m", length * width))
                    .multilineTextAlignment(.trailing)
                    .font(.system(size: 27))
            }
            .padding(.horizontal, 70.0)
            .padding(.bottom, 10.0)
            if(isOpening) {
                NavigationLink(destination:  ResultView(length: length, width: width)){
                    Button {}
                label: {
                    Text("Calculate Now")
                }
                .frame(width: 250, height: 50)
                .padding(.horizontal, 5.0)
                .buttonBorderShape(.roundedRectangle)
                .controlSize(.large)
                .foregroundColor(Color.white)
                .background(Color.blue)
                .cornerRadius(10)
                }
            } else {
                NavigationLink(destination:  MeasureView(isOpening: true)){
                    Button {}
                label: {
                    Text("Next")
                }
                .frame(width: 250, height: 50)
                .padding(.horizontal, 5.0)
                .buttonBorderShape(.roundedRectangle)
                .controlSize(.large)
                .foregroundColor(Color.white)
                .background(Color.blue)
                .cornerRadius(10)
                }
            }
        }
        
        
    }
}

//struct AreaView_Previews: PreviewProvider {
//    static var previews: some View {
//        AreaView()
//    }
//}
