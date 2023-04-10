//
//  OnBoardingView.swift
//  Iwolls
//
//  Created by Norman Mukhallish on 10/04/23.
//

import SwiftUI

struct OnBoardingView: View {
    var body: some View {
        TabView{
            VStack(spacing: 30){
                Image("wallAsset")
                VStack{
                    Text("Measure your wall size!")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("Move your phone according to the dot appearing on the screen. Move horizontally to get wall length, vertically to get the width.")
                        .fontWeight(.light)
                        .padding(35)
                }
                
                
            }
            VStack(spacing: 30){
                Image("openingsAssets")
                VStack{
                    Text("Measure your openings!")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("If there is any opening in the wall (such as doors, windows, etc), measure the length and width by moving your phone according to the dot appearing on the screen.")
                        .fontWeight(.light)
                        .padding(35)
                }
            }
            VStack(spacing: 30){
                Image("checkedPhone")
                VStack{
                    Text("Get the Result!")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("You have measured your desired wall size, and voila! We'll show you the amount of paint you need.")
                        .fontWeight(.light)
                        .padding(35)
                }
                
            }

            VStack(spacing: 30){
                Image("paintingPerson")
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                
                VStack{
                    Text("Let's Get Started")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("Activate your camera to start measuring and get your paint result!")
                        .fontWeight(.light)
                        .padding(35)
                }
                Button(action: {
                    
                }, label: {
                    Text("Get Started")
                        .font(.body)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 50.0)
                        .padding(.vertical, 6)
                })
//                .frame(height: 100)
                .buttonStyle(.borderedProminent)
                
            }
            
        }
        .tabViewStyle(.page)
        .tabViewStyle(PageTabViewStyle())
        .onAppear{setupAppearance()}
        
     }
    func setupAppearance(){
        UIPageControl.appearance().currentPageIndicatorTintColor = .black
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.3)
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
