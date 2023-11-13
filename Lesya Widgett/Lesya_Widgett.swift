//
//  lesyawidget
//  Поетичий Віджет
//
//  Created by mll on 21.08.2023.
//
//

import WidgetKit
import SwiftUI
import Intents
import Foundation
import UIKit

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }
        
        //
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
        
        //let _nextUpdate = Calendar.autoupdatingCurrent.date(byAdding: .day, value: 1, to: Calendar.autoupdatingCurrent.startOfDay(for: Date()))!
        
    }
}
///NEW TIME LINE
//Calendar.startOfDay
// let nextUpdate = Calendar.autoupdatingCurrent.date(byAdding: .day, value: 1, to: Calendar.autoupdatingCurrent.startOfDay(for: Date()))!


struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}


struct Lesya_WidgetEntryView : View {
    var entry: Provider.Entry
    let appGroupIdentifier = "group.CY-8B58D0FE-CBF4-11E9-9B23-D3AF4E2A89B3.com.cydia.Extender"
    func setPreferenceValue(_ value: Any?, forKey key: String, in appGroup: String) {
     
        if let groupUserDefaults = UserDefaults(suiteName: appGroup) {
            groupUserDefaults.set(value, forKey: key)
            print("Wrote to shared user defaults.")
     
        }
     
    }
    
    func addArrays(_ array1: [String], _ array2: [String]) -> [String] {
      var result = array1
      result.append(contentsOf: array2)
      return result
    }
    
    func deleteArray(_ array1: [String], _ array2: [String]) -> [String] {

      var result = array1

      for element in array2 {
        if let index = result.firstIndex(of: element) {
          result.remove(at: index)
        }
      }

      return result
    }
    
    let simonenko =
        ["Бо в тобі — великого народу \nНіжна і замріяна душа.",
        "І, бувало б, темніла зірка \nУ тумані тривожних дум.",
        "Ми ще йдемо. Ти щось мені говориш.\nТвоя краса цвіте в моїх очах.",
        "Ми ще йдемо. Ти щось мені говориш. \nТвоя краса цвіте в моїх очах.",
        "І час неспинний, стиснувши остроги, \nНад ними чвалить вранці і вночі.",
        "Все стерпить, хіба заплаче стиха, \nДивлячись на добрих малюків.",
        "Ти до мене прийшла не із казки чи сну, \nІ здалося мені, що стрічаю весну."]
    
    let andruhovich =
    ["Беріть мене, панове чортівня! \nТягніть у вир, де душу розітнуть.",
     "Може, у тім і спасіння - пізнати\nцю пору, ніби останнє цвітіння.\nЄдине.",
     "Ти — мить свого народу, тільки мить.",
     "Україна ж — це країна барокко. \nМандрувати нею — для ока втіха.",
     "Я з розпуки тут ошаліти можу - \nвену вріжу, скажімо, чи всіх заріжу.",
     "Любий друже, приїдь, порятуй і вибав! \nПривези мені морфій, тютюн і тишу."]
    
    let lesya =
    ["Вітер зітха, мов дріада сумує,\nІз жалем глухим.",
    "З плачем ждемо тії години,\nКоли спадуть кайдани нас.",
    "Ні долі, ні волі у мене нема,\nЗосталася тільки надія одна.",
     "І страшніші, ніж сонні кошмари,\nТі привиддя безсонної ночі.",
     "Як зійде сонце правди та згоди,\nЯ тоді вічним сном буду спати.",
     "Сни мої щасливі!\nЯ люблю вас, хоч і знаю,\nЩо ви всі зрадливі…",
     "І знову прийдеться покинутій мені\nНе жити, а нести життя своє, мов кару.",
     "Чого ж се я слідом за ним блукаю?\nЧого? Сама не знаю.",
     "Не жаль мені, що я тебе кохаю,\nТа в нас дороги різно розійшлись.",
     "І знову замовкне… як глухо, як тихо…\nОй лихо!",
     "Нехай палає, не дає спокою,\nПоки душа терпіти силу має.",
     "Хай серце плаче, б’ється, рветься з туги,\nХай не дає спокою, хай палає."]
    
    let shevchenko =
    ["Ходімо дальше, дальше слава,\nА слава — заповідь моя.",
    "Нехай собі. А бог поможе,\nІ так забудеться колись.",
    "Ой піду я боса полем,\nПошукаю свою долю.",
    "І мертвим, і живим, і ненарожденним.",
    "Лежить попіл на розпутті,\nА в попелі тліє\nІскра вогню великого.",
    "Он піду я степом-лугом\nТа розважу свою тугу.",
    "Ну що б, здавалося, слова…\nСлова та голос — більш нічого.",
    "Щоб потім сміятись,\nЩоб з тебе сміятись,\nЩоб тебе добити…"]
    
