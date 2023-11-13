//
//  LunchItem.swift
//  lesyawidget
//
//  Created by mll
import SwiftUI

struct LunchItem: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 8.0) {
                Spacer()
                
                Text("Як додаток працює?")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color("ColorInverted"))
                    .foregroundStyle(.linearGradient(colors: [.primary.opacity(0.7), .primary], startPoint: .bottomLeading, endPoint: .topTrailing))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                
                Text("Трохи магії та кохання.")
                    .font(.footnote)
                    .foregroundStyle(Color("ColorInverted"))
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
               
            }
            .padding(.horizontal,20)
            .padding(.all, 20.0)
                .frame(width: 320.0, height: 200.0)
                .background(
                    Color("Font"))
                .mask(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                )
                //.padding(.horizontal, 20.0)
                .rotation3DEffect(.degrees(proxy.frame(in: .global).minX / -10), axis: (x: -40, y: 1, z: 2))
                .padding(.horizontal, 20)
            /*.shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)*/
                /*.blur(radius: abs(proxy.frame(in: .global).minX / 20))*/
                .overlay(
                    ZStack {
                        Rectangle()
                            .fill(Color.blue.opacity(0))
                            .background(
                                Image("howwrk")
                                    .scaleEffect(0.2)
                                    .rotationEffect(Angle(degrees: model.timetableRotation))
                                    .mask(
                                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                                    )
                            )
                            .hueRotation(.degrees(model.timetableColor))
                        
                    }
                        .padding()
                        .frame(width: 100, height: 200)
                        .rotation3DEffect(.degrees(proxy.frame(in: .global).minX / -30), axis: (x: 0, y: 1, z: 0))
                        //.padding(.vertical)
                        .padding(.top)
                        .offset(y: -30)
                        .offset(x: proxy.frame(in: .global).minX-195 / 2)
                )
        }
    }
}

struct LunchItem_Previews: PreviewProvider {
    static var previews: some View {
        LunchItem()
            .environmentObject(ContentModel())
            .dynamicTypeSize(.medium)
    }
}
