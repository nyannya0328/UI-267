//
//  EventCardView.swift
//  UI-267
//
//  Created by nyannyan0328 on 2021/07/24.
//

import SwiftUI

struct EventCardView: View {
    var events : Event
    @Binding var pincValue : CGFloat
    var body: some View {
        HStack(spacing:15){
            
            
            Text(getData())
                .font(.title2.weight(.semibold))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding()
            
            
            HStack(spacing:10){
                
                Capsule()
                    .fill(events.color)
                    .frame(width: 2)
                
                
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    
                    VStack(alignment: .leading, spacing: 15) {
                        
                        Text(events.title)
                            .font(.footnote.bold())
                            .lineLimit(1)
                        
                        Text(events.timing)
                            .font(.caption.italic())
                            .foregroundColor(.secondary)
                            .lineLimit(1)
                        
                    
                        
                        
                    }
                    .frame(height: 100)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .overlay(
                    
                        Image(systemName: "chevron.right")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.primary)
                        
                        
                        ,alignment: .trailing
                    
                    
                    
                    )
                    
                    VStack(alignment: .leading, spacing: 15) {
                        
                        Text("A")
                            .lineLimit(1)
                        Text("A")
                            .lineLimit(1)
                        Text("A")
                            .lineLimit(1)
                        
                        
                        HStack{
                            
                            
                            ForEach(1...3,id:\.self){index in
                                
                                
                                Image("p\(index)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 35, height: 35)
                                    .clipShape(Circle())
                                    .background(.white,in:RoundedRectangle(cornerRadius: 20))
                                    .offset(x: -getImageOffset())
                            }
                        }
                        .padding(.top)
                        .padding(.leading,25)
                        
                        
                        
                    }
                    .frame(height: getMaxSize(), alignment: .top)
                    .opacity(getopacity())
                    
                    
                    
                    
                    
                }
                
                
                Spacer(minLength: 0)
            }
            .padding()
            .frame(height: 100 + getMaxSize())
            .clipped()
            .background(Color.white,in: RoundedRectangle(cornerRadius: 10))
            
            
            
        }
       
    }
    
    func getMaxSize()->CGFloat{
        
        
        let progress = pincValue * 40
        
        return progress
    }
    
    func getopacity()->CGFloat{
        
        
        let progress = getMaxSize() / 180
        
        return progress
    }
    
    func getImageOffset()->CGFloat{
        
        
        let progress = getMaxSize() / 180
        
        return progress * 15
    }
    
    
    
    
    
    
    
    func getData()->String{
        
        events.date.replacingOccurrences(of: " ", with: "\n")
    }
}

struct EventCardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
