//
//  ContentView.swift
//  RockPaperScissorsApp
//
//  Created by Райымбек Есетов on 12.04.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("BackgroundImage")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Welcome to the game!")
                        .font(.system(size: 54, weight: .bold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, 70)
                    Spacer()
                    NavigationLink {
                        singlePlayerPage()
                    } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: 358, height: 50)
                            .foregroundColor(Color(red: 0.4, green: 0.31, blue: 0.64))
                        Text("Single player")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                    }
                    }
                    
                    NavigationLink {
                        MultiPlayerPage()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(width: 358, height: 50)
                                .foregroundColor(Color(red: 0.4, green: 0.31, blue: 0.64))
                            Text("Multiplayer")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                        }
                    }
                }
            }
        }
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct singlePlayerPage: View {
    @Environment(\.presentationMode) private var presentationMode2: Binding<PresentationMode>
    @State var paper: Bool = false
    @State var scissors: Bool = false
    @State var rock: Bool = false
    @State var shower: Bool = true
    @State var contin: Bool = false
    @State var shouldShowDetail: Bool = false
    
    var body: some View {
        VStack {
            if !scissors, !rock, !paper {
                Text("Take your pick")
                    .font(.system(size: 54, weight: .bold))
                    .padding(.top, 40)
                    .padding(.bottom, 3)
            }
            if rock == true || paper == true || scissors == true {
                Text("Your pick")
                    .font(.system(size: 54, weight: .bold))
                    .padding(.top, 40)
                    .padding(.bottom, 3)
            }
            Text("Player 1 • Score 0:0")
                .font(.system(size: 17, weight: .medium))
                .foregroundColor(Color(red: 0.4, green: 0.31, blue: 0.64))
                .padding(.bottom, 65)
            
            
            if !scissors, !rock {
                Button {
                    withAnimation(.spring()) {
                        paper.toggle()
                        shower.toggle()
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 48)
                            .frame(width: 342, height: 128)
                            .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.97))
                            .padding(.bottom, 12)
                        Text("📃")
                            .frame(height: 80)
                            .font(.system(size: 80, weight: .medium))
                    }
                }
            }
            
            
            if !paper, !rock {
                Button {
                    withAnimation(.spring()) {
                        scissors.toggle()
                        shower.toggle()
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 48)
                            .frame(width: 342, height: 128)
                            .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.97))
                            .padding(.bottom, 12)
                        Text("✂️")
                            .frame(height: 80)
                            .font(.system(size: 80, weight: .medium))
                    }
                }
            }
            
            
            if !paper, !scissors {
                Button {
                    withAnimation(.spring()) {
                        rock.toggle()
                        shower.toggle()
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 48)
                            .frame(width: 342, height: 128)
                            .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.97))
                            .padding(.bottom, 12)
                        Text("🗿")
                            .frame(height: 80)
                            .font(.system(size: 80, weight: .medium))
                    }
                }
            }
            
            if !shower {
                Button(action: {withAnimation(.spring()) {
                    rock = false
                    paper = false
                    scissors = false
                    shower.toggle()
                }}) {
                    VStack {
                        ZStack() {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(width: 358, height: 50)
                                .foregroundColor(Color(red: 0.4, green: 0.31, blue: 0.64))
                            Text("I changed my mind")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                        }
                        
                    }
                }
            }
            if !shower {
                Button {
                    withAnimation(.spring()) {
                        shouldShowDetail.toggle()
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: 358, height: 50)
                            .foregroundColor(Color(red: 0.4, green: 0.31, blue: 0.64))
                        NavigationLink("Continue", destination: singlePlayWait(paper: $paper, rock: $rock, scissors: $scissors),
                                       isActive: $shouldShowDetail)
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                    }
                }
            }
        }
        
        
        
        .navigationBarBackButtonHidden(true)
        .toolbar(content: {
            ToolbarItem (placement: .navigationBarLeading)  {
                
                Button(action: {
                    presentationMode2.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color(red: 0.4, green: 0.31, blue: 0.64))
                        .bold()
                })
            }
        })
    }
}




