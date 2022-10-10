//
//  ViewController.swift
//  mapView
//
//  Created by 유혜빈 on 2022/10/04.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var locationLabel1: UILabel!
    @IBOutlet weak var locationLabel2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationLabel1.text = ""
        self.locationLabel2.text = ""
        locationManager.delegate = self
        
        //정확도
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //승인 요구
        locationManager.requestWhenInUseAuthorization()
        //위치 업데이트
        locationManager.startUpdatingLocation()
        
        self.mapView.showsUserLocation = true
    }
    
    func goLocation(_ latitudeValue: CLLocationDegrees, _ longitudeValue: CLLocationDegrees, _ span: Double) -> CLLocationCoordinate2D{
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        
        self.mapView.setRegion(pRegion, animated: true)
        return pLocation
    }
    
    func setAnnotation(_ latitudeValue: CLLocationDegrees, _ longitudeValue: CLLocationDegrees, _ span: Double, _ strTitle: String, _ subTitle: String){
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue, longitudeValue, span)
        annotation.title = strTitle
        annotation.subtitle = subTitle
        
        self.mapView.addAnnotation(annotation)
    }

    @IBAction func changeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            self.locationLabel1.text = ""
            self.locationLabel2.text = ""
            locationManager.startUpdatingLocation()
        }
        else if sender.selectedSegmentIndex == 1{
            setAnnotation(36.833861, 127.179179, 0.1, "상명대학교 천안캠퍼스", "충청남도 천안시 동남구 상명대길 31")
            
            self.locationLabel1.text = "보고 계신 위치"
            self.locationLabel2.text = "상명대학교 천안캠퍼스"
        }
        else if sender.selectedSegmentIndex == 2{
            setAnnotation(37.556038, 126.972381, 0.1, "서울역", "서울특별시 중구 소공동 세종대로18길 2")
            
            self.locationLabel1.text = "보고 계신 위치"
            self.locationLabel2.text = "서울역"
        }
    }
    
}

extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
        _ = goLocation((pLocation?.coordinate.latitude)!, (pLocation?.coordinate.longitude)!, 0.01)
        CLGeocoder().reverseGeocodeLocation(pLocation!,
                                            completionHandler: { (placemarks, error) in
            let pm = placemarks!.first
            let country = pm!.country
            var address: String = country!
            
            if pm!.locality != nil{
                address = " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil{
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.locationLabel1.text = "현재 위치"
            self.locationLabel2.text = address
        })
        
        locationManager.stopUpdatingLocation()
    }
}
