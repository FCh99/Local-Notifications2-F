//
//  ViewController.swift
//  Local Notifications2 F
//
//  Created by Fausto Checa on 24/7/17.
//  Copyright © 2017 Fausto Checa. All rights reserved.
//

import UIKit
import UserNotifications

/*

¡OJO¡¡
INSTRUCCIONES CON EL EMULADOR:
1. Clikar botón Registrase
2. Clickar botón Notificación
3. IMPORTANTE en el emulador ir a Hardware > Home antes de 5 segundos para ver como se lanza la notificación
4. Se puede hacer Swipe sobre la notificación misma, para ver más detalles de la misma

*/


class ViewController: UIViewController, UNUserNotificationCenterDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    
    
    func registerCategories() {
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        
        let show = UNNotificationAction(identifier: "show", title: "hoy el tráfico está faltal y antes tienes que echar gasolina ¡¡¡", options: .foreground)
        let show2 = UNNotificationAction(identifier: "show2", title: "y lleva el parguas que llueve", options: .destructive)
        let category = UNNotificationCategory(identifier: "alarm", actions: [show, show2], intentIdentifiers: [])
        
        center.setNotificationCategories([category])
 
        
    
    }
    @IBAction func registrarse(_ sender: Any) {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (ok, error) in
            if ok {
                print("ok there is Authorization")
            }else{
                print("there is an error")
            }
        }
    }

    
    @IBAction func lanzaNoti(_ sender: Any) {
        let center = UNUserNotificationCenter.current()
        registerCategories()
        
        let content = UNMutableNotificationContent()
        content.title = "Alarma para despertarnos"
        content.body = "Despértate que hay mucho atasco"
        content.categoryIdentifier = "alarm"
        content.userInfo = ["customData" : "fizzbuzz"]
        content.sound = UNNotificationSound.default()
        
        var dateComponents = DateComponents()
        dateComponents.hour = 9
        dateComponents.minute = 39
        
        let trigger2 = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger2)
        center.add(request)
       
    }
    
   
    
}

