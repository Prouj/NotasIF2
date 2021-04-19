//
//  MateriaViewModel.swift
//  NotaIF2
//
//  Created by Paulo Uchôa on 08/02/21.
//

import SwiftUI
import CoreData

class MateriaViewModel: ObservableObject {
    
    @Environment(\.managedObjectContext) var viewContext

    var fetchMaterias: [Materia]?

    func save(nome: String, notaN1: Double, notaN2: Double, notaAF: Double, viewContext: NSManagedObjectContext) -> Bool {
        
        var novaMateria = Materia(context: viewContext)
        novaMateria.iD = UUID()
        novaMateria.nome = nome
        novaMateria.notaN1 = notaN1
        novaMateria.notaN2 = notaN2
        novaMateria.notaAF = notaAF
        var mediaAtual = ((notaN1 * 2) + (notaN2 * 3))/5
        var soma = (notaN1 * 2) + (notaN2 * 3)
        novaMateria.mediaAtual = mediaAtual
        
        if mediaAtual <= 7 {
            novaMateria.notaFaltando = (35 - notaN1*2)/3
        } else {
            novaMateria.notaFaltando = 0
        }
        
        if soma >= 15 && soma < 35 {
            novaMateria.mediaFinal = (mediaAtual + notaAF)/2
            
        } else {
            novaMateria.mediaFinal = 0
        }
        novaMateria.progress = Float(((notaN1 * 2) + (notaN2 * 3))/5)
        
        do {
            try viewContext.save()
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    func editSave(edit: Materia, nome: String, notaN1: Double, notaN2: Double, notaAF: Double, viewContext: NSManagedObjectContext) -> Bool {
        
        var editMateria = edit
        editMateria.iD = UUID()
        editMateria.nome = nome
        editMateria.notaN1 = notaN1
        editMateria.notaN2 = notaN2
        editMateria.notaAF = notaAF
        var mediaAtual = ((notaN1 * 2) + (notaN2 * 3))/5
        var soma = (notaN1 * 2) + (notaN2 * 3)
        editMateria.mediaAtual = mediaAtual
        
        if mediaAtual <= 7 {
            editMateria.notaFaltando = (35 - notaN1*2)/3
            
        } else {
            editMateria.notaFaltando = 0
        }
        
        if soma >= 15 && soma < 35 {
            
            editMateria.mediaFinal = 10 - mediaAtual
            
        } else {
            editMateria.mediaFinal = 0
        }
        
        editMateria.progress = Float(((notaN1 * 2) + (notaN2 * 3))/5)
        
        do {
            try viewContext.save()
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    func delete(delete: Materia, viewContext: NSManagedObjectContext) -> Bool {
        
        do {
            try viewContext.delete(delete)
            try viewContext.save()
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
}
