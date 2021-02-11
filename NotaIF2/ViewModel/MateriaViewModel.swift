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

    func save(nome: String, notaN1: Double, notaN2: Double, notaAF: Double, viewContext: NSManagedObjectContext) {
        
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
            novaMateria.notaFaltando = (7 - mediaAtual)
        } else {
            novaMateria.notaFaltando = 0
        }
        
        if soma >= 15 && soma <= 35 {
            novaMateria.mediaFinal = (mediaAtual + notaAF)/2
            
        } else {
            novaMateria.mediaFinal = 0
        }
        novaMateria.progress = Float(((notaN1 * 2) + (notaN2 * 3))/5)
        
        do {
            try viewContext.save()
            print(novaMateria.progress)
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func editSave(edit: Materia, nome: String, notaN1: Double, notaN2: Double, notaAF: Double, viewContext: NSManagedObjectContext) {
        
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
            
            editMateria.notaFaltando = (7 - mediaAtual)
            
        } else {
            
            editMateria.notaFaltando = 0
            
        }
        
        if soma >= 15 && soma <= 35 {
            
            editMateria.mediaFinal = (mediaAtual + notaAF)/2
            
        } else {
            editMateria.mediaFinal = 0
        }
        
        editMateria.progress = Float(((notaN1 * 2) + (notaN2 * 3))/5)
        
        do {
            try viewContext.save()
            print(editMateria.progress)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func delete(delete: Materia, viewContext: NSManagedObjectContext) {
        
        do {
            try viewContext.delete(delete)
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
