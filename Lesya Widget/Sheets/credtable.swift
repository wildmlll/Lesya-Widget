//  lesyawidget
//
//  Created by mll


import SwiftUI



struct CredTable: View {
    @EnvironmentObject var model: ContentModel

    
    var body: some View {
        
        
            
            VStack {
              
                ZStack{
                    Button(action: {
                        model.showingCredtable = false

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
                //.background(Color(UIColor.systemGray6))
                //.frame(width: 100, height: 60)
                
                NavigationView{
                    List{
                        VStack{
                            Text("Література:")
                                .leftAligned()
                                .bold()
                                .font(.system(size: 22))
                            Text("\nЦитати та рядки були взяті з різних літературних джерел, збірок та пісень.")
                                .leftAligned()
                            
                            Text("\nАвтори літературних творів:")
                                .leftAligned()
                                .bold()
                                .font(.system(size: 17.5))
                            Text("Андрухович Юрій Ігорович\nКостенко Ліна Василівна\nКосач Лариса Петрівна\nСтус Василь Семенович\nСимоненко Василь Андрійович\nШевченко Тарас Григорович")
                                .leftAligned()
                            Text("\nАвтори музичних творів:")
                                .leftAligned()
                                .bold()
                                .font(.system(size: 17.5))
                            /*Text("SadSvit +\nSad Novelist -\nSchmalgauzen -\nHate Optimists -\nalekkksa -\nBaWN -\nІгор Кайдаш -")*/
                            Text("SadSvit \nSad Novelist \nSchmalgauzen \nHate Optimists \nalekkksa \nBaWN \nІгор Кайдаш\n\nMade in Ukraine🇺🇦")
                                .leftAligned()
                                .padding(.bottom,0)
                         
                            
                            
                        }
                        
                            VStack(alignment: .leading) {
                                
                                HStack{
                                    Link("Наш вебсайт",
                                         destination: URL(string: "https://pmll.space")!)
                                    
                                    .font(.custom(
                                        "DIN Alternate",
                                        fixedSize: 17.5))
                                    
                                }
                                .frame(maxWidth: .infinity, alignment: .center)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.gray.opacity(0.14), in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .padding(.horizontal, 12)
                            //.padding(.bottom, -12)
                            .padding(.top, 0)
                            
                            
                            VStack(alignment: .leading) {
                                
                                HStack{
                                    Link("Privacy policy / Credits",
                                         destination: URL(string: "https://pmll.space/credits.html")!)
                                    
                                    .font(.custom(
                                        "DIN Alternate",
                                        fixedSize: 17.5))
                                    
                                }
                                .frame(maxWidth: .infinity, alignment: .center)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.gray.opacity(0.14), in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .padding(.horizontal, 12)
                            //.padding(.bottom, -12)
                            .padding(.top, 2)
                            .listRowSeparator(.hidden)
                        
                    }
                    .padding(.top,-15)
                    .scrollDisabled(true)
                    .foregroundColor( Color("ColorInverted"))
                }
            }
            //.background(Color("credtabbut"))
            //.background(Color("colforau"))
            .background(Color(UIColor.systemGray6))
           
        
    }
    
}

struct CredTable_Previews: PreviewProvider {
    static var previews: some View {
        CredTable()
            .environmentObject(ContentModel())
            .dynamicTypeSize(.medium)
    }
}

