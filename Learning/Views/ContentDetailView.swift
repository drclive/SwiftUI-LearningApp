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
            }
            
            if model.hasNextLesson(){
                //Next Lesson Button
                Button {
                    model.nextLesson()
                } label: {
                    
                    ZStack {
                        RectangleCard(height: 48, color: Color.green)
                        Text("Next Lesson \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
            }
            else{
                //Next Lesson Button
                Button {
                    model.currentContentSelected = nil
                } label: {
                    
                    ZStack {
                        RectangleCard(height: 48, color: Color.green)
                        Text("Complete")
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
