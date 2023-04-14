//
//  ContentView.swift
//  HandsOn
//
//  Created by Hanifah BN on 31/03/23.
//

import SwiftUI

struct ResultView: View {
    var body: some View {
        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            HStack(alignment: .center, spacing: 110.0){
//                Spacer()
//                Text("Your Result")
//                    .fontWeight(.semibold)
//                    .font(.system(size: 18))
//                Text("Done")
//                    .foregroundColor(Color.blue)
//                    .font(.system(size: 18))
//            }
            Spacer()
            VStack{
                HStack{
                    Text("Wall Area : ")
                        .font(.headline)
                        .fontWeight(.bold)
                    Text("1000 m^2")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.gray)
                }
                .padding(.bottom, 40.0)
                Text("Your necessary amount of paint is")
                    .font(.system(size: 22))
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                Text("82 Liters.")            .font(.system(size: 65))
                    .fontWeight(.heavy)
                Text("*for only 1 (one) coat of painting.")
                    .font(.callout)
                    .fontWeight(.light)
                    .italic()
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Your Result")
//        .navigationBarItems(trailing: ContohNavView())
        .navigationBarBackButtonHidden(true)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
