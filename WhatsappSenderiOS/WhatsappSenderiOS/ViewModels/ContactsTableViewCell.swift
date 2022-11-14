//
//  ContactsTableViewCell.swift
//  WhatsappSenderiOS
//
//  Created by Andreas Alexandru Cretu on 10/11/22.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {

    // MARK: - Properties

    static let reuseIdentifier = Constants().reuseIdentifier

    @IBOutlet weak var cellLabel: UILabel!

    // MARK: - Initialization

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
