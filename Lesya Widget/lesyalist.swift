//
//  ContentView.swift
//  lesyawidget
//
//  Created by mll on 21.08.2023.
//

import SwiftUI
import WidgetKit
import Foundation
import StoreKit
import UIKit



struct LeftAligned: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            content
            Spacer()
        }
    }
    
}


extension View {
    func leftAligned() -> some View {
        return self.modifier(LeftAligned())
    }
    func setPreferenceValue(_ value: Any?, forKey key: String, in appGroup: String) {
     
        if let groupUserDefaults = UserDefaults(suiteName: appGroup) {
            groupUserDefaults.set(value, forKey: key)
            print("Wrote to shared user defaults.")
     
        }
     
    }
    
    
    
    }


struct lesyalist: View {
    @EnvironmentObject var model: ContentModel
    @EnvironmentObject private var store: TipsStore
    @State private var showTips = false
    @State private var showThanks = false
    @State private var buttoncred = false
    @State private var toggle1: Bool = false
    @State private var toggle2: Bool = true
    @State private var toggle3: Bool = true
    init() {
        UIPageControl.appearance().pageIndicatorTintColor = .systemGray4
        }
   
    let appGroupIdentifier = "group.CY-8B58D0FE-CBF4-11E9-9B23-D3AF4E2A89B3.com.cydia.Extender"
   
 
  
        
        
    
        var body: some View {
            
            //!param
           
            
                VStack{
                    HStack{
                        
                        Button("Нова цитатка"){
                            WidgetCenter.shared.reloadAllTimelines()
                        }
                        .padding()
                        .background(Color("colorbutn"))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        
                        //.background(Image("butim"))
                        Image("uiappin")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .padding(.bottom, 2)
                        
                    }
                    .frame(width: 500)
                    .background(Color("Font"))
                    
                    NavigationView {
                        List {
                            
                            
                            VStack{
                                
                                let zitata = ["   \"Тяжко, тяжко в світі жить\n    І нікого не любить.\"","   \"Мова росте елементарно,\n    разом з душею народу.\"","   \"Мрія дає нуль,\n    якщо її не зробити життям.\"","   \"Ліпше вмерти біжучи,\n    ніж жити гниючи\"", "   \"Світ ловив мене,\n    та не спіймав\""]
                                let resz = zitata.randomElement()!
                                // Text("   \"Мова росте елементарно,\n    разом з душею народу.\"")
                                Text(resz)
                                    .leftAligned().frame(width: 355)
                                    .foregroundColor( Color("ColorInverted"))
                                if (resz == "   \"Тяжко, тяжко в світі жить\n    І нікого не любить.\""){
                                    Text("Тарас Шевченко    ")
                                        .frame(maxWidth: 400, alignment: .trailing)
                                        .foregroundColor( Color("ColorInverted"))
                                        .bold()
                                }
                                if (resz == "   \"Мрія дає нуль,\n    якщо її не зробити життям.\""){
                                    Text("Григорій Тютюнник    ")
                                        .frame(maxWidth: 400, alignment: .trailing)
                                        .foregroundColor( Color("ColorInverted"))
                                        .bold()
                                }
                                if (resz == "   \"Ліпше вмерти біжучи,\n    ніж жити гниючи\""){
                                    Text("Іван Багряний    ")
                                        .frame(maxWidth: 400, alignment: .trailing)
                                        .foregroundColor( Color("ColorInverted"))
                                        .bold()
                                }
                                if (resz == "   \"Світ ловив мене,\n    та не спіймав\""){
                                    Text("Григорій Сковорода    ")
                                        .frame(maxWidth: 400, alignment: .trailing)
                                        .foregroundColor( Color("ColorInverted"))
                                        .bold()
                                }
                                if (resz == "   \"Мова росте елементарно,\n    разом з душею народу.\""){
                                    Text("Іван Франко    ")
                                        .frame(maxWidth: 400, alignment: .trailing)
                                        .foregroundColor( Color("ColorInverted"))
                                        .bold()
                                }
                            }
                            
                            //.padding(.bottom, -10)
                            .padding(.top, 4)
                            .listRowSeparator(.hidden)
                            
                            Section{
                                ZStack{
                                    TabView {
                                        
                                        TimetableItem()
                                            .padding(.vertical)
                                            .onTapGesture {
                                                model.showingTimetableSheet = true
                                            }
                                        
                                        LunchItem()
                                            .padding(.vertical)
                                            .onTapGesture {
                                                model.showingLunchSheet = true
                                                
                                            }
                                        
                                    }
                                    .onAppear(){
                                        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color("UIPageControlgray"))
                                        
                                    }
                                    .indexViewStyle(.page(backgroundDisplayMode: .never))
                                    .tabViewStyle(.page(indexDisplayMode: .always))
                                    .frame(width: 360,height: 255)
                                    .sheet(isPresented: {$model.showingTimetableSheet}()) {TimetableSheet().dynamicTypeSize(.medium)}
                                    .sheet(isPresented: {$model.showingLunchSheet}()) {LunchSheet().dynamicTypeSize(.medium)}
                                    
                                }
                                .listRowBackground(Color.clear)
                                .listRowSeparator(.hidden)
                                
                            }
                            .padding(.bottom, -20)
                            .padding(.top,-10)
                            
                            Section{
                                
                                NavigationLink(destination: autorSheet().dynamicTypeSize(.medium)) {
                                    Text("Звідки цитатки?")
                                        .foregroundColor( Color("ColorInverted"))
                                }
                                .buttonStyle(PlainButtonStyle())
                                .foregroundStyle(Color.blue.opacity(2))
                                
                                /* NavigationLink(destination: autorSheet().dynamicTypeSize(.medium)) {
                                 Text("Налаштування цитат")
                                 .foregroundColor( Color("ColorInverted"))
                                 }
                                 .buttonStyle(PlainButtonStyle())
                                 .foregroundStyle(Color.blue.opacity(2))
                                 .onTapGesture {
                                 model.showingSettings = true
                                 }*/
                                
                            }
                            
                            Section{
                                VStack{
                                    
                                    ForEach(store.items) { item in
                                        configureProductVw(item)
                                    }
                                    .padding(.top, 5)
                                    
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .listRowSeparator(.hidden)
                                .padding(.bottom, -5)
                                
                                
                                VStack{
                                    Divider()
                                    VStack(alignment: .leading) {
                                        
                                        HStack{
                                            
                                            Link("Підтримати Україну",
                                                 destination: URL(string: "https://u24.gov.ua/")!)
                                            .font(.custom(
                                                "DIN Alternate",
                                                fixedSize: 17.5))
                                            .foregroundColor( Color("ColorInverted"))
                                            Text("▶️ ")
                                            
                                            
                                        }
                                        .frame(maxWidth: .infinity, alignment: .center)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding()
                                    .background(Color("blue0141"), in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                                    .padding(.horizontal, 12)
                                    .padding(.bottom, 2)
                                    .padding(.top, 6)
                                }
                            }
                            
                            
                            
                            //.buttonStyle(PlainButtonStyle())
                            
                            
                            
                            
                            Section{
                                
                                Toggle("Темний віджет", isOn: $toggle1)
                                    .onAppear {
                                        if let loadedState = UserDefaults(suiteName: appGroupIdentifier)?.bool(forKey: "ToggleStateKey") {
                                            toggle1 = loadedState
                                        }
                                    }
                                    .foregroundColor( Color("ColorInverted"))
                            }
                            .onChange(of: toggle1) { newValue in
                                //to do
                                setPreferenceValue(newValue, forKey: "ToggleStateKey", in: appGroupIdentifier);WidgetCenter.shared.reloadAllTimelines()}
                            VStack{
                                
                                Section{
                                    
                                    Toggle("Цитатки поетів", isOn: $toggle2)
                                        .onAppear {
                                            if let loadedState = UserDefaults(suiteName: appGroupIdentifier)?.bool(forKey: "ToggleStatePoet") {
                                                toggle2 = loadedState
                                            }
                                        }
                                        .foregroundColor( Color("ColorInverted"))
                                }
                                .onChange(of: toggle2) { newValue in
                                    if !newValue && !toggle3 {
                                        toggle2.toggle()
                                    }
                                    setPreferenceValue(newValue, forKey: "ToggleStatePoet", in: appGroupIdentifier);WidgetCenter.shared.reloadAllTimelines();}
                                .toggleStyle(CheckboxStyle())
                                Divider()
                                
                                Section{
                                    
                                    Toggle("Цитатки музикантів", isOn: $toggle3)
                                        .onAppear {
                                            if let loadedState = UserDefaults(suiteName: appGroupIdentifier)?.bool(forKey: "ToggleStateMuz") {
                                                toggle3 = loadedState
                                            }
                                        }
                                        .foregroundColor( Color("ColorInverted"))
                                }
                                .onChange(of: toggle3) { newValue in
                                    if !newValue && !toggle2 {
                                        toggle3.toggle()
                                    }
                                    setPreferenceValue(newValue, forKey: "ToggleStateMuz", in: appGroupIdentifier);WidgetCenter.shared.reloadAllTimelines();}
                                .toggleStyle(CheckboxStyle())
                                .padding(.bottom, 2)
                                .padding(.top, 3)
                            }
                            
                            Section{
                                VStack(alignment: .leading) {
                                    
                                    HStack{
                                        Text("Про нас / Credits")
                                            .font(.custom(
                                                "DIN Alternate",
                                                fixedSize: 17.5))
                                            .foregroundColor( Color("ColorInverted"))
                                    }
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .onTapGesture {
                                        model.showingCredtable = true
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(Color.gray.opacity(0.14), in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                                .padding(.horizontal, 12)
                                .padding(.bottom, 3)
                                .padding(.top, 0)
                                .sheet(isPresented: {$model.showingCredtable}()) {CredTable().dynamicTypeSize(.medium)}
                            }
                            .listRowBackground(Color.clear)
                            
                            //
                            
                            //poets
                            
                            //
                            
                        Section{
                            VStack{
                                
                                
                                VStack{
                                    
                                    Divider()
                                        .padding(.top,20)
                                    
                                    Text("©2023 lesyawidget")
                                        .foregroundColor( Color("ColorInverted"))
                                }
                                // .padding(.top, 10)
                            }
                            .listRowBackground(Color.clear)
                            .padding(.top,20)
                            .padding(.bottom, -15)
                        }
                        }
                        .padding(.top, -8)
                    }
                    .foregroundColor(.black)
                    .listStyle(InsetGroupedListStyle())
                    .overlay(alignment: .bottom) {
                        if showThanks {
                            
                            VStack(spacing: 8) {
                                
                                Text("Спасибі друже🐾")
                                    .font(.system(.title2, design: .rounded).bold())
                                    .multilineTextAlignment(.center)
                                    .foregroundColor( Color("ColorInverted"))
                                Text("Твій донат дуже важливий для мене.\nЯ витратив багато часу на розробку додатка. Бажаю приємного користування та завжди смачної кави.")
                                    .font(.system(.body, design: .rounded))
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom, 16)
                                    .foregroundColor( Color("ColorInverted"))
                                Button {
                                    showThanks.toggle()
                                } label: {
                                    Text("Закрити")
                                        .font(.system(.title3, design: .rounded).bold())
                                        .tint(.white)
                                        .frame(height: 60)
                                        .frame(maxWidth: .infinity)
                                        .background(.blue, in: RoundedRectangle(cornerRadius: 8,
                                                                                style: .continuous))
                                    
                                }
                            }
                            .padding(16)
                            .background(Color("colorpay"), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .padding(.horizontal, 8)
                            .transition(.move(edge: .bottom).combined(with: .opacity))
                        }
                    }
                    .overlay {
                        
                        if showTips {
                            Color.black.opacity(0.8)
                                .ignoresSafeArea()
                                .transition(.opacity)
                                .onTapGesture {
                                    showTips.toggle()
                                    
                                }
                            
                        }
                    }
                    .animation(.spring(), value: showTips)
                    .animation(.spring(), value: showThanks)
                    .onChange(of: store.action) { action in
                                    
                        if action == .successful {
                            
                            showTips = false
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                
                                showThanks.toggle()

                            }
                            
                            store.reset()
                        }
                        
                    }
                    .alert(isPresented: $store.hasError, error: store.error) { }
                    
                    
                }
                .background(Color("Font"))
            }
            }
            
        class ViewController: UIViewController {
            
            override func viewDidLoad() {
                super.viewDidLoad()
                overrideUserInterfaceStyle = .dark
               
            }
            
        }
        
        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                lesyalist()
                    .environmentObject(TipsStore())
                    .environmentObject(ContentModel())
            }
        }

private extension lesyalist {
    
    
    func configureProductVw(_ item: Product) -> some View {
        
        
        HStack {
            
            VStack() {
                Text(item.displayName)
                    .font(.custom(
                        "DIN Alternate",
                        fixedSize: 17))
                    .foregroundColor( Color("ColorInverted"))
            }
            .padding(.horizontal)
            
            Spacer()
            
            Button(item.displayPrice) {
                Task {
                    await store.purchase(item)
                }
            }

            .background(Color("blue0141"), in: RoundedRectangle(cornerRadius: 8, style: .continuous))
            .buttonStyle(.bordered)
            .tint(.clear)
            .font(.callout.bold())
            .padding(.horizontal)
            .foregroundColor( Color("ColorInverted"))
        }
        .padding(1.35)
        
    }
}

struct CheckboxStyle: ToggleStyle {
 
    func makeBody(configuration: Self.Configuration) -> some View {
 
        return HStack {
 
            configuration.label
 
            Spacer()
 
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(configuration.isOn ? Color("bluetest") : .gray)
                .font(.system(size: 20, weight: .bold, design: .default))
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
 
    }
}

struct ProductsListView: View {
    
    @EnvironmentObject private var store: TipsStore

    var body: some View {
        
        ForEach(store.items) { item in
            ProductView(item: item)
                .foregroundColor( Color("ColorInverted"))
        }
    }
}

struct ProductView: View {
    @EnvironmentObject private var store: TipsStore
    let item: Product
    var body: some View {
        HStack {
            
            VStack(alignment: .leading,
                   spacing: 3) {
                Text(item.displayName)
                    .font(.custom(
                        "DIN Alternate",
                        fixedSize: 17))   
                    .foregroundColor( Color("ColorInverted"))
            }
            
            Spacer()
            
            Button(item.displayPrice) {
                Task {
                    await store.purchase(item)
                }
            }
            .tint(.blue)
            .buttonStyle(.bordered)
            .font(.callout.bold())
        }
    }
}