    let kostenko =
    ["І раптом нявкнув кольоровий кіт.\nЗалив чорнилом вирок на папері.",
    "Вже леви ждуть, і жде моя арена.\nЖиття, мабуть,— це завжди Колізей.",
    "Я вибрала Долю собі сама.\nІ що зі мною не станеться, –\nу мене жодних претензій нема",
    "Не треба класти руку на плече.\nЦей рух доречний, може, тільки в танці.",
    "Хай буде легко. Це був тільки сон,\nщо ледь торкнувся пам’яті вустами.",
    "Душа до краю добрела.\nТакої дивної отрути\nя ще ніколи не пила.",
    "А й правда,\nкрилатим ґрунту не треба.\nЗемлі немає, то буде небо.",
    "Людина нібито не літає…\nА крила має. А крила має!",
    "…І не дивуй, що я прийду зненацька.\nМені ще ж побороти переляк.",
    "Але чому я думаю про Вас?\nЯ Вас давно забути вже повинна."]
    let stus =
    ["І подушка моя скуйовджена,\nі скуйовджена голова.",
    "Мені здається, що живу не я,\nа інший хтось живе за мене в світі",
    "Рушай вперед. І добротою хворий,\nрозтань росою димною між трав.",
    "Утрачено останні сподівання,\nНарешті — вільний, вільний, вільний ти.",
    "Пірнаю в ночі, наче в сни,\nдо ранку не прочахну.",
    "Ми сиділи за пляшкою шампанського\nв тихенькому прокуреному кафе.",
    "З білої потойбічності\nвиринуло чорне сонце.",
    "Весняний вечір. Молоді тумани.\nНеон проспектів. Туга ліхтарів.",
    "О не дивуй, о не дивуй мені —\nмоє життя для тебе не збагненне.",
    "Цей біль — як алкоголь агоній,\nяк вимерзлий до хрусту жаль."]
    let izdr =
    ["Краще обходити збоку все необхідне\nКраще не підбирати з дороги піщинок",
    "Годі шукати на небі підказок і натяків,\nгоді пройти вздовж межі уникаючи ризиків",
    "Зоряні війни здаються невчасними,\nвчасним здається рай.",
    "Ниті між нами тонкі й невидимі,\nпрірва між нами глибока і темна.",
     "Є час коли світ починають двоє,\nі час коли двох розділяє світ.",
    "Усе що триває – триває у часі,\nа все що стається залежить від нас.",
    "Але проступають пророцтва забуті,\nі стеляться світом зневіра і страх.",
    "Нема людини – спіймає звіра,\nне зловить звіра – віднайде бога.",
    "Ах які ж ми були..\nОх якими ж ми стали..",
    "Заборгував від різдва комуналку,\nспиздив дві книжки з бібліотеки."]
    
    
    let sadsvit =
    ["холодні руки малюють,\nбезбарвні, правда, пейзажі.",
    "памʼятай мене, памʼятай свій дім,\nі не забувай, він є ще твоїм.",
    "я хотів би в небі забутись,\nі нічого в світі не знати",
    "зімкнемося лиш тілами як захочемо,\nзмушені лічити дні й кохати ночі.",
    "я поглянув тобі в очі,\nсилуети кажуть, що там спокій.",
    "та зігрівся з радістю я вогнищем,\nвсі рани раптом знову кровоточяться",
    "ти не забувай смак моїх вуст\nне відпускай цей світ безумств.",
    "де твоя душа,\nзагублена навіки серед днів?",
    "закон свободи - це наш ґрунт\nховайся, чорт, ми всі живі.",
    "під звуки касет ми з тобою вдвох,\nзаснемо навіки без турбот та зла."]
    let novelist =
    ["ти розлючена у вибух, втягуєш амоніак,\nа ти спитала мені як?",
    "якщо від вин уста твої червоні,\nя тривожусь у безсонні…",
    "я хотів би в небі забутись,\nі нічого в світі не знати",
    "зімкнемося лиш тілами як захочемо,\nзмушені лічити дні й кохати ночі.",
    "я б користував свої вуста,\nмов пензлик, твоє тіло - полотно…",
     "і гублюся поміж вітру,\nлегіт в розумі панує "]
    let hateop =
    ["сірі стіни у квартирі,\nа на них гуляють тіні.",
    "як шкода, що це був сон,\nя потрапив в твій полон.",
    "і твоє кроваве обличчя,\nприкрасить моє житло.",
    "навіщо щось робити,\nколи всеодно покину…",
    "старі будинки покрилися снігом,\nвони так втомилися, чекаючи літа…"]
    let kaidash =
    ["бачити, бачити твої очі востаннє,\nсмертельно боляче,  справді\nцього вартує кохання моє.",
    "не думай плакати, хоча, як хоч - реви\nвсерівно не відчую на плечі сльози твої.",
    "знову дежавю,\nзникло все, що так люблю.",
    "моя юність вже позаду,\nале я ще не дорослий.",
    "розбите серце, ціла пляшка,\nвідкривши очі стало тяжко…",
    "останні день свого життя,\nостанній день і все, пітьма…"]
    let bawn =
    ["наче картина митця,\nя прощаюсь з тобою…",
    "по серед ночі і повній самоті,\nя рахую думки на мідній струні.",
    "знаєш, мертві теж кохають,\nхоч не чують твоіх сліз.",
    "себе по сьогодні я не пробачив,\nщо недостатньо казав, що люблю.",
    "вже завтра ми повернемося\nу звичайні життя, де на відстані\nкілометру були наші серця.",
    "Залишились лиш спогади,\n де ми під дощем гуляєм.."]
    let alekkksa =
    ["мої руки холодні, як твоя душа,\nтвоя правда виглядає,\nяк суцільна брехня.",
    "ти аміак який я вдихаю,\nкривавий опік на собі памʼятаю.",
    "крізь очниці вікна -\nодна життєва мелодрама",
    "я блукаю по дорозі, де холодні двори.\nз неба дощ омиває мої гріхи.",
    "шепіт вітрів розкидає краплини,\nловлю твій погляд, твої очі перлини.",
     "вже достатньо твоїх слів,\nде не видно справжніх дій."]
    let shmalgauzen =
    ["губи твої — це лаванда,\nщо упали з висоти!",
    "колір правди точно знаю —\nвін прозорий, шкода ж як...",
    "ми море впихнули у ванну,\nа в ліжку втопили бордель...",
    "через тебе підсів на романи,\nабзаци обводжу і скормлюю псам.",
    "моє вчора тепер уже завтра,\nмоя смерть тепер це любов!..",
    "а ти рожевим молотом,\nз дияволом на \"ти\".",
    "твої сліди живуть в мені,\nі ти - це дні, що живуть на дні.",
    "портрет, що на стіні,\nгорить нехай у вогні.",
    "все ж вночі одна сниться,\nі очі ті для мене як в'язниця."]
    @State public var n1 = true
    let cont = Int.random(in: 0..<1)
    
    
    
    
    
