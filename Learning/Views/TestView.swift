//
//  TestView.swift
//  Learning
//
//  Created by Clive Rudd Fernandez on 12/29/21.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        if model.currentQuestion != nil{
            
            VStack{
                //Question number
                Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                //Question
                //CodeTextView()
                
                //Answers
                
                //Button
            }
            .padding()
            .navigationBarTitle("Test \(model.currentModule?.category ?? "")")
            .buttonStyle(PlainButtonStyle())
        }
        else{
            ProgressView()
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
