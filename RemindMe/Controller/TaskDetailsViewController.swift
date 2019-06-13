//
//  ViewController.swift
//  RemindMe
//
//  Created by Yuchao CHEN on 7/6/19.
//  Copyright © 2019 Yuchao CHEN. All rights reserved.
//

import UIKit
import MapKit

class TaskDetailsViewController: UIViewController {

    // MARK: Properties
    private let locationManager = LocationManager.instance

    @IBOutlet weak var taskTitleLabel: UILabel!
    @IBOutlet weak var locationMap: MKMapView!
    @IBOutlet weak var timestampLabel: UILabel!
    
    var task: Task?
    
    let RFC3339DateFormatter: DateFormatter = {
      let formatter = DateFormatter()
      formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
      return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadTask()
    }

    // MARK: Private Mehthods
    private func loadTask() {
        if let task = task {
            self.taskTitleLabel.text = task.title
            if let timestamp = task.timestamp {
                let date = Date(timeIntervalSince1970: timestamp)
                self.timestampLabel.text = RFC3339DateFormatter.string(from: date)
            }
            
            if let coordinate = task.location?.coordinate {
                let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                self.locationMap.mapType = MKMapType.standard
                self.locationMap.showsUserLocation = true
                let pointAnnotation: MKPointAnnotation = MKPointAnnotation()
                pointAnnotation.coordinate = coordinate
                self.locationMap.addAnnotation(pointAnnotation)
                self.locationMap.centerCoordinate = coordinate
                self.locationMap.selectAnnotation(pointAnnotation, animated: true)
                self.locationMap.region = region
            }
        }
    }
}

