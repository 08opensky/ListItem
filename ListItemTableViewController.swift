//  ListItemTableViewController.swift
//  ListItems


import UIKit

class ListItemTableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var myTableView = UITableView()
    var stationItems = [StationData]()
    
    fileprivate func setUpTableView() {
        myTableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.height))
        myTableView.register(ListItemTableViewCell.self, forCellReuseIdentifier: "cell")
        myTableView.dataSource = self
        myTableView.delegate = self
        self.view.addSubview(myTableView)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setUpTableView()
        
        let url = "http://phorus.vtuner.com/setupapp/phorus/asp/browsexml/navXML.asp?gofile=LocationLevelFourCityUS-North%20America-New%20York-ExtraDir-1-Inner-14&bkLvl=9237&mac=a8f58cd9758%20b710c43a7a63762e755947f83f0ad9194aa294bbaee55e0509e02&dlang=eng&fver=1.4.4.2299%20%20(20150604)&hw=CAP:%201.4.0.075%20MCU:%201.032%20BT:%200.002"
        ListItemProcessor().parseStationsUrl(url:url){
            arrayOfStations in
            self.stationItems = arrayOfStations
            DispatchQueue.main.async {
                self.myTableView.reloadData()
            }
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stationItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListItemTableViewCell
        
        cell.backgroundColor = UIColor.clear
        cell.nameLabel.text  =  stationItems[indexPath.row].stationName
        cell.idLabel.text = stationItems[indexPath.row].stationId
        let url = stationItems[indexPath.row].logo

        if let imageUrl = URL(string: url)  {
            DispatchQueue.global().async {
                let imageData = try? Data(contentsOf: imageUrl)
                if let imageData = imageData{
                    let image = UIImage(data: imageData)
                    DispatchQueue.main.async {
                        cell.images.image = image
                    }
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100
    }
    
}

