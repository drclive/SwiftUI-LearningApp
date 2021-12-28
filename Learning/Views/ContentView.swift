//
//  ContentView.swift
//  Learning
//
//  Created by Clive Rudd Fernandez on 12/27/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        ScrollView{
            LazyVStack{
                if model.currentModule != nil {
                    ForEach(0..<model.currentModule!.content.lessons.count){ index in
                        let lesson = model.currentModule!.content.lessons[index]
                        NavigationLink {
                            ContentDetailView()
                                .onAppear {
                                    model.beginLesson(index)
                                }
                        } label: {
                            ContentViewRow(index: index, title: lesson.title, duration: lesson.duration)
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("Learn \(model.currentModule?.category ?? "")")
            .buttonStyle(PlainButtonStyle())
        }
    }
}
