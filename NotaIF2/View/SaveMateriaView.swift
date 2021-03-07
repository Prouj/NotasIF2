//
//  EditMateriaView.swift
//  NotaIF2
//
//  Created by Paulo Uchôa on 08/02/21.
//

import SwiftUI
import Combine
import ToastUI

struct SaveMateriaView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.presentationMode) var presentationMode2
    @Environment(\.presentationMode) var presentationMode3
    @State private var materia: Materia = Materia()
    @ObservedObject private var materiaViewModel: MateriaViewModel = MateriaViewModel()
    
    @State public var nome = ""
    @State var notaN1 = ""
    @State var notaN2 = ""
    @State var notaAF = ""
    @State var presentingToast = false
    @State var presentingToast2 = false
    @State var presentingToast3 = false
    @State var play = 0
    
    var notaN1FormattedTeste: Double {
            return (Double(notaN1) ?? 0) / 100
    }
    
    var notaN2FormattedTeste: Double {
            return (Double(notaN2) ?? 0) / 100
    }
    
    var notaAFFormattedTeste: Double {
            return (Double(notaAF) ?? 0) / 100
    }
    
    var notaN1Formatted: Double = 0
    
    var notaN2Formatted: Double = 0
    
    var notaAFFormatted: Double = 0
    
    var body: some View {
        ZStack() {
            VStack {
                VStack(alignment: .leading){
                    Text("Matéria:")
                        .font(.system(size: 20, weight: .regular, design: .default))
                        .foregroundColor(.black)
                    TextField("Entre com o nome da matéria aqui ...", text: $nome)
                        .disableAutocorrection(true)
                        .accentColor(.TextFieldColor)
                        .foregroundColor(.TextFieldColor)
                        .onReceive(Just(nome)) { _ in if nome.count > 30 {
                            nome = String(nome.prefix(30))
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
            
            .navigationTitle("Nova Matéria")
            .navigationBarItems(trailing: trailingButtom)
            
            .toast(isPresented: $presentingToast) {
                  ToastView {
                    VStack {
                        LottieView(name: "error", play: $play)
                            .frame(width: 75, height: 75)
                      Text("Olá, antes de salvar\n dê um nome à matéria.")
                        .padding(.bottom, 10)
                        .padding(.horizontal, 10)
                        .multilineTextAlignment(.center)

                      Button {
                        presentingToast = false
                      } label: {
                        Text("Entendi")
                          .bold()
                          .foregroundColor(.white)
                          .padding(.horizontal)
                          .padding(.vertical, 12.0)
                          .background(Color.accentColor)
                          .cornerRadius(8.0)
                        
                      }
                    }
                  }
                  .colorScheme(.light)
            }
            
            .toast(isPresented: $presentingToast2) {
                  ToastView {
                    VStack {
                        LottieView(name: "error", play: $play)
                            .frame(width: 75, height: 75)
                      Text("Olá, as notas devem ter\n um valor de 0 a 10.")
                        .padding(.bottom, 10)
                        .padding(.horizontal, 10)
                        .multilineTextAlignment(.center)

                      Button {
                        presentingToast2 = false
                      } label: {
                        Text("Entendi")
                          .bold()
                          .foregroundColor(.white)
                          .padding(.horizontal)
                          .padding(.vertical, 12.0)
                          .background(Color.accentColor)
                          .cornerRadius(8.0)
                      }
                    }
                  }.colorScheme(.light)
                 
            }
            
            .toast(isPresented: $presentingToast3) {
                ToastView{
                    ZStack {
                        LottieView(name: "save", play: $play)
                        .frame(width: 100, height: 100)
                    }
                }.colorScheme(.light)
            }
            

            
            
        }.clipped()
        .background(Image("Background")
        .resizable()
        .scaledToFill()
        .edgesIgnoringSafeArea(.all)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    }
    
//    var popUP: some View {
//
//
//    }
    
    var trailingButtom: some View {
            
        Button(action: {
            if nome.count == 0 {
                presentingToast = true
            } else {
                if notaN1FormattedTeste >= 0 && notaN1FormattedTeste <= 10 && notaN2FormattedTeste >= 0 && notaN2FormattedTeste <= 10 && notaAFFormattedTeste >= 0 && notaAFFormattedTeste <= 10 {
                    
                    var notaN1Formatted = notaN1FormattedTeste
                    var notaN2Formatted = notaN2FormattedTeste
                    var notaAFFormatted = notaAFFormattedTeste
                    
                    materiaViewModel.save(nome: nome, notaN1: notaN1Formatted, notaN2: notaN2Formatted, notaAF: notaAFFormatted, viewContext: viewContext)
                    presentingToast3 = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                        presentingToast3 = false
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
                } else {
                    presentingToast2 = true
                }
//                presentingToast3 = false
            }
        }) {
            Text("OK")
            }.foregroundColor(.actionColor)
    }

}

//struct ToastViewContent: View {
//    @Binding var presentingToast: Bool
//    @Binding var presentingAnimation: Bool
//    @State var deuRuim: Bool = false
//
//    @Environment(\.managedObjectContext) private var viewContext
//    @ObservedObject private var materiaViewModel: MateriaViewModel = MateriaViewModel()
//
//    var body: some View {
//
//                    .toast(isPresented: $deuRuim) {
//                        ToastView {
//                            VStack {
//                                Text("Os valores estão conflitantes.")
//                                    .padding(.bottom)
//                                    .multilineTextAlignment(.center)
//                                    .frame(width: 200, height: 100)
//
//                                Button {
//                                    deuRuim = false
//                                } label: {
//                                    Text("OK")
//                                        .bold()
//                                        .foregroundColor(.white)
//                                        .padding(.horizontal)
//                                        .padding(.vertical, 12.0)
//                                        .background(Color(UIColor.systemRed).opacity(0.9))
//                                        .cornerRadius(10)
//                                }.padding(.bottom, 10)
//                            }
//                        }
//                    }
//
//                    Button(action: {
//                        if modo == "Retirar" {
//                            if valorRetir < 0 {
//                                deuRuim = true
//                            } else {
//                                objetivo.valorDepositado -= valorFormatted
//                            }
//                        } else {
//                            if valorDeposit > objetivo.valorTotal {
//                                deuRuim = true
//                            } else {
//                                objetivo.valorDepositado += valorFormatted
//                            }
//                        }
//                        if !deuRuim {
//                            objetivoViewModel.update(viewContext: viewContext, objetivo: objetivo)
//                            valor = ""
//                            presentingAnimation = true
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
//                                presentingToast = false
//                                presentingAnimation = false
//                            }
//                        }
//                    }) {
//                        ZStack {
//                            RoundedRectangle(cornerRadius: 10)
//                                .foregroundColor(.darkGreen)
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .stroke(Color.darkGreen, lineWidth: 0.5)
//                                )
//                                .frame(width: 90, height: 34)
//                            Text(modo)
//                                .foregroundColor(.white)
//                                .font(.system(size: 17, weight: .regular, design: .default))
//                        }
//                    }
//                }.padding(.top, 20)
//            }
//            .padding(.vertical, 15)
//
//        } else {
//            LottieView(name: "animation", play: $isShowing)
//                .frame(width: 200, height: 200)
//        }
//
//    }
//}

struct SaveMateriaView_Previews: PreviewProvider {
    static var previews: some View {
        SaveMateriaView()
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

