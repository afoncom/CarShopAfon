//
//  MailService.swift
//  CarsharingAfon
//
//  Created by afon.com on 23.02.2026.
//

import Foundation
import MessageUI

protocol MailService {
    func sendFeedback()
}

final class MailServiceImpl: NSObject, MailService, MFMailComposeViewControllerDelegate {
    private let mailRouter: MailRouter
    
    init(mailRouter: MailRouter) {
        self.mailRouter = mailRouter
    }
    
    func sendFeedback() {
        mailRouter.presentMailComposer(
            recipients: ["support@afon.com"],
            subject: "Carsharing Afon Feedback",
            body: "",
            delegate: self
        )
    }
    
    func mailComposeController(
        _ controller: MFMailComposeViewController,
        didFinishWith result: MFMailComposeResult,
        error: Error?
    ) {
        controller.dismiss(animated: true)
    }
}
