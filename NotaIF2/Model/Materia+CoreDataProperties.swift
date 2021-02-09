//
//  Materia+CoreDataProperties.swift
//  NotaIF2
//
//  Created by Paulo Uchôa on 08/02/21.
//
//

import Foundation
import CoreData


extension Materia {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Materia> {
        return NSFetchRequest<Materia>(entityName: "Materia")
    }

    @NSManaged public var iD: UUID
    @NSManaged public var mediaAtual: Double
    @NSManaged public var mediaFinal: Double
    @NSManaged public var nome: String
    @NSManaged public var notaAF: Double
    @NSManaged public var notaFaltando: Double
    @NSManaged public var notaN1: Double
    @NSManaged public var notaN2: Double
    @NSManaged public var progress: Float

}

extension Materia : Identifiable {

}
