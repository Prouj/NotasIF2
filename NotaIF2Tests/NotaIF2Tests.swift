//
//  NotaIF2Tests.swift
//  NotaIF2Tests
//
//  Created by Paulo Uchôa on 08/02/21.
//

import XCTest
import CoreData
@testable import NotaIF2

class NotaIF2Tests: XCTestCase {

    func  teste_MateriaViewModel_Save_True() {
            
            let MateriaMV = MateriaViewModel()
            let viewContext = PersistenceController().container.viewContext
            let result = MateriaMV.save(nome: "Algebra", notaN1: 10.00, notaN2: 10.00, notaAF: 10.00, viewContext: viewContext)
            
            
            XCTAssertTrue(result)
        }
        
        func  teste_MateriaViewModel_Edit_True() {
            
            let MateriaMV = MateriaViewModel()
            let viewContext = PersistenceController().container.viewContext
            
            let novaMateria = Materia(context: viewContext)
            novaMateria.iD = UUID()
            novaMateria.mediaAtual = 0
            novaMateria.mediaFinal = 0
            novaMateria.nome = "Caquita"
            novaMateria.notaAF = 0
            novaMateria.notaFaltando = 0
            novaMateria.notaN1 = 0
            novaMateria.notaN2 = 0
                    
            let result = MateriaMV.editSave(edit: novaMateria, nome: "Algebra", notaN1: 10.00, notaN2: 10.00, notaAF: 10.00, viewContext: viewContext)

            viewContext.delete(novaMateria)
            XCTAssertTrue(result)
        }
        
        func  teste_MateriaViewModel_Delete_True() {
            
            let MateriaMV = MateriaViewModel()
            let viewContext = PersistenceController().container.viewContext
            
            let novaMateria = Materia(context: viewContext)
            novaMateria.iD = UUID()
            novaMateria.mediaAtual = 0
            novaMateria.mediaFinal = 0
            novaMateria.nome = "Caquita"
            novaMateria.notaAF = 0
            novaMateria.notaFaltando = 0
            novaMateria.notaN1 = 0
            novaMateria.notaN2 = 0
                    
            let result = MateriaMV.delete(delete: novaMateria, viewContext: viewContext)

            
            XCTAssertTrue(result)
        }
        
    func  teste_MateriaViewModel_Save_False() {
            
        let MateriaMV = MateriaViewModel()
        let viewContext = MateriaMV.viewContext
            
        let result = MateriaMV.save(nome: "Algebra", notaN1: 10.00, notaN2: 10.00, notaAF: 10.00, viewContext: viewContext)
            
        
        XCTAssertFalse(result)
    }
    
    func  teste_MateriaViewModel_Edit_False() {
        
        let MateriaMV = MateriaViewModel()
        let viewContext = MateriaMV.viewContext
        
        let novaMateria = Materia(context: viewContext)
        novaMateria.iD = UUID()
        novaMateria.mediaAtual = 0
        novaMateria.mediaFinal = 0
        novaMateria.nome = "Caquita"
        novaMateria.notaAF = 0
        novaMateria.notaFaltando = 0
        novaMateria.notaN1 = 0
        novaMateria.notaN2 = 0
                
        let result = MateriaMV.editSave(edit: novaMateria, nome: "Algebra", notaN1: 10.00, notaN2: 10.00, notaAF: 10.00, viewContext: viewContext)

        viewContext.delete(novaMateria)
        XCTAssertFalse(result)
    }
    
    func  teste_MateriaViewModel_Delete_False() {
        
        let MateriaMV = MateriaViewModel()
        let viewContext = MateriaMV.viewContext
        
        let novaMateria = Materia(context: viewContext)
        novaMateria.iD = UUID()
        novaMateria.mediaAtual = 0
        novaMateria.mediaFinal = 0
        novaMateria.nome = "Caquita"
        novaMateria.notaAF = 0
        novaMateria.notaFaltando = 0
        novaMateria.notaN1 = 0
        novaMateria.notaN2 = 0
                
        let result = MateriaMV.delete(delete: novaMateria, viewContext: viewContext)

        
        XCTAssertFalse(result)
    }

}
