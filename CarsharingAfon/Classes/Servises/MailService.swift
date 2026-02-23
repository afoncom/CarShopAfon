//
//  MailService.swift
//  CarsharingAfon
//
//  Created by afon.com on 23.02.2026.
//

import Foundation
import MessageUI
import SwiftUI

protocol MailService {
    func sendFeedback()
}

final class MailServiceImpl: NSObject, MailService, MFMailComposeViewControllerDelegate {
    func sendFeedback() {
        guard MFMailComposeViewController.canSendMail() else {
            print("Mail services are not available")
            return
        }
        
        let composer = MFMailComposeViewController()
        composer.setToRecipients(["support@afon.com"])
        composer.setSubject("Carsharing Afon Feedback")
        composer.setMessageBody("", isHTML: false)
        composer.mailComposeDelegate = self
        
        if let scene = UIApplication.shared.connectedScenes.first(where:
        { $0.activationState == .foregroundActive}) as? UIWindowScene,
           let rootVC = scene.windows.first?.rootViewController {
            rootVC.present(composer, animated: true)
        }
    }
    
    func mailComposeController(
        _ controller: MFMailComposeViewController,
        didFinishWith result: MFMailComposeResult,
        error: Error?
    ) {
        controller.dismiss(animated: true)
    }
}
