//
//  Home.swift
//  UI-267
//
//  Created by nyannyan0328 on 2021/07/24.
//

import SwiftUI

struct Home: View {
    @State var pinchValue : CGFloat = 0
    @State var lastValue : CGFloat = 0
    @GestureState var pinchStarted : Bool = false
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing:15){
              
                
                ForEach(events){event in
                    EventCardView(events: event, pincValue: $pinchValue)
                    
                    
                    
                }
            }
            .padding([.vertical,.leading])
            
        }
        .gesture(
        
            MagnificationGesture().updating($pinchStarted, body: { value, out, _ in
            
           out = true
        })
                .onChanged({ value in
            
            if pinchStarted{
                
                
                let delta = lastValue +  ((value - 1) > 0 ? (value - 1) : (value - 1) * 4.5 )
                
                var absoultedelta = delta > 0 ? delta : 0
                absoultedelta = absoultedelta < 4.5 ? absoultedelta : 4.5
                
                
                
                self.pinchValue = absoultedelta
            }
            
        })
                .onEnded({ value in
            
            withAnimation(.easeInOut){
                
                if pinchValue > 2.0{
                    
                    
                    
                    pinchValue = 4.5
                    lastValue = 4.5
                }
                
                else{
                    pinchValue = 0
                    lastValue = 0
                    
                    
                }
                
                
            }
            
        })
        
        )
        .safeAreaInset(edge: .top, content: {
            HStack{
                
                
                Text("Event")
                    .font(.largeTitle.bold())
                
                Spacer(minLength: 0)
                
                
                Button {
                    
                } label: {
                    
                    Image(systemName: "magnifyingglass")
                        .font(.title)
                        .foregroundColor(.primary)
                        .padding(.trailing)
                    
                }

                    
            }
            .padding()
            .background(.ultraThinMaterial)
            
            
        })
        .background(Color.primary.opacity(0.07))
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
