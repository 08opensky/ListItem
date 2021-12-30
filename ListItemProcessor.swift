//  ListItemProcessor.swift
//  ListItems


import Foundation

struct StationData{
    
    var stationId:String
    var stationName:String
    var logo:String
}

class ListItemProcessor :NSObject,XMLParserDelegate {
    
    private var stationItems = [StationData]()
    private var currentElement = ""
    private var currentStationId = ""{
        didSet {
            currentStationId = currentStationId.trimmingCharacters(in: CharacterSet.newlines)
        }
    }
    private var currentStationName = "" {
        didSet {
            currentStationName = currentStationName.trimmingCharacters(in: CharacterSet.newlines)
        }
    }
    private var currentLogo = ""{
        didSet {
            currentLogo = currentLogo.trimmingCharacters(in: CharacterSet.newlines)
        }
    }
    
    private var parserCompletionHandler : ((([StationData])-> Void)?)
    
    func parseStationsUrl(url:String,completionHandler:((([StationData])-> Void)?)){
        
        self.parserCompletionHandler = completionHandler
        let request = URLRequest(url: URL(string: url)!)
        let urlSession = URLSession.shared
        let dataTask = urlSession.dataTask(with: request) { (resData, resResponce, resError) in
            
            print("resData",resData as Any )
            
            if resError != nil{
                return
            }
            guard let data = resData else {
                return
            }
            print("data",data)
            let parser = XMLParser(data: data)
            parser.delegate = self
            parser.parse()
        }
        dataTask.resume()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {

        currentElement = elementName
        if currentElement == "Item"{
            currentStationId = ""
            currentStationName = ""
            currentLogo = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        switch currentElement {
        case "StationId": currentStationId += string
        case "StationName": currentStationName += string
        case "Logo": currentLogo += string
        default:break
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == "Item"{

            if currentStationId != "" && currentStationName != "" && currentLogo != ""{
                let stationItem = StationData(stationId: currentStationId, stationName: currentStationName, logo: currentLogo)
                self.stationItems.append(stationItem)
            }
        }
    }
    
    func parserDidEndDocument(_ parser:XMLParser ) -> Void {
        
        self.parserCompletionHandler?(stationItems)
        
        DispatchQueue.main.async {
        }
    }
}
