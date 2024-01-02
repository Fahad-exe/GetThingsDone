//
//  DashBoardView.swift
//  FinalCapstone
//
//  Created by Fahad Matlagitu on 24/12/2023.
//

import SwiftUI

struct CustomerHomeView: View {
    @State  var rectangleSize: CGSize = CGSize(width: 400, height: 324)
    @State  var dragOffset: CGSize = .zero
    @StateObject var vm = ViewModel()
    var body: some View {
        
        ScrollView(showsIndicators:false){
            LazyVStack{
                ForEach(vm.consumer) { consumers in
                    VStack{
                        Image("consumer")
                            .resizable().aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .padding(.top,16)
                            .foregroundStyle(.invertedBK)
                        Text(consumers.name)
                            .foregroundStyle(.invertedBK)
                        Text(consumers.address)
                            .foregroundStyle(.invertedBK)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    .padding()
                    .frame(idealWidth: 400,maxWidth: .infinity, maxHeight: .infinity)
                    .background(UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(bottomLeading: 16,bottomTrailing:16)).fill(.dashclr).shadow(radius: 3,y:10))
                }
                
                
                //                    .frame(width: rectangleSize.width, height: rectangleSize.height)
                //
                //                )
                //                .gesture(
                //                    DragGesture()
                //                        .onChanged { value in
                //                            dragOffset = value.translation
                //                        }
                //                        .onEnded { value in
                //                            let swipeThreshold: CGFloat = 50
                //                            if dragOffset.height > swipeThreshold {
                //                                // Swipe down
                //                                rectangleSize = CGSize(width: rectangleSize.width, height: rectangleSize.height * 2)
                //                            } else if dragOffset.height < -swipeThreshold {
                //                                // Swipe up
                //                                rectangleSize = CGSize(width: rectangleSize.width, height: rectangleSize.height / 2)
                //                            }
                //
                //                            dragOffset = .zero
                //                        }
                //                )
                .padding(.vertical)
                
                VStack{
                    HStack{
                        Text("22/12/2023")
                            .foregroundStyle(.invertedBK)
                        Spacer()
                        Text("⏲ 2H")
                            .foregroundStyle(.BK)
                            .background(RoundedRectangle(cornerRadius: 16).fill(.invertedBK).frame(width: 72, height: 32))
                            .padding(.horizontal)
                        Text("In progress")
                            .foregroundStyle(.black)
                            .background(RoundedRectangle(cornerRadius: 16).fill(.yellow).frame(width: 103, height: 32))
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity,alignment:.leading)
                    Text("AC condesner with 3 outdoor units maintance")
                        .font(.title3)
                        .bold()
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment:.leading)
                        .foregroundStyle(.invertedBK)
                    Text("16 hours left")
                        .bold()
                        .padding(.horizontal)
                        .foregroundStyle(.red)
                        .frame(maxWidth: .infinity,alignment: .leading)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 16).fill(.dashclr).shadow(radius: 1))
                .padding()
                Text("Completed Tasks")
                    .foregroundStyle(.black.opacity(0.4))
                    .padding()
                    .frame(maxWidth: .infinity,alignment: .leading)
                ForEach(vm.service){ services in
                    VStack{
                        HStack{
                            Text("22/12/2023")
                                .foregroundStyle(.invertedBK)
                            Spacer()
                            
                            Text(services.status)
                                .foregroundStyle(.invertedBK)
                                .background(RoundedRectangle(cornerRadius: 16).fill(.green.opacity(0.4)).frame(width: 103, height: 32))
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity,alignment:.leading)
                        Text(services.description)
                            .font(.title3)
                            .bold()
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment:.leading)
                            .foregroundStyle(.invertedBK)
                        Text("Completed at 20/12/2023")
                            .bold()
                            .padding(.horizontal)
                            .padding(.vertical,8)
                            .foregroundStyle(.green.opacity(0.8))
                            .frame(maxWidth: .infinity,alignment: .leading)
                        ForEach(vm.provider){ providers in
                            HStack{
                                Image(systemName: "person")
                                    .padding(.horizontal)
                                VStack{
                                    Text(providers.name)
                                        .frame(maxWidth: .infinity,alignment:.leading)
                                        .foregroundStyle(.invertedBK)
                                    Text("\(providers.id)")
                                        .frame(maxWidth: .infinity,alignment:.leading)
                                        .foregroundStyle(.invertedBK)
                                }
                                
                                
                                Image(systemName: "star.fill")
                                    .padding(.horizontal)
                                    .foregroundStyle(.yellow)
                                Text("4.7")
                                    .foregroundStyle(.invertedBK)
                                
                                
                            }
                        }
                    }
                    .padding()
                    .frame(width: 327, height: 200)
                    .background(RoundedRectangle(cornerRadius: 16).fill(.dashclr).shadow(radius: 1))
                    .padding()
                }
            }
            
            .padding(.vertical)
            
        }
        .onAppear {
            vm.fetchConsumerData()
            vm.fetchProviderData()
            vm.fetchServiceData()
            
            
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    CustomerHomeView()
}
