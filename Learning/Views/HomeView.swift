//
//  ContentView.swift
//  Learning
//
//  Created by Clive Rudd Fernandez on 12/26/21.
//

import SwiftUI

struct HomeView: View {
    
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
                                NavigationLink {
                                    ContentView()
                                        .onAppear {
                                            model.beginModule(module.id)
                                        }
                                }
                                label: {
                                    
                                    //Learning Card
                                    HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) Lessons", time: module.content.time)
                                }
                            }.buttonStyle(PlainButtonStyle())
                            // MARK: End of Lesson Card
                            //Test Card
                            HomeViewRow(image: module.test.image, title: "\(module.category) Test", description: module.test.description, count: "\(module.test.questions.count) Lessons", time: module.test.time)
                        }
                    }//.accentColor(.black)
                     //.padding()
                    // MARK: End of List of Cards
                }
                
            }//.navigationTitle("Get Started")
        }
    }
    
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
