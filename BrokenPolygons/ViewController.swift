//
//  ViewController.swift
//  BrokenPolygons
//
//  Created by Martin Nash on 8/5/14.
//  Copyright (c) 2014 Martin Nash. All rights reserved.
//

import Cocoa
import MapKit

class ViewController: NSViewController, MKMapViewDelegate {
                            
    @IBOutlet weak var theMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        theMapView.delegate = self
        
        let points = [
            CLLocationCoordinate2DMake(41.000512, -109.050116),
            CLLocationCoordinate2DMake(41.002371, -102.052066),
            CLLocationCoordinate2DMake(36.993076, -102.041981),
            CLLocationCoordinate2DMake(36.99892, -109.045267)
        ]
        let polygon = MKPolygon(coordinates: UnsafeMutablePointer(points), count: points.count)
        let bounding = polygon.boundingMapRect
        theMapView.setVisibleMapRect(bounding, edgePadding: NSEdgeInsetsMake(20, 20, 20, 20), animated: true)
        theMapView.addOverlay(polygon)
    }

    func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {
        if let polygon = overlay as? MKPolygon {
            let renderer = MKPolygonRenderer(overlay: overlay)
            renderer.lineWidth = 10
            renderer.strokeColor = NSColor.greenColor()
            renderer.fillColor = NSColor.yellowColor()
            return renderer
        }
        
        return nil
    }
}