struct singlePlayWait: View {
    @State var nextView: Bool = false
    @State var shouldShow: Bool = false
    @Binding var paper: Bool
    @Binding var rock: Bool
    @Binding var scissors: Bool
    
    var body: some View {
        VStack {
            Text("Your \nopponent is \nthinking")
                .font(.system(size: 52, weight: .bold))
                .padding(.top, 40)
                .padding(.bottom, 3)
                .multilineTextAlignment(.center)
            ZStack {
                RoundedRectangle(cornerRadius: 48)
                    .frame(width: 342, height: 128)
                    .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.97))
                    .padding(.bottom, 12)
                if nextView == false {
                    Image("loading")
                        .padding(.bottom, 10)
                } else {
                    Text("✂️")
                        .frame(height: 80)
                        .font(.system(size: 80, weight: .medium))
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation(.spring()) {
                                    
                                }
                            }
                        }
                }
            }
            .padding(.top, 120)
            Spacer()
        }
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(.spring()) {
                    nextView = true
                }
            }
        }
    }
}


struct MultiPlayerPage: View {
    @Environment(\.presentationMode) private var presentationMode2: Binding<PresentationMode>
    @State var paper: Bool = false
    @State var scissors: Bool = false
    @State var rock: Bool = false
    @State var shower: Bool = true
    @State var contin: Bool = false
    @State var shouldShowDetail: Bool = false
    
    var body: some View {
        VStack {
            if !scissors, !rock, !paper {
                Text("Take your pick")
                    .font(.system(size: 54, weight: .bold))
                    .padding(.top, 40)
                    .padding(.bottom, 3)
            }
            if rock == true || paper == true || scissors == true {
                Text("Your pick")
                    .font(.system(size: 54, weight: .bold))
                    .padding(.top, 40)
                    .padding(.bottom, 3)
            }
            Text("Player 1 • Score 0:0")
                .font(.system(size: 17, weight: .medium))
                .foregroundColor(Color(red: 0.4, green: 0.31, blue: 0.64))
                .padding(.bottom, 65)
            
            
            if !scissors, !rock {
                Button {
                    withAnimation(.spring()) {
                        paper.toggle()
                        shower.toggle()
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 48)
                            .frame(width: 342, height: 128)
                            .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.97))
                            .padding(.bottom, 12)
                        Text("📃")
                            .frame(height: 80)
                            .font(.system(size: 80, weight: .medium))
                    }
                }
            }
            
            
            if !paper, !rock {
                Button {
                    withAnimation(.spring()) {
                        scissors.toggle()
                        shower.toggle()
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 48)
                            .frame(width: 342, height: 128)
                            .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.97))
                            .padding(.bottom, 12)
                        Text("✂️")
                            .frame(height: 80)
                            .font(.system(size: 80, weight: .medium))
                    }
                }
            }
            
            
            if !paper, !scissors {
                Button {
                    withAnimation(.spring()) {
                        rock.toggle()
                        shower.toggle()
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 48)
                            .frame(width: 342, height: 128)
                            .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.97))
                            .padding(.bottom, 12)
                        Text("🗿")
                            .frame(height: 80)
                            .font(.system(size: 80, weight: .medium))
                    }
                }
            }
            
            if !shower {
                Button(action: {withAnimation(.spring()) {
                    rock = false
                    paper = false
                    scissors = false
                    shower.toggle()
                }}) {
                    VStack {
                        ZStack() {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(width: 358, height: 50)
                                .foregroundColor(Color(red: 0.4, green: 0.31, blue: 0.64))
                            Text("I changed my mind")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                        }
                        
                    }
                }
            }
            if !shower {
                Button {
                    withAnimation(.spring()) {
                        shouldShowDetail.toggle()
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: 358, height: 50)
                            .foregroundColor(Color(red: 0.4, green: 0.31, blue: 0.64))
                        NavigationLink("Continue", destination: continueButton(paper: $paper, rock: $rock, scissors: $scissors),
                                       isActive: $shouldShowDetail)
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                    }
                }
            }
        }
        
        .navigationTitle("Round #1")
        .navigationBarTitleDisplayMode(.inline)
        
        .navigationBarBackButtonHidden(true)
        .toolbar(content: {
            ToolbarItem (placement: .navigationBarLeading)  {
                
                Button(action: {
                    presentationMode2.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color(red: 0.4, green: 0.31, blue: 0.64))
                        .bold()
                })
            }
        })
        
    }
}


