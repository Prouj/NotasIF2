//
//  NotaIF2App.swift
//  NotaIF2
//
//  Created by Paulo Uchôa on 08/02/21.
//

import SwiftUI

@main
struct NotaIF2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ListMateriaView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
