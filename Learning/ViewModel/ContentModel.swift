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
    
    var styleData: Data?

    init(){
        getLocalData()
    }
    
    // MARK: - Data Methods
    func getLocalData(){
        
        ParseJSON()
        //ParseHTML()
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
    
}
