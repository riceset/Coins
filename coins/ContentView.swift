import SwiftUI

struct ContentView: View {
    @State private var flipped = false
    @State private var animationAmount = 0.0
    
    func flipTheCoin() {
        flipped = Bool.random()
        animationAmount += 360
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                    Button(action: {
                        flipTheCoin()
                    }, label: {
                        Image(flipped ? "back" : "front")
                            .renderingMode(.original)
                            .resizable()
                            .shadow(color: .black, radius: 10, y: 12)
                            .frame(width: 250, height: 250)
                            .rotation3DEffect(self.flipped ? Angle(degrees: 180): Angle(degrees: 0), axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))
                            .rotation3DEffect(
                                .degrees(animationAmount),
                                axis: (x: 0.0, y: 1.0, z: 0.0))
                            .animation(.default)
                            .onTapGesture {
                                flipTheCoin()
                            }
                    })
                
                Spacer()
                Button(action: {
                    flipTheCoin()
                }, label: {
                    Text("Flip the coin")
                        .font(.largeTitle)
                })
                Spacer()
            }
            .navigationBarTitle("Coins")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
