//
//  ContentDetailView.swift
//  Learning
//
//  Created by Clive Rudd Fernandez on 12/28/21.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
        
        
        VStack{
            
            if url != nil{
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
            }
            let htmlExplanation = model.currentModule!.content.lessons[model.currentLessonIndex].explanation
            
            
            
            //Description
            if htmlExplanation != ""{
                HTMLStringView(htmlContent: htmlExplanation)
                //let attString = model.addStyling(htmlExplanation)
                //HTMLStringView(htmlContent: attString.string)
            }
            
            if model.hasNextLesson(){
                //Next Lesson Button
                Button {
                    model.nextLesson()
                } label: {
                    
                    ZStack {
                        
                        Rectangle()
                            .foregroundColor(.green)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .frame(height:48)
                        
                        Text("Next Lesson \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                            .foregroundColor(.white)
                            .bold()
                            
                    }
                }
            }
        }.padding()
            .navigationTitle(lesson?.title ?? "")
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
