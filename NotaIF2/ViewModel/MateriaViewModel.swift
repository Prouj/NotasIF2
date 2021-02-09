//
//  MateriaViewModel.swift
//  NotaIF2
//
//  Created by Paulo Uchôa on 08/02/21.
//

import SwiftUI
import CoreData

class MateriaViewModel: ObservableObject {
    
    @Environment(\.managedObjectContext) private var viewContext

    var fetchMaterias: [Materia]?

    func save(nome: String, notaN1: String, notaN2: String, notaAF: String, viewContext: NSManagedObjectContext) {
        
        var novaMateria = Materia(context: viewContext)
        novaMateria.iD = UUID()
        novaMateria.nome = nome
        novaMateria.notaN1 = Double(notaN1) ?? 0
        novaMateria.notaN2 = Double(notaN2) ?? 0
        novaMateria.notaAF = Double(notaAF) ?? 0
        
        do {
            
            try viewContext.save()
            print(novaMateria.nome)
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func editSave(edit: Materia, nome: String, notaN1: String, notaN2: String, notaAF: String, viewContext: NSManagedObjectContext) {
        
        var novaMateria = edit
        novaMateria.iD = UUID()
        novaMateria.nome = nome
        novaMateria.notaN1 = Double(notaN1) ?? 0
        novaMateria.notaN2 = Double(notaN2) ?? 0
        novaMateria.notaAF = Double(notaAF) ?? 0
        
        do {
            
            try viewContext.save()
            print(novaMateria.nome)
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func delete() {
        
    }
}
