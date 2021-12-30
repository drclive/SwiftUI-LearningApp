//
//  ContentModel.swift
//  Learning
//
//  Created by Clive Rudd Fernandez on 12/27/21.
//

import Foundation

class ContentModel: ObservableObject{
    
    @Published var modules = [Module]()
    
    //Current module
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    //Current Lesson
    @Published var currentLesson: Lesson?
    var currentLessonIndex = 0
    
    //Current question
    @Published var currentQuestion: Question?
    var currentQuestionIndex = 0
    
    var styleData: Data?
    
    //Current selected content and text
    @Published var currentContentSelected:Int?
    @Published var currentTestSelected:Int?

    init(){
        getLocalData()
    }
    
    // MARK: - Data Methods
    func getLocalData(){
        
        ParseJSON()
        ParseHTML()
    }
    func ParseJSON(){
        
        let jsonURL = Bundle.main.url(forResource: "data", withExtension: "json")
        //Create data object
       do{
           let data = try Data(contentsOf: jsonURL!)
           //Decode data with JSON decoder
           //Parse the data
           let decoder = JSONDecoder()
           //Get the data into instances
           let moduleData = try decoder.decode([Module].self, from: data)
           //return the recipes
           modules =  moduleData
       }
       catch{
           //Error getting dat
           print(error)
       }
       //Return an empty recipe list
        //modules =  [Module]()
    }
    func ParseHTML(){
        //Parse the HTML style data
        let styleURL = Bundle.main.url(forResource: "style", withExtension: "html")
        //Create data object
       do{
           let styleData = try Data(contentsOf: styleURL!)
           self.styleData = styleData
       }
       catch{
           //Error getting dat
           print(error)
       }
    }
    // MARK: Module navigation methods
    func beginModule(_ moduleid:Int){
        
        //Find the index for this module id
        for index in 0..<modules.count{
            if modules[index].id == moduleid{
                
                //Found the matching module
                currentModuleIndex = index
                break
            }
        }
        //Set the current module
        currentModule = modules[currentModuleIndex]
    }
    
    func beginTest(_ moduleid:Int){
        
        beginModule(moduleid)
        
        currentQuestionIndex = 0
        
        if currentModule?.test.questions.count ?? 0 > 0 {
            currentQuestion = currentModule!.test.questions[currentQuestionIndex]
            //lessonDescription = addStyling(currentQuestion!.content)
        }
        
    }
    
    func beginLesson(_ LessonIndex:Int){
        
        if LessonIndex < currentModule!.content.lessons.count{
            currentLessonIndex = LessonIndex
        }else {
            currentLessonIndex = 0
        }
        currentLesson = currentModule!.content.lessons[LessonIndex]
    }
    
    func hasNextLesson() -> Bool {
       
        return (currentLessonIndex + 1 < currentModule!.content.lessons.count)
    }
    
    func nextLesson(){
        
        //Advance the Lesson
        currentLessonIndex += 1
        
        //Check that it is within range
        if currentLessonIndex < currentModule!.content.lessons.count{
            //Ser the current lesson property
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
        }
        else{
            
            currentLesson = nil
            currentLessonIndex = 0
        }
    }
    
    func addStyling(_ htmlString: String) -> NSAttributedString {
        
        var resultString = NSAttributedString()
        var data = Data()
        
        //Add the styling data
        if styleData != nil {
            data.append(self.styleData!)
        }
        data.append(Data(htmlString.utf8))
        
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            resultString = attributedString
        }
        return resultString
    }
}
