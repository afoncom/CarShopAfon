//
//  MailService.swift
//  CarShopAfon
//
//  Created by afon.com on 03.03.2026.
//

import Foundation 
import MessageUI

protocol MailService {
    func canSendMail() -> Bool 
}

final class MailServiceImpl: MailService {
    func canSendMail() -> Bool {
        MFMailComposeViewController.canSendMail()
    }
}
