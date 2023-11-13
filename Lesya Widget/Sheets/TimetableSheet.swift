//  lesyawidget
//
//  Created by mll

import SwiftUI

struct TimetableSheet: View {
    @EnvironmentObject var model: ContentModel
  
    
    var body: some View {

        
        VStack {
            
            ZStack{
                Button(action: {
                    model.showingTimetableSheet = false

                }) {
                    ZStack {
                        Text("Закрити")
                            .foregroundColor(Color("ColorInverted"))
                            .font(.body)
                            .padding(12)
                            .background(Color.gray.opacity(0.14), in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                        
                    }
                    
                }
                .padding(.top, 10)
                .padding(.horizontal, -180)
            }
            .frame(width: 200, height: 60)
            .foregroundColor( Color("ColorInverted"))
            .background(Color(UIColor.systemGray6))
            //.frame(width: 100, height: 60)
            NavigationView{
            List{
                
                
                Section{
                    Text("Інструкція встановлення віджета:")
                        .leftAligned()
                        .bold()
                        .font(.system(size: 17.5))
                        .listRowSeparator(.hidden)
                        .padding(.horizontal,-5)
                        
               
                    Text("1. Зажміть будь-яке вільне місце на початковому екрані.")
                        .leftAligned()
                        .padding(.top,5)
                        .listRowSeparator(.visible)
                        
                    
                        Text("2. Натисніть кнопку \"+\".")
                            .leftAligned()
                            .listRowSeparator(.hidden)
                        Image("how1")
                            .resizable()
                            .frame(width: 240, height: 170)
                            .padding(.horizontal,2)
                           .listRowSeparator(.visible)
                           
                    
                    
                    
                        Text("3. Впишіть в пошук \"lesyawidget\".")
                            .leftAligned()
                            .listRowSeparator(.hidden)
                        Image("how2")
                            .resizable()
                            .frame(width: 240, height: 170)
                            .padding(.horizontal,2)
                            .listRowSeparator(.visible)
                    
                    
                        Text("4. Додайте віджет.")
                            .leftAligned()
                            .listRowSeparator(.hidden)
                        Image("how3")
                            .resizable()
                            .frame(width: 240, height: 170)
                            .padding(.horizontal,2)
                    
                        
                    }
                .foregroundColor( Color("ColorInverted"))
                
                Section{
                    VStack{
                        Text("У випадку виникнення проблем:")
                            .leftAligned()
                            .bold()
                            .font(.system(size: 17.5))
                            .padding(.horizontal,-5)
                        Text("▸ Перезавантажте телефон.\n▸ Спробуйте видалити віджет з екрану.\n▸ Напишіть на пошту lesyawidgetmll@gmail.com інформацію про збій, ми вам допоможем.")
                            .leftAligned()
                    }
                    .foregroundColor( Color("ColorInverted"))
                }
            }
            .padding(.top,-15)
            //.background(Color(UIColor.systemGray6))
        }
            
           
            
        }
        .background(Color(UIColor.systemGray6))
    
        /*ZStack{
         Button(action: {
             model.showingTimetableSheet = false
         }) {
             ZStack {
                 Text("Повернутись")
                     .foregroundColor(.black)
                     .font(.body)
                     .padding(12)
                     .background(Color.gray.opacity(0.14), in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                 
             }
             
         }
         .padding(.top, 40)
         .padding(.horizontal, -170)
     }
     .frame(width: 800, height: 20)
     //.ignoresSafeArea()
     .background(Color(UIColor.systemGray6))*/
    
       
    
}
    
}

struct TimetableSheet_Previews: PreviewProvider {
    static var previews: some View {
        TimetableSheet()
            .environmentObject(ContentModel())
            .dynamicTypeSize(.medium)
    }
}
