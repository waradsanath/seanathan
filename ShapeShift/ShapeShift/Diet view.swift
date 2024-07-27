//
//  Diet view.swift
//  ShapeShift
//
//  Created by T Krobot on 20/7/24.
//

import SwiftUI

struct DietView: View {
    
    var body: some View {
       
        NavigationView{
            ZStack{
            Color.black
                .ignoresSafeArea()
                ScrollView{
                    VStack(alignment: .leading, spacing: 50){
                        
                    Text("Limit")
                        .foregroundColor(.white)
                        .bold()
                        .font(.system(size: 30))
                        .padding()
                        
                        
                        HStack{
                            Text("Meals")
                            
                                .foregroundColor(.white)
                                .bold()
                                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                .font(.system(size: 30))
                                .padding()
                            
                            Spacer()
                            Button {
                            } label: {
                                Image(systemName: "plus")
                                    .padding()
                                    .font(.system(size: 21))
                            }
                            
                        }
                        
                        NavigationStack{
                            
                            
                        }
                    }
                }
            }
            .navigationTitle("Diet")
        }
        
    }
    
    
    
    
}






#Preview {
    DietView()
}
