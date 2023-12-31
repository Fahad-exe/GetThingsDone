import SwiftUI

struct Onbording: Identifiable{
    var id = UUID()
    var image: String
    var title: String
}

let images: [Onbording] = [
    Onbording(
        image: "Image 1",
        title: "Get easy managing tasks with all information you need"),
    Onbording(
        image: "Image 2",
        title: "Get help to support your work with knowledge library"),
    Onbording(
        image: "Image 3",
        title: "Get everything done and get paid"),
]


struct OnBoardingView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var current = 0
    @State var isCliced: Bool = false
    @Binding var Entered: Bool
    
    
    var body: some View {
        VStack{
            if isCliced {
                ProviderRootView()
                
            }else{
                if Entered == false {
                    ZStack {
                        Color((colorScheme == .light ? "bck" : "bck"))
                            .ignoresSafeArea()
                        
                        VStack {
                            Text(NSLocalizedString("get_things_done", comment: ""))
                                .font(.title)
                                .foregroundColor(colorScheme == .light ? .black : .white)
                            
                            TabView(selection: $current){
                                ForEach(0..<3) { boarding in
                                    VStack{
                                        Image(images[boarding].image)
                                            .resizable()
                                            .frame(width: 295 , height: 417)
                                        Text(NSLocalizedString(images[boarding].title, comment: ""))
                                            .bold()
                                            .foregroundColor(colorScheme == .light ? .black : .white)
                                        
                                            .font(.system(size: 20))
                                            .multilineTextAlignment(.center)
                                            .padding()
                                    }
                                }
                                
                            }
                            .tabViewStyle(PageTabViewStyle.init(indexDisplayMode: .never))
                            HStack{
                                ForEach(0 ..< 3){ i in
                                    if i == current {
                                        Circle()
                                            .frame(width: 10 , height: 10)
                                            .foregroundColor(colorScheme == .light ? Color("btn") : Color("btn"))
                                        
                                    } else {
                                        Circle()
                                            .frame(width: 10 , height: 10)
                                            .foregroundColor(Color.gray.opacity(0.3))
                                    }
                                }
                            }
                            
                            if current == 2 {
                                Button(action: {
                                    Entered.toggle()
                                    isCliced.toggle()
                                }, label: {
                                    Text(NSLocalizedString("lets_go", comment: ""))
                                        .padding()
                                        .foregroundColor(.white)
                                        .frame(width: 300, height: 50)
                                        .background(
                                            RoundedRectangle(cornerRadius: 18)
                                                .foregroundColor(Color.orange)
                                        )
                                        .padding()
                                })
                                .navigationBarBackButtonHidden(true)
                                .padding(.horizontal)
                            }
                            
                            Spacer()
                        }
                    }
                    
                }
            }
        }
    }
}

//#Preview {
//    OnBoardingView()
//}
