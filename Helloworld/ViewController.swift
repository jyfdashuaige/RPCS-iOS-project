
// Created by Bojiang Li on 2/13/2022.
// Last commit by Bojiang Li on 3/21/2022.

import UIKit
import MapKit

class ViewController: UIViewController {


    @IBOutlet var mapView: MKMapView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        mapView.delegate = self
        getDirections()
        getDirections2()
        

        let annotation1 = MKPointAnnotation()
        annotation1.coordinate = CLLocationCoordinate2D(latitude: 40.4432, longitude: -79.9428)
        annotation1.title = "Ice"
        mapView.addAnnotation(annotation1)

        let annotation2 = MKPointAnnotation()
        annotation2.coordinate = CLLocationCoordinate2D(latitude: 40.4432, longitude: -79.96)
        annotation1.title = "Tree in the road"
        mapView.addAnnotation(annotation2)

        let annotation3 = MKPointAnnotation()
        annotation3.coordinate = CLLocationCoordinate2D(latitude: 40.45, longitude: -79.93)
        annotation3.title = "Rock"
        mapView.addAnnotation(annotation3)

        let annotation4 = MKPointAnnotation()
        annotation4.coordinate = CLLocationCoordinate2D(latitude: 40.44, longitude: -79.95)
        annotation4.title = "Ice"
        mapView.addAnnotation(annotation4)

        let region = MKCoordinateRegion(center: annotation1.coordinate, latitudinalMeters: 5000, longitudinalMeters: 5000)

        mapView.setRegion(region, animated: true)

        

    }
    
    func getDirections() {
        let request = MKDirections.Request()
        // Source
        let sourcePlaceMark = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 40.45, longitude: -79.93))
        request.source = MKMapItem(placemark: sourcePlaceMark)
        // Destination
        let destPlaceMark = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 40.4432, longitude: -79.9428))
        request.destination = MKMapItem(placemark: destPlaceMark)
        // Transport Types
        request.transportType = [.automobile, .walking]

        let directions = MKDirections(request: request)
        directions.calculate { response, error in
            guard let response = response else {
                print("Error: \(error?.localizedDescription ?? "No error specified").")
                return
            }

            let route = response.routes[0]
            self.mapView.addOverlay(route.polyline)

            // …
        }

    }
    
    func getDirections2() {
        let request = MKDirections.Request()
        // Source
        let sourcePlaceMark = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 40.445, longitude: -79.965))
        request.source = MKMapItem(placemark: sourcePlaceMark)
        // Destination
        let destPlaceMark = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 40.44, longitude: -79.968))
        request.destination = MKMapItem(placemark: destPlaceMark)
        // Transport Types
        request.transportType = [.automobile, .walking]

        let directions = MKDirections(request: request)
        directions.calculate { response, error in
            guard let response = response else {
                print("Error: \(error?.localizedDescription ?? "No error specified").")
                return
            }

            let route = response.routes[0]
            self.mapView.addOverlay(route.polyline)

            // …
        }

    }
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        // Set the color for the line
        renderer.strokeColor = .red
        return renderer
    }

}
    