struct continueButton: View {
    @State var shouldShow: Bool = false
    @Binding var paper: Bool
    @Binding var rock: Bool
    @Binding var scissors: Bool
    
    var body: some View {
        VStack {
            Text("Pass the \nphone to your \nopponent")
                .font(.system(size: 52, weight: .bold))
                .padding(.top, 40)
                .padding(.bottom, 3)
                .multilineTextAlignment(.center)
            Spacer()
            Button {
                withAnimation(.spring()) {
                    shouldShow.toggle()
                }
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 358, height: 50)
                        .foregroundColor(Color(red: 0.4, green: 0.31, blue: 0.64))
                    NavigationLink("Continue", destination: pickSecondPlayer(paper: $paper, rock: $rock, scissors: $scissors),
                                   isActive: $shouldShow)
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .medium))
                }
            }
        }
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}




struct pickSecondPlayer: View {
    @Environment(\.presentationMode) private var presentationMode2: Binding<PresentationMode>
    @State var paper2: Bool = false
    @State var scissors2: Bool = false
    @State var rock2: Bool = false
    @State var shower2: Bool = true
    @State var contin2: Bool = false
    @State var shouldShowDetail2: Bool = false
    @Binding var paper: Bool

    @Binding var rock: Bool

    @Binding var scissors: Bool

    
    var body: some View {
        VStack {
            if !scissors2, !rock2, !paper2 {
                Text("Take your pick")
                    .font(.system(size: 54, weight: .bold))
                    .padding(.top, 40)
                    .padding(.bottom, 3)
            }
            if rock2 == true || paper2 == true || scissors2 == true {
                Text("Your pick")
                    .font(.system(size: 54, weight: .bold))
                    .padding(.top, 40)
                    .padding(.bottom, 3)
            }
            Text("Player 2 • Score 0:0")
                .font(.system(size: 17, weight: .medium))
                .foregroundColor(Color(red: 0.4, green: 0.31, blue: 0.64))
                .padding(.bottom, 65)
            
            
            if !scissors2, !rock2 {
                Button {
                    withAnimation(.spring()) {
                        paper2.toggle()
                        shower2.toggle()
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 48)
                            .frame(width: 342, height: 128)
                            .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.97))
                            .padding(.bottom, 12)
                        Text("📃")
                            .frame(height: 80)
                            .font(.system(size: 80, weight: .medium))
                    }
                }
            }
            
            
            if !paper2, !rock2 {
                Button {
                    withAnimation(.spring()) {
                        scissors2.toggle()
                        shower2.toggle()
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 48)
                            .frame(width: 342, height: 128)
                            .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.97))
                            .padding(.bottom, 12)
                        Text("✂️")
                            .frame(height: 80)
                            .font(.system(size: 80, weight: .medium))
                    }
                }
            }
            
            
            if !paper2, !scissors2 {
                Button {
                    withAnimation(.spring()) {
                        rock2.toggle()
                        shower2.toggle()
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 48)
                            .frame(width: 342, height: 128)
                            .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.97))
                            .padding(.bottom, 12)
                        Text("🗿")
                            .frame(height: 80)
                            .font(.system(size: 80, weight: .medium))
                    }
                }
            }
            
            if !shower2 {
                Button(action: {withAnimation(.spring()) {
                    rock2 = false
                    paper2 = false
                    scissors2 = false
                    shower2.toggle()
                }}) {
                    VStack {
                        ZStack() {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(width: 358, height: 50)
                                .foregroundColor(Color(red: 0.4, green: 0.31, blue: 0.64))
                            Text("I changed my mind")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                        }
                        
                    }
                }
            }
            if !shower2 {
                Button {
                    withAnimation(.spring()) {
                        shouldShowDetail2.toggle()
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: 358, height: 50)
                            .foregroundColor(Color(red: 0.4, green: 0.31, blue: 0.64))
                        NavigationLink("Continue", destination: resultView(paper: $paper, paper2: $paper2, rock: $rock, rock2: $rock2, scissors: $scissors, scissors2: $scissors2),
                                       isActive: $shouldShowDetail2)
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                    }
                }
            }
        }
        .navigationTitle("Round #1")
        .navigationBarTitleDisplayMode(.inline)
        
        .navigationBarBackButtonHidden(true)
        .toolbar(content: {
            ToolbarItem (placement: .navigationBarLeading)  {
                
                Button(action: {
                    presentationMode2.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color(red: 0.4, green: 0.31, blue: 0.64))
                        .bold()
                })
            }
        })
    }
}



