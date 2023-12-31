//
//  ProviderTaskView.swift
//  FinalCapstone
//
//  Created by Fahad Matlagitu on 31/12/2023.
//

import SwiftUI

struct ProviderTaskView: View {
    @StateObject var vm = ViewModel()
    var body: some View {
        ScrollView{
            VStack{
                Text("Tasks")
                    .font(.title)
                    .bold()
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
        }
        .onAppear {
            vm.fetchConsumerData()
            vm.fetchProviderData()
            vm.fetchServiceData()

        }
    }
}

#Preview {
    ProviderTaskView()
}
