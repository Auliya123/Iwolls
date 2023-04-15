//
//  ContentView.swift
//  HandsOn
//
//  Created by Hanifah BN on 31/03/23.
//

import SwiftUI

struct ResultView: View {
    var length : Double
    var width : Double
    @State var liter : Double = 0
    
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
                    Text(String(format: "%.2f m", length * width))
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
                Text(String(format: "%.2f L", liter))
                    .onAppear{
                        liter = countLiter(length: length, width: length)
                    }
                    .font(.system(size: 65))
                    .fontWeight(.heavy)
                //Text("82 Liters.")
                  //  .font(.system(size: 65))
                 //   .fontWeight(.heavy)
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
    
    func countLiter(length : Double, width : Double) -> Double{
        var liter : Double = 0
        liter = ((length * width)/12) + ((((length * width)/12)/100)*10)
        print(liter)
        return liter
    }
    
    
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(length: 0, width: 0)
    }
}