struct resultView: View {
    @Environment(\.presentationMode) private var presentationMode2: Binding<PresentationMode>
    @Binding var paper: Bool
    @Binding var paper2: Bool
    @Binding var rock: Bool
    @Binding var rock2: Bool
    @Binding var scissors: Bool
    @Binding var scissors2: Bool
    @State var showToggle: Bool = false
    
    var body: some View {
        VStack {
            
        }
        .navigationTitle("Round #1")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar(content: {
            ToolbarItem (placement: .navigationBarLeading)  {
                
                Button(action: {
                    presentationMode2.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color(red: 0.4, green: 0.31, blue: 0.64))
                        .bold()
                })
            }
        })
        
        //win 1 player
        if scissors == true && paper2 == true {
            VStack {
                Image("win")
                    .padding(.bottom, 3)
                Text("Score 1:0")
                    .font(.system(size: 17, weight: .medium))
                    .foregroundColor(Color(red: 0.4, green: 0.31, blue: 0.64))
                    .padding(.bottom, 105)
                HStack {
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 48)
                            .frame(width: 198, height: 128)
                            .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.97))
                        Text("✂️")
                            .frame(height: 80)
                            .font(.system(size: 80, weight: .medium))
                    }.overlay(ZStack {
                        RoundedRectangle(cornerRadius: 48)
                            .frame(width: 198, height: 128)
                            .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.97))
                            .overlay(
                                RoundedRectangle(cornerRadius: 48)
                                    .stroke(.white, lineWidth: 10)
                            )
                        Text("📃")
                            .frame(height: 80)
                            .font(.system(size: 80, weight: .medium))
                    }
                        .offset(x: 150, y: 74)
                        .frame(width: 198, height: 128), alignment: .bottomTrailing
                    )
                    .padding(.trailing, 150)
                    
                    
                    
                }
                Spacer()
                Button {
                    withAnimation(.spring()) {
                        showToggle.toggle()
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: 358, height: 50)
                            .foregroundColor(Color(red: 0.4, green: 0.31, blue: 0.64))
                        NavigationLink("Another round", destination: ContentView(),
                                       isActive: $showToggle)
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                    }
                }
            }
        } else if rock == true && scissors2 == true {
            VStack {
                Image("win")
                    .padding(.bottom, 3)
                Text("Score 1:0")
                    .font(.system(size: 17, weight: .medium))
                    .foregroundColor(Color(red: 0.4, green: 0.31, blue: 0.64))
                    .padding(.bottom, 105)
                HStack {
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 48)
                            .frame(width: 198, height: 128)
                            .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.97))
                        Text("🗿")
                            .frame(height: 80)
                            .font(.system(size: 80, weight: .medium))
                    }.overlay(ZStack {
                        RoundedRectangle(cornerRadius: 48)
                            .frame(width: 198, height: 128)
                            .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.97))
                            .overlay(
                                RoundedRectangle(cornerRadius: 48)
                                    .stroke(.white, lineWidth: 10)
                            )
                        Text("✂️")
                            .frame(height: 80)
                            .font(.system(size: 80, weight: .medium))
                    }
                        .offset(x: 150, y: 74)
                        .frame(width: 198, height: 128), alignment: .bottomTrailing
                    )
                    .padding(.trailing, 150)
                    
                    
                    
                }
                Spacer()
                Button {
                    withAnimation(.spring()) {
                        showToggle.toggle()
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: 358, height: 50)
                            .foregroundColor(Color(red: 0.4, green: 0.31, blue: 0.64))
                        NavigationLink("Another round", destination: ContentView(),
                                       isActive: $showToggle)
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                    }
                }
            }
        } else if paper == true && rock2 == true {
            VStack {
                Image("win")
                    .padding(.bottom, 3)
                Text("Score 1:0")
                    .font(.system(size: 17, weight: .medium))
                    .foregroundColor(Color(red: 0.4, green: 0.31, blue: 0.64))
                    .padding(.bottom, 105)
                HStack {
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 48)
                            .frame(width: 198, height: 128)
                            .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.97))
                        Text("📃")
                            .frame(height: 80)
                            .font(.system(size: 80, weight: .medium))
                    }.overlay(ZStack {
                        RoundedRectangle(cornerRadius: 48)
                            .frame(width: 198, height: 128)
                            .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.97))
                            .overlay(
                                RoundedRectangle(cornerRadius: 48)
                                    .stroke(.white, lineWidth: 10)
                            )
                        Text("🗿")
                            .frame(height: 80)
                            .font(.system(size: 80, weight: .medium))
                    }
                        .offset(x: 150, y: 74)
                        .frame(width: 198, height: 128), alignment: .bottomTrailing
                    )
                    .padding(.trailing, 150)
                    
                    
                    
                }
                Spacer()
                Button {
                    withAnimation(.spring()) {
                        showToggle.toggle()
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: 358, height: 50)
                            .foregroundColor(Color(red: 0.4, green: 0.31, blue: 0.64))
                        NavigationLink("Another round", destination: ContentView(),
                                       isActive: $showToggle)
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                    }
                }
            }
        }
        
        //lose 1 player
        if paper == true && scissors2 == true {
            VStack {
                Image("lose")
                    .padding(.bottom, 3)
                Text("Score 0:1")
                    .font(.system(size: 17, weight: .medium))
                    .foregroundColor(Color(red: 0.4, green: 0.31, blue: 0.64))
                    .padding(.bottom, 105)
                HStack {
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 48)
                            .frame(width: 198, height: 128)
                            .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.97))
                        Text("📃")
                            .frame(height: 80)
                            .font(.system(size: 80, weight: .medium))
                    }.overlay(ZStack {
                        RoundedRectangle(cornerRadius: 48)
                            .frame(width: 198, height: 128)
                            .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.97))
                            .overlay(
                                RoundedRectangle(cornerRadius: 48)
                                    .stroke(.white, lineWidth: 10)
                            )
                        Text("✂️")
                            .frame(height: 80)
                            .font(.system(size: 80, weight: .medium))
                    }
                        .offset(x: 150, y: 74)
                        .frame(width: 198, height: 128), alignment: .bottomTrailing
                    )
                    .padding(.trailing, 150)
                    
                    
                    
                }
                Spacer()
                Button {
                    withAnimation(.spring()) {
                        showToggle.toggle()
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: 358, height: 50)
                            .foregroundColor(Color(red: 0.4, green: 0.31, blue: 0.64))
                        NavigationLink("Another round", destination: ContentView(),
                                       isActive: $showToggle)
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                    }
                }
            }
        } else if scissors == true && rock2 == true {
            VStack {
                Image("lose")
                    .padding(.bottom, 3)
                Text("Score 0:1")
                    .font(.system(size: 17, weight: .medium))
                    .foregroundColor(Color(red: 0.4, green: 0.31, blue: 0.64))
                    .padding(.bottom, 105)
                HStack {
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 48)
                            .frame(width: 198, height: 128)
                            .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.97))
                        Text("✂️")
                            .frame(height: 80)
                            .font(.system(size: 80, weight: .medium))
                    }.overlay(ZStack {
                        RoundedRectangle(cornerRadius: 48)
                            .frame(width: 198, height: 128)
                            .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.97))
                            .overlay(
                                RoundedRectangle(cornerRadius: 48)
                                    .stroke(.white, lineWidth: 10)
                            )
                        Text("🗿")
                            .frame(height: 80)
                            .font(.system(size: 80, weight: .medium))
                    }
                        .offset(x: 150, y: 74)
                        .frame(width: 198, height: 128), alignment: .bottomTrailing
                    )
                    .padding(.trailing, 150)
                    
                    
                    
                }
                Spacer()
                Button {
                    withAnimation(.spring()) {
                        showToggle.toggle()
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: 358, height: 50)
                            .foregroundColor(Color(red: 0.4, green: 0.31, blue: 0.64))
                        NavigationLink("Another round", destination: ContentView(),
                                       isActive: $showToggle)
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                    }
                }
            }
        } else if rock == true && paper2 == true {
            VStack {
                Image("lose")
                    .padding(.bottom, 3)
                Text("Score 0:1")
                    .font(.system(size: 17, weight: .medium))
                    .foregroundColor(Color(red: 0.4, green: 0.31, blue: 0.64))
                    .padding(.bottom, 105)
                HStack {
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 48)
                            .frame(width: 198, height: 128)
                            .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.97))
                        Text("🗿")
                            .frame(height: 80)
                            .font(.system(size: 80, weight: .medium))
                    }.overlay(ZStack {
                        RoundedRectangle(cornerRadius: 48)
                            .frame(width: 198, height: 128)
                            .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.97))
                            .overlay(
                                RoundedRectangle(cornerRadius: 48)
                                    .stroke(.white, lineWidth: 10)
                            )
                        Text("📃")
                            .frame(height: 80)
                            .font(.system(size: 80, weight: .medium))
                    }
                        .offset(x: 150, y: 74)
                        .frame(width: 198, height: 128), alignment: .bottomTrailing
                    )
                    .padding(.trailing, 150)
                    
                    
                    
                }
                Spacer()
                Button {
                    withAnimation(.spring()) {
                        showToggle.toggle()
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: 358, height: 50)
                            .foregroundColor(Color(red: 0.4, green: 0.31, blue: 0.64))
                        NavigationLink("Another round", destination: ContentView(),
                                       isActive: $showToggle)
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                    }
                }
            }
        }
        
        //draw
        if paper2 == true && paper == true {
            VStack {
                Image("tie")
                    .padding(.bottom, 3)
                Text("Score 0:0")
                    .font(.system(size: 17, weight: .medium))
                    .foregroundColor(Color(red: 0.4, green: 0.31, blue: 0.64))
                    .padding(.bottom, 105)
                HStack {
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 48)
                            .frame(width: 198, height: 128)
                            .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.97))
                        Text("📃")
                            .frame(height: 80)
                            .font(.system(size: 80, weight: .medium))
                    }.overlay(ZStack {
                        RoundedRectangle(cornerRadius: 48)
                            .frame(width: 198, height: 128)
                            .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.97))
                            .overlay(
                                RoundedRectangle(cornerRadius: 48)
                                    .stroke(.white, lineWidth: 10)
                            )
                        Text("📃")
                            .frame(height: 80)
                            .font(.system(size: 80, weight: .medium))
                    }
                        .offset(x: 150, y: 74)
                        .frame(width: 198, height: 128), alignment: .bottomTrailing
                    )
                    .padding(.trailing, 150)
                    
                    
                    
                }
                Spacer()
                Button {
                    withAnimation(.spring()) {
                        showToggle.toggle()
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: 358, height: 50)
                            .foregroundColor(Color(red: 0.4, green: 0.31, blue: 0.64))
                        NavigationLink("Another round", destination: ContentView(),
                                       isActive: $showToggle)
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                    }
                }
            }
            
            

        } else if rock == true && rock2 == true {
            VStack {
                Image("tie")
                    .padding(.bottom, 3)
                Text("Score 0:0")
                    .font(.system(size: 17, weight: .medium))
                    .foregroundColor(Color(red: 0.4, green: 0.31, blue: 0.64))
                    .padding(.bottom, 105)
                HStack {
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 48)
                            .frame(width: 198, height: 128)
                            .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.97))
                        Text("🗿")
                            .frame(height: 80)
                            .font(.system(size: 80, weight: .medium))
                    }.overlay(ZStack {
                        RoundedRectangle(cornerRadius: 48)
                            .frame(width: 198, height: 128)
                            .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.97))
                            .overlay(
                                RoundedRectangle(cornerRadius: 48)
                                    .stroke(.white, lineWidth: 10)
                            )
                        Text("🗿")
                            .frame(height: 80)
                            .font(.system(size: 80, weight: .medium))
                    }
                        .offset(x: 150, y: 74)
                        .frame(width: 198, height: 128), alignment: .bottomTrailing
                    )
                    .padding(.trailing, 150)
                    
                    
                    
                }
                Spacer()
                Button {
                    withAnimation(.spring()) {
                        showToggle.toggle()
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: 358, height: 50)
                            .foregroundColor(Color(red: 0.4, green: 0.31, blue: 0.64))
                        NavigationLink("Another round", destination: ContentView(),
                                       isActive: $showToggle)
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                    }
                }
            }

            
            
            
        } else if scissors == true && scissors2 == true {
            VStack {
                Image("tie")
                    .padding(.bottom, 3)
                Text("Score 0:0")
                    .font(.system(size: 17, weight: .medium))
                    .foregroundColor(Color(red: 0.4, green: 0.31, blue: 0.64))
                    .padding(.bottom, 105)
                HStack {
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 48)
                            .frame(width: 198, height: 128)
                            .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.97))
                        Text("✂️")
                            .frame(height: 80)
                            .font(.system(size: 80, weight: .medium))
                    }.overlay(ZStack {
                        RoundedRectangle(cornerRadius: 48)
                            .frame(width: 198, height: 128)
                            .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.97))
                            .overlay(
                                RoundedRectangle(cornerRadius: 48)
                                    .stroke(.white, lineWidth: 10)
                            )
                        Text("✂️")
                            .frame(height: 80)
                            .font(.system(size: 80, weight: .medium))
                    }
                        .offset(x: 150, y: 74)
                        .frame(width: 198, height: 128), alignment: .bottomTrailing
                    )
                    .padding(.trailing, 150)
                    
                    
                    
                }
                Spacer()
                Button {
                    withAnimation(.spring()) {
                        showToggle.toggle()
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: 358, height: 50)
                            .foregroundColor(Color(red: 0.4, green: 0.31, blue: 0.64))
                        NavigationLink("Another round", destination: ContentView(),
                                       isActive: $showToggle)
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                    }
                }
            }
        }
    }
}

