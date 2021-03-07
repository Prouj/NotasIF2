//
//  ListMateriaCell.swift
//  NotaIF2
//
//  Created by Paulo Uchôa on 08/02/21.
//

import SwiftUI

struct ListaMateriaCell: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject private var materiaViewModel: MateriaViewModel = MateriaViewModel()
    
   var dataMateria = Materia()
    
    var porcentagem: CGFloat {
       return (CGFloat(dataMateria.progress))
    }
    
    var body: some View {
        ZStack {
            HStack {
                Text(dataMateria.nome)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                    .font(.system(size: 20))
                    .padding(.leading, 20)
                    .padding(.vertical, 28)

                Spacer()
                ZStack {
                    ZStack {
                        Circle()
                            .fill(Color.cardGrad1)
                            .frame(width: 50, height: 50)
                            .overlay(
                        Circle()
                            .trim(from: 0, to: porcentagem * 0.1)
                            .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .bevel, miterLimit: 1.0))
                            .foregroundColor(.NotaBoa))
                        Text(String(format: "%.2f", porcentagem)).font(.system(size:15)).fontWeight(.heavy).foregroundColor(.black)
            //            animation(.easeIn)
                    }
                }.padding(.trailing, 20)
                
            }
        }.background(LinearGradient(gradient: Gradient(colors: [.cardGrad1, .cardGrad2]), startPoint: .topLeading, endPoint: .bottomTrailing).blur(radius: 3.0))
        .border(LinearGradient(gradient: Gradient(colors: [.BorderCard1, .BorderCard2]), startPoint: .topLeading, endPoint: .bottom))
        .cornerRadius(5)
        .padding(.leading, 30)
        .padding(.trailing, 30)
        .padding(.top, 5)
        .padding(.bottom,5)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 4)
        
    }
}

//struct Label: View {
//    var porcentagem: CGFloat = 50
//    var body: some View {
//        ZStack {
//            Text(String(format: "%.0f", porcentagem)).font(.system(size:17)).fontWeight(.heavy)
//        }
//    }
//}

//struct  Outline: View {
//    var porcentagem: CGFloat = 50
//    var body: some View {
//        ZStack {
//            Circle()
//                .fill(Color.clear)
//                .frame(width: 30, height: 30)
//                .overlay(
//                Circle()
//                    .trim(from: 0, to: porcentagem * 0.01)
//                    .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
//                    .foregroundColor(.NotaBoa)
////                ).animation(.spring(response: 0.05, dampingFraction: 0.50, blendDuration: 0.50))
//        }
//    }
//}

//struct Progress: View {
//
//    var porcentagem: CGFloat {
//       return (CGFloat(ListaMateriaCell().dataMateria.progress))
//    }
//    var body: some View {
//        ZStack {
//            Circle()
//                .fill(Color.cardGrad1)
//                .frame(width: 50, height: 50)
//                .overlay(
//            Circle()
//                .trim(from: 0, to: porcentagem * 0.1)
//                .stroke(style: StrokeStyle(lineWidth: 4))
//                .foregroundColor(.NotaBoa))
//            Text(String(format: "%.2f", porcentagem)).font(.system(size:17)).fontWeight(.heavy).foregroundColor(.black)
////            animation(.easeIn)
//        }
//    }
//}

struct ListaMateriaCell_Previews: PreviewProvider {
    static var previews: some View {
        ListaMateriaCell()
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}


extension Color {
    static let cardGrad1 = Color("CardGrad1")
    static let cardGrad2 = Color("CardGrad2")
    static let actionColor = Color("Action")
    static let NaviTitle = Color("NaviTitle")
    static let NotaBaixa = Color("NotaBaixa")
    static let NotaBoa = Color("NotaBoa")
    static let BorderCard1 = Color("BorderCard1")
    static let BorderCard2 = Color("BorderCard2")
    static let TextFieldColor = Color("textFieldColor")
}


