//
//  EditMateriaView.swift
//  NotaIF2
//
//  Created by Paulo Uchôa on 08/02/21.
//

import SwiftUI
import Combine
import ToastUI

struct EditMateriaView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var materiaViewModel: MateriaViewModel = MateriaViewModel()
    
    @State var editDataMateria = Materia()
    
    @State public var nome = ""
    @State var notaN1 = ""
    @State var notaN2 = ""
    @State var notaAF = ""
    @State var presentingToast = false
    
    var notaN1FormattedTeste: Double {
            return (Double(notaN1) ?? 0) / 100
    }
    
    var notaN2FormattedTeste: Double {
            return (Double(notaN2) ?? 0) / 100
    }
    
    var notaAFFormattedTeste: Double {
            return (Double(notaAF) ?? 0) / 100
    }
    
    var body: some View {
        ZStack() {
            VStack {
                VStack(alignment: .leading){
                    Text("Matéria:")
                        .font(.system(size: 20, weight: .regular, design: .default))
                        .foregroundColor(.black)
                    TextField("\(editDataMateria.nome)", text: $nome)
                        .disableAutocorrection(true)
                        .accentColor(.TextFieldColor)
                        .foregroundColor(.TextFieldColor)
                        .onReceive(Just(nome)) { _ in if nome.count > 26 {
                            nome = String(nome.prefix(26))
                        }}
                }
                .padding(.top, 20)
                .padding(.bottom, 10)
                .padding(.leading, 20)
                .padding(.trailing, 20)
                
                VStack(alignment: .leading){
                    Text("Primeira Etapa(N1):")
                        .font(.system(size: 20, weight: .regular, design: .default))
                        .foregroundColor(.black)
                    
                    ZStack(alignment: .leading){
                        Text("\(notaN1FormattedTeste, specifier: "%.2f")").foregroundColor(.TextFieldColor)
                        TextField("", text: $notaN1).keyboardType(.numberPad)
                            .disableAutocorrection(true)
                            .accentColor(.clear)
                            .foregroundColor(.clear)
                            
                            .onReceive(Just(notaN1)) { _ in if notaN1.count > 4 {
                                notaN1 = String(notaN1.prefix(4))
                            }}
                        
                    }
                        
                }.padding(.bottom, 10)
                .padding(.leading, 20)
                .padding(.trailing, 20)
                
                VStack(alignment: .leading){
                    Text("Segunda Etapa(N2):")
                        .font(.system(size: 20, weight: .regular, design: .default))
                        .foregroundColor(.black)
                    ZStack(alignment: .leading){
                        Text("\(notaN2FormattedTeste, specifier: "%.2f")").foregroundColor(.TextFieldColor)
                        TextField("", text: $notaN2).keyboardType(.numberPad)
                            .disableAutocorrection(true)
                            .accentColor(.clear)
                            .foregroundColor(.clear)
                            .onReceive(Just(notaN2)) { _ in if notaN2.count > 4 {
                                notaN2 = String(notaN2.prefix(4))
                            }}
                        
                    }
                }.padding(.bottom, 10)
                .padding(.leading, 20)
                .padding(.trailing, 20)
                
                VStack(alignment: .leading){
                    Text("Avalição Final(AF):")
                        .font(.system(size: 20, weight: .regular, design: .default))
                        .foregroundColor(.black)
                    ZStack(alignment: .leading){
                        Text("\(notaAFFormattedTeste, specifier: "%.2f")").foregroundColor(.TextFieldColor)
                        TextField("", text: $notaAF).keyboardType(.numberPad)
                            .disableAutocorrection(true)
                            .accentColor(.clear)
                            .foregroundColor(.clear)
                            .onReceive(Just(notaAF)) { _ in if notaAF.count > 4 {
                                notaAF = String(notaAF.prefix(4))
                            }}
                    }
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
            
            var notaN1Formatted = editDataMateria.notaN1
            var notaN2Formatted = editDataMateria.notaN2
            var notaAFFormatted = editDataMateria.notaAF
            
            if nome.count == 0 {
                nome = editDataMateria.nome
            }
            
            if notaN1.count != 0 && notaN1FormattedTeste >= 0 && notaN1FormattedTeste <= 10 {
                notaN1Formatted = notaN1FormattedTeste
            }
            
            if notaN2.count != 0 && notaN2FormattedTeste >= 0 && notaN2FormattedTeste <= 10  {
                notaN2Formatted = notaN2FormattedTeste
            }
            
            if notaAF.count != 0 && notaAFFormattedTeste >= 0 && notaAFFormattedTeste <= 10  {
                notaAFFormatted = notaAFFormattedTeste  
            }
            
            materiaViewModel.editSave(edit: editDataMateria ,nome: nome, notaN1: notaN1Formatted, notaN2: notaN2Formatted, notaAF: notaAFFormatted, viewContext: viewContext)
            
            self.presentationMode.wrappedValue.dismiss()
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