//struct anotherRound: View {
//    @State var showToggle: Bool
//
//    var body: some View {
//        VStack {
//            Button {
//                withAnimation(.spring()) {
//                    showToggle.toggle()
//                }
//            } label: {
//                ZStack {
//                    RoundedRectangle(cornerRadius: 16)
//                        .frame(width: 358, height: 50)
//                        .foregroundColor(Color(red: 0.4, green: 0.31, blue: 0.64))
//                    NavigationLink("Another round", destination: ContentView(),
//                                   isActive: $showToggle)
//                    .foregroundColor(.white)
//                    .font(.system(size: 16, weight: .medium))
//                }
//            }
//        }
//    }
//}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//struct pickButton: View {
//    @State var emoji: String
//    @State var choice: Bool = false
//
//    var body: some View {
//        Button {
//            choice.toggle()
//        } label: {
//            ZStack {
//                if !choice {
//                    Group {
//                        RoundedRectangle(cornerRadius: 48)
//                            .frame(width: 342, height: 128)
//                            .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.97))
//                            .padding(.bottom, 12)
//                        Text(emoji)
//                            .frame(height: 80)
//                            .font(.system(size: 80, weight: .medium))
//                    }
//                    .transition(.scale)
//                }
//            }
//            .onChange(of: choice) { newValue in
//                if emoji == "📃" {
//                    print("paper")
//                }
//                else if emoji == "✂️" {
//                    print("scissors")
//                }
//                else {
//                    print("rock")
//                }
//            }
//        }
//    }
//}
