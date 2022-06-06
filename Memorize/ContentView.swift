import SwiftUI

struct ContentView: View {
    var emoji = ["⛴","✈️", "🚘", "🚌", "🧩", "🛵"
                 ,"🎤", "🎧", "🎼", "🥁", "🎲", "🎳"
                 , "🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉"]
    @State var emojiCount = 8
    var body: some View {
        VStack{
            ScrollView(showsIndicators: false){
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]){
                    ForEach(emoji[0..<emojiCount], id: \.self){ element in
                        CardView(content: element)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
                Spacer(minLength: 10)
                HStack{
                    remove
                    Spacer()
                    add
                }
                .font(.largeTitle)
            }
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
    
    var remove: some View{
        Button(action: {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        }, label: {
            Image(systemName: "minus.circle")
        })
    }
    
    var add: some View{
        Button(action: {
            if emojiCount < emoji.count {
                emojiCount += 1
            }
            
        }, label: {
            Image(systemName: "plus.circle")
        })
    }
    
}

struct CardView: View {
    var content: String
    @State var isFaceup: Bool = true
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceup{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            }else{
                shape.fill()
            }
        }
        .onTapGesture {
            self.isFaceup.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
