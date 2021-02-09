//
//  EditMateriaView.swift
//  NotaIF2
//
//  Created by Paulo Uchôa on 08/02/21.
//

import SwiftUI

struct EditMateriaView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject private var materiaViewModel: MateriaViewModel = MateriaViewModel()
    
    @State var editDataMateria = Materia()
    
    @State public var nome = ""
    @State var notaN1 = ""
    @State var notaN2 = ""
    @State var notaAF = ""
    
    var body: some View {
        ZStack() {
            VStack {
                VStack(alignment: .leading){
                    Text("Matéria:")
                        .font(.system(size: 20, weight: .regular, design: .default))
                        .foregroundColor(.black)
                    TextField("\(editDataMateria.nome)", text: $nome)
                }
                .padding(.bottom, 10)
                .padding(.leading, 20)
                .padding(.trailing, 20)
                
                VStack(alignment: .leading){
                    Text("Primeira Etapa(N1):")
                        .font(.system(size: 20, weight: .regular, design: .default))
                        .foregroundColor(.black)
                    TextField("Entre com sua nota aqui ...", text: $notaN1)
                }.padding(.bottom, 10)
                .padding(.leading, 20)
                .padding(.trailing, 20)
                
                VStack(alignment: .leading){
                    Text("Segunda Etapa(N2):")
                        .font(.system(size: 20, weight: .regular, design: .default))
                        .foregroundColor(.black)
                    TextField("Entre com sua nota aqui ...", text: $notaN2)
                }.padding(.bottom, 10)
                .padding(.leading, 20)
                .padding(.trailing, 20)
                
                VStack(alignment: .leading){
                    Text("Avalição Final(AF):")
                        .font(.system(size: 20, weight: .regular, design: .default))
                        .foregroundColor(.black)
                    TextField("Entre com sua nota aqui ...", text: $notaAF)
                }.padding(.bottom, 10)
                .padding(.leading, 20)
                .padding(.trailing, 20)
                
                Spacer()
                
            }
            
            .navigationTitle("Editar")
            .navigationBarItems(trailing: trailingButtom)
            
            
        }.clipped()
        .background(Image("Background")
        .resizable()
        .scaledToFill()
        .edgesIgnoringSafeArea(.all)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    }
    
    var trailingButtom: some View {
        Button(action: {
            materiaViewModel.editSave(edit: editDataMateria ,nome: nome, notaN1: notaN1, notaN2: notaN2, notaAF: notaAF, viewContext: viewContext)
        }) {
            Text("OK")
            }.foregroundColor(.actionColor)
    }

}

struct EditMateriaView_Previews: PreviewProvider {
    static var previews: some View {
        EditMateriaView()
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

