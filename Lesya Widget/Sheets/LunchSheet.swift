//  lesyawidget
//
//  Created by mll

import SwiftUI

struct LunchSheet: View {
    @EnvironmentObject var model: ContentModel
    
    
    var body: some View {
        
        
        VStack {
            ZStack{
                Button(action: {
                    model.showingLunchSheet = false

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
            //.ignoresSafeArea()
            .background(Color(UIColor.systemGray6))
            //.frame(width: 100, height: 60)
            NavigationView{
                List{
                    
                    Section{
                        VStack{
                            Text("Головне про віджет:")
                                .leftAligned()
                                .bold()
                                .font(.system(size: 17.5))
                            Text("▸ У віджетах є рядочки з літератури та музики.\n▸ Темний віджет початково ввімкнений.\n▸ Віджет оновлюється кожні 1-4 години автоматично.\n▸ Фон та колір віджета не залежить від рядків.")
                                .leftAligned()
                        }
                        
                    }
                    Section{
                        VStack{
                            Text("Головне про додаток:")
                                .leftAligned()
                                .bold()
                                .font(.system(size: 17.5))
                            Text("▸ У додатку ви можете знайти інформацію про поетів та музикантів.\n▸ Кнопка \"Нова цитатка\" завчасно оновлює віджет.\n▸ Перемикач \"Темний віджет\" включає кастомні кольори додатку.\n")
                                .leftAligned()
                        }
                        
                    }
                }
                .padding(.top,-15)
                .scrollDisabled(true)
                .foregroundColor( Color("ColorInverted"))
            }
            
            
        }
        .background(Color(UIColor.systemGray6))
        
    
       
    
}

}

struct LunchSheet_Previews: PreviewProvider {
    static var previews: some View {
        LunchSheet()
            .environmentObject(ContentModel())
            .dynamicTypeSize(.medium)
    }
}
