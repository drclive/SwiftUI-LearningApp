//
//  ContentView.swift
//  Learning
//
//  Created by Clive Rudd Fernandez on 12/26/21.
//

import SwiftUI

struct HomeViewMine: View {
    
    //List of modules
    @EnvironmentObject  var model:ContentModel
    
    var body: some View {
        
        NavigationView{
            // MARK: VStack for the whole page
            VStack (alignment: .leading){
                Text("What do you want to do today")
                    .padding(.leading, 20)
                ScrollView{
                    // MARK: LazyVStack list of cards
                    LazyVStack{
                        ForEach(model.modules){ module in
                            // MARK: VStack for one card with a link
                            VStack(spacing: 20){
                                
                                NavigationLink(
                                    destination:
                                        ContentView()
                                        .onAppear(perform:
                                                    {
                                                        print("this is ContentView onAppear")
                                                        model.beginModule(module.id)
                                                    }),
                                    tag: module.id,
                                    selection: $model.currentContentSelected,
                                    label: {
                                        //Learning Card
                                        HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) Lessons", time: module.content.time)
                                    })
                                
                                NavigationLink(
                                    destination:
                                        TestView()
                                        .onAppear(perform:
                                                    {
                                                        print("this is TestView on onAppear")
                                                        model.beginTest(module.id)
                                                    }),
                                    tag: module.id,
                                    selection: $model.currentTestSelected,
                                    label: {
                                        //Test Card
                                        HomeViewRow(image: module.test.image, title: "\(module.category) Test", description: module.test.description, count: "\(module.test.questions.count) Lessons", time: module.test.time)
                                    })
                                
                                NavigationLink(destination: EmptyView()){
                                    EmptyView()
                                        .onAppear(perform:
                                                    {
                                            print("this is EmptyView on onAppear")
                                        })
                                }
                            }
                            
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }.navigationViewStyle(.stack)
    }
}

struct HomeViewMine_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewMine()
            .environmentObject(ContentModel())
    }
}
