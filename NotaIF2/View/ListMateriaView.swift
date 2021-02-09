//
//  ListMateriaView.swift
//  NotaIF2
//
//  Created by Paulo Uchôa on 08/02/21.
//


import SwiftUI

struct ListMateriaView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Materia.entity(), sortDescriptors: [NSSortDescriptor(key: "nome", ascending: true)])
    
    var materia: FetchedResults<Materia>
    
    @ObservedObject private var materiaViewModel: MateriaViewModel = MateriaViewModel()

    var body: some View {
        NavigationView {
                ScrollView {
                    LazyVStack {
                        ForEach(materia) { materia in
                            NavigationLink(destination: MateriaView(dataMateria: materia)) {
                            
                                ListaMateriaCell(dataMateria: materia)
                            }
                        }
                        
                    }
                }.clipped()
                .background(Image("Background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
              
                        
                .navigationBarTitle("Matérias", displayMode: .large)
                .navigationBarItems(trailing: trailingButtom)
        
                
        }.accentColor(.actionColor)
    }
    
    var trailingButtom: some View {
        NavigationLink(destination: SaveMateriaView()) {
            Image(systemName: "plus").imageScale(.large).font(.system(size: 22))
                .foregroundColor(.actionColor)
        }
    }
}


struct ListMateriaView_Previews: PreviewProvider {
    static var previews: some View {
        ListMateriaView()
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

