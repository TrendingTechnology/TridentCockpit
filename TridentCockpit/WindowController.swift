/////
////  WindowController.swift
///   Copyright © 2019 Dmitriy Borovikov. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController, NSWindowDelegate {

    @IBOutlet weak var toolbar: NSToolbar!
    @IBOutlet var ssidLabel: NSTextField!
    
    override func windowDidLoad() {
        super.windowDidLoad()
        self.windowFrameAutosaveName = "TridentVideoWindow"
        toolbar.allowsUserCustomization = false
        toolbar.displayMode = .iconAndLabel
    }

}

// MARK: - NSToolbarDelegate
extension WindowController: NSToolbarDelegate {
    /// - Tag: ToolbarItemForIdentifier
    func toolbar(
        _ toolbar: NSToolbar,
        itemForItemIdentifier itemIdentifier: NSToolbarItem.Identifier,
        willBeInsertedIntoToolbar flag: Bool) -> NSToolbarItem? {
        let toolbarItem = NSToolbarItem(itemIdentifier: itemIdentifier)
        toolbarItem.autovalidates = false
        toolbarItem.isEnabled = false

        let button = NSButton(frame: NSRect(x: 0, y: 0, width: 44, height: 40))
        button.title = ""
        button.bezelStyle = .texturedRounded
        button.focusRingType = .none
        
        switch itemIdentifier {
        case .goDive:
            toolbarItem.label = NSLocalizedString("Pilot", comment: "")
            toolbarItem.paletteLabel = NSLocalizedString("Pilot", comment: "")
            toolbarItem.toolTip = NSLocalizedString("Pilot Trident", comment: "")
            button.image = NSImage(named: "underwater")!
            toolbarItem.view = button
        case .goMaintenance:
            toolbarItem.label = NSLocalizedString("Maintenance", comment: "")
            toolbarItem.paletteLabel = NSLocalizedString("Maintenance", comment: "")
            toolbarItem.toolTip = NSLocalizedString("Maintenance Trident", comment: "")
            button.image = NSImage(named: NSImage.actionTemplateName)!
            toolbarItem.view = button
        case .goPastDives:
            toolbarItem.label = NSLocalizedString("Past Dives", comment: "")
            toolbarItem.paletteLabel = NSLocalizedString("Past Dives", comment: "")
            toolbarItem.toolTip = NSLocalizedString("View Past Dives video", comment: "")
            button.image = NSImage(named: NSImage.quickLookTemplateName)!
            toolbarItem.view = button
        case .connectWiFi:
            toolbarItem.label = NSLocalizedString("WiFi", comment: "")
            toolbarItem.paletteLabel = NSLocalizedString("WiFi", comment: "")
            toolbarItem.toolTip = NSLocalizedString("Connect Trident WiFi", comment: "")
            button.image = NSImage(named: "wifi.slash")!
            button.image = NSImage(named: "wifi")!
            toolbarItem.view = button
        case .connectCamera:
            toolbarItem.label = NSLocalizedString("Payload", comment: "")
            toolbarItem.paletteLabel = NSLocalizedString("Payload", comment: "")
            toolbarItem.toolTip = NSLocalizedString("Connect camera payload", comment: "")
            button.image = NSImage(named: "camera.fill")!
            toolbarItem.view = button
        case .wifiSSID:
            toolbarItem.label = NSLocalizedString("SSID", comment: "")
            toolbarItem.paletteLabel = NSLocalizedString("SSID", comment: "")
            toolbarItem.toolTip = NSLocalizedString("Connected SSID", comment: "")
            toolbarItem.view = ssidLabel
            toolbarItem.isEnabled = true
        case .auxCameraModelView:
            toolbarItem.label = NSLocalizedString("Model", comment: "")
            toolbarItem.paletteLabel = NSLocalizedString("Model", comment: "")
            toolbarItem.toolTip = NSLocalizedString("Connected camera model", comment: "")
            toolbarItem.view = NSTextField(labelWithString: "")
            toolbarItem.isEnabled = true
        default:
            break
        }
        return toolbarItem
    }
    
    func toolbarWillAddItem(_ notification: Notification) {
        let userInfo = notification.userInfo!
        guard let addedItem = userInfo["item"] as? NSToolbarItem else { return }
        switch addedItem.itemIdentifier {
        default: break
        }
    }

    /// - Tag: DefaultIdentifiers
    func toolbarDefaultItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        return [
            .goDive,
            .goMaintenance,
            .space,
            .connectWiFi,
            .wifiSSID,
//            .space,
            .connectCamera,
            .auxCameraModelView,
        ]
    }

    /// - Tag: AllowedToolbarItems
    func toolbarAllowedItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        return [ NSToolbarItem.Identifier.space,
                 NSToolbarItem.Identifier.flexibleSpace,
        ]
    }

}