    var body: some View {
       let tvir = [simonenko.randomElement()!, andruhovich.randomElement()!, lesya.randomElement()!, shevchenko.randomElement()!,
                    kostenko.randomElement()!,
                   stus.randomElement()!, izdr.randomElement()!,
                    sadsvit.randomElement()!, shmalgauzen.randomElement()!, alekkksa.randomElement()!, bawn.randomElement()!, kaidash.randomElement()!, hateop.randomElement()!,  novelist.randomElement()!]
        
        let tvirpoet = [simonenko.randomElement()!, andruhovich.randomElement()!, lesya.randomElement()!, shevchenko.randomElement()!,
                        kostenko.randomElement()!,
                        stus.randomElement()!, izdr.randomElement()!]
        let tvirmuz = [sadsvit.randomElement()!, shmalgauzen.randomElement()!, alekkksa.randomElement()!, bawn.randomElement()!, kaidash.randomElement()!, hateop.randomElement()!,  novelist.randomElement()!]
        // CHECK let tvir = [simonenko.randomElement()!, andruhovich.randomElement()!]
        let tvirmain = tvir.randomElement()!

        ZStack{
            let bglg = ["bgl1","bgl3","bgl6","bgl7","bgl1","bgl8","bgl5"]
           //let bglpatr = ["pt11","pt22","pt33","pt55","pt66","pt77","pt88"]
            //let bgpatr = "pt"
            let colpal = [0xccccda, 0xc3c2cc, 0xc7d9d8, 0xb9e2e1, 0xccdacd, 0xd3d9c7, 0xcad9c7,0xd7eed3,0xcdecd8, 0xcee0c8]
            let colpaldark = [0x444555, 0x434344, 0x335555, 0x445544, 0x494C44, 0x445544]
            let bgran = bglg.randomElement()!
           // let bgran = bglpatr.randomElement()! Nmain
            //let bgran = bgpatr
            let bgcol = colpal.randomElement()!
            let bgcoldark = colpaldark.randomElement()!
           // Color(UIColor(rgb: bgcol))
            Color(UIColor(rgb: bgcol))
            Image(bgran)
            
            /*Text(tvirmain)
                .font(.custom(
                    "DIN Alternate",
                    fixedSize: 17.4))
                .foregroundStyle(.black)*/
            
            if let groupUserDefaults = UserDefaults(suiteName: "group.CY-8B58D0FE-CBF4-11E9-9B23-D3AF4E2A89B3.com.cydia.Extender") {
                
               
                    
                
                
                if let backgroundColor = (groupUserDefaults.object(forKey: "ToggleStateKey")) as? Bool {
                    if backgroundColor == true {
                        Color(UIColor(rgb: bgcoldark))
                        Image(bgran)
                        if let backgroundText5 = (groupUserDefaults.object(forKey: "ToggleStatePoet")) as? Bool{
                        
                        if let backgroundText55 = (groupUserDefaults.object(forKey: "ToggleStateMuz")) as? Bool{
                            if backgroundText5 == true, backgroundText55 == true{
                                Text(tvirmain)
                                    .font(.custom(
                                        "DIN Alternate",
                                        fixedSize: 17.4))
                                    .foregroundStyle(.white)
                            }
                            if backgroundText5 == false, backgroundText55 == true{
                                Text(tvirmuz.randomElement()!)
                                    .font(.custom(
                                        "DIN Alternate",
                                        fixedSize: 17.4))
                                    .foregroundStyle(.white)
                            }
                            if backgroundText5 == true, backgroundText55 == false{
                                Text(tvirpoet.randomElement()!)
                                    .font(.custom(
                                        "DIN Alternate",
                                        fixedSize: 17.4))
                                    .foregroundStyle(.white)
                            }
                            if backgroundText5 == false, backgroundText55 == false{
                                Text(tvirmain)
                                    .font(.custom(
                                        "DIN Alternate",
                                        fixedSize: 17.4))
                                    .foregroundStyle(.white)
                            }
                        }
                        else{
                            Text(tvirmain)
                                .font(.custom(
                                    "DIN Alternate",
                                    fixedSize: 17.4))
                                .foregroundStyle(.black)

                        }
                    }
                        
                    }
                    
                    else{
                        Color(UIColor(rgb: bgcol))
                        Image(bgran)
                        if let backgroundText5 = (groupUserDefaults.object(forKey: "ToggleStatePoet")) as? Bool{
                        
                        if let backgroundText55 = (groupUserDefaults.object(forKey: "ToggleStateMuz")) as? Bool{
                            if backgroundText5 == true, backgroundText55 == true{
                                Text(tvirmain)
                                    .font(.custom(
                                        "DIN Alternate",
                                        fixedSize: 17.4))
                                    .foregroundStyle(.black)
                            }
                            if backgroundText5 == false, backgroundText55 == true{
                                Text(tvirmuz.randomElement()!)
                                    .font(.custom(
                                        "DIN Alternate",
                                        fixedSize: 17.4))
                                    .foregroundStyle(.black)
                            }
                            if backgroundText5 == true, backgroundText55 == false{
                                Text(tvirpoet.randomElement()!)
                                    .font(.custom(
                                        "DIN Alternate",
                                        fixedSize: 17.4))
                                    .foregroundStyle(.black)
                            }
                            if backgroundText5 == false, backgroundText55 == false{
                                Text(tvirmain)
                                    .font(.custom(
                                        "DIN Alternate",
                                        fixedSize: 17.4))
                                    .foregroundStyle(.black)
                            }
                        }
                        else{
                            Text(tvirmain)
                                .font(.custom(
                                    "DIN Alternate",
                                    fixedSize: 17.4))
                                .foregroundStyle(.white)

                        }
                    }
                   
                    }
                }
            }
            else{
                Text(tvirmain)
                .font(.custom(
                            "DIN Alternate",
                            fixedSize: 17.4))
                .foregroundStyle(.white)

            }
            
           
            
            
            
            
            
            
            
            
            
            /*ZStack{
                Text(tvirmain)
                    .font(.custom(
                        "DIN Alternate",
                        fixedSize: 17.4))
                    .foregroundStyle(.black)
                    
                //Text("Симоненко В. A.")
               //  .font(.custom("DIN Alternate",fixedSize: 10))
               //  .italic()
                // .padding(.top, 80)
                // .padding(.trailing, 0)
                 //.foregroundColor(Color(UIColor(rgb: 0x242424)))
                 //.foregroundColor(Color(UIColor(rgb: colpal.randomElement()!)))
            }*/
            
        }
        .widgetBackground(Color.white)
            
        
    }
    
}

extension View {
    func widgetBackground(_ backgroundView: some View) -> some View {
        if #available(iOSApplicationExtension 17.0, *) {
            return containerBackground(for: .widget) {
                backgroundView
            }
        } else {
            return background(backgroundView)
        }
    }
    
    
}

struct Lesya_Widget: Widget {
    let kind: String = "Lesya_Widget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            Lesya_WidgetEntryView(entry: entry)
            
        }
        .configurationDisplayName("Віджет з цитатою")
        .description("Вірші на екрані прибирають рани на душі.")
        .supportedFamilies([.systemMedium])
        
       
      
    }
}


struct Lesya_Widget_Previews: PreviewProvider {
    static var previews: some View {
        Lesya_WidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
