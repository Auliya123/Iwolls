//
//  OnBoardingView.swift
//  Iwolls
//
//  Created by Norman Mukhallish on 10/04/23.
//

import SwiftUI

class OnBoardingViewModel: ObservableObject {
    @Published var onBoardings : [OnBoarding] = OnBoarding.views
}

struct OnBoardingView: View {
    @ObservedObject var onBoardingViewModel: OnBoardingViewModel
    
    var body: some View {
        NavigationStack{
            TabView{
                ForEach(onBoardingViewModel.onBoardings.prefix(3)){ onBoarding in
                    ExtractedView(onBoarding: onBoarding)
                }
                
                VStack(spacing: 30){
                    ExtractedView(onBoarding: onBoardingViewModel.onBoardings[3])
                    NavigationLink(destination: MeasureView(isOpening: false)){
                        Text("Get Started")
                            .font(.body)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 50.0)
                            .padding(.vertical, 6)
                    }.buttonStyle(.borderedProminent)
                    
                }
            }
            .tabViewStyle(.page)
            .tabViewStyle(PageTabViewStyle())
            .onAppear{setupAppearance()}
            
        }
        
    }
    func setupAppearance(){
        UIPageControl.appearance().currentPageIndicatorTintColor = .black
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.3)
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static let onBoardingViewModel = OnBoardingViewModel()
    static var previews: some View {
        OnBoardingView(onBoardingViewModel: onBoardingViewModel)
    }
}

struct ExtractedView: View {
    var onBoarding: OnBoarding
    
    var body: some View {
        VStack(spacing: 30){
            Image(onBoarding.image)
            VStack{
                Text(onBoarding.title)
                    .font(.title2)
                    .fontWeight(.bold)
                Text(onBoarding.desc)
                    .fontWeight(.light)
                    .padding(35)
            }
        }
    }
}
