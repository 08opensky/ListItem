//  DisplayListViewController.swift
//  ListItems



import UIKit

class DisplayListViewController: UIViewController {

    fileprivate func setUpLabel() {
        let label = UILabel()//(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-5, height: 80))
        label.center = CGPoint(x: 160, y: 285)
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "http://phorus.vtuner.com/setupapp/phorus/asp/browsexml/navXML.asp?gofile=LocationLevelFo urCityUS-North%20America-New%20York-ExtraDir-1-Inner-14&bkLvl=9237&mac=a8f58cd9758 b710c43a7a63762e755947f83f0ad9194aa294bbaee55e0509e02&dlang=eng&fver=1.4.4.2299 %20(20150604)&hw=CAP:%201.4.0.075%20MCU:%201.032%20BT:%200.002"
        self.view.addSubview(label)
        NSLayoutConstraint.activate([
            //stick the top of the label to the top of its superview:
            label.topAnchor.constraint(equalTo: view.topAnchor,constant: 200),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 40),
            label.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            label.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
    
    fileprivate func setUpButton() {
        let button = UIButton(frame: CGRect(x: 0,
                                            y: 0,
                                            width: 200,
                                            height: 100))
        button.setTitle("Submit",
                        for: .normal)
        button.setTitleColor(.white,
                             for: .normal)
        button.center = view.center
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 10
        button.backgroundColor = .black
        button.addTarget(self,
                         action: #selector(buttonAction),
                         for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Load")
        self.view.backgroundColor = .white
        setUpLabel()
        setUpButton()
    }
    
    @objc func buttonAction() {
        print("Button pressed")
        let listItemVC = ListItemTableViewController()
        self.present(listItemVC, animated: true, completion: nil)
}
    
}
