//
//  CardMateriaView.swift
//  NotaIF2
//
//  Created by Paulo Uchôa on 08/02/21.
//

import SwiftUI

struct MateriaView: View {
 
    var dataMateria = Materia()
    
    var body: some View {
        VStack {
            ZStack {
        
                VStack(alignment: .center) {
                    Text(dataMateria.nome)
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                        .font(.system(size: 24))
                        .padding(.bottom, 10)
                        .padding(.horizontal, 20)

                    HStack(spacing: 20) {
                            VStack {
                                Text("Média Atual")
                                    .fontWeight(.medium)
                                    .foregroundColor(.black)
                                    .font(.system(size: 15))
                                    
                                Spacer()
                                
                                Text("???")
                                    .fontWeight(.medium)
                                    .foregroundColor(.black)
                                    .font(.system(size: 17))
                                    
                            }.frame(width: 100, height: 34, alignment: .center)
                        .shadow(color: Color.black.opacity(0.12), radius: 4, x: 0, y: 2)
                    
                            VStack {
                                
                                Text("Quanto Falta")
                                    .fontWeight(.medium)
                                    .foregroundColor(.black)
                                    .font(.system(size: 15))
                                
                                Spacer()
                                
                                Text("???")
                                    .fontWeight(.medium)
                                    .foregroundColor(.black)
                                    .font(.system(size: 17))
                                
                            }.frame(width: 100, height: 34, alignment: .center)
                        .shadow(color: Color.black.opacity(0.12), radius: 4, x: 0, y: 2)
                        
                        VStack {
                            
                            Text("Média Final")
                                .fontWeight(.medium)
                                .foregroundColor(.black)
                                .font(.system(size: 15))
                            
                            Spacer()
                            
                            Text("???")
                                .fontWeight(.medium)
                                .foregroundColor(.black)
                                .font(.system(size: 17))
                        }.frame(width: 100, height: 34, alignment: .center)
                    .shadow(color: Color.black.opacity(0.12), radius: 4, x: 0, y: 2)
                        
                        
                    }
                    .padding(.bottom, 20)
                    .padding(.top, 10)

                }
                .padding(.top, UIScreen.main.bounds.size.height*0.1)
                .frame(minWidth: UIScreen.main.bounds.size.width)

            }
            .edgesIgnoringSafeArea(.top)
            .background(LinearGradient(gradient: Gradient(colors: [.cardGrad1, .cardGrad2]), startPoint: .topLeading, endPoint: .bottomTrailing).blur(radius: 3.0))
            .border(LinearGradient(gradient: Gradient(colors: [.BorderCard1, .BorderCard2]), startPoint: .topLeading, endPoint: .bottom))
            .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 4)
            .clipShape(RoundedCorner(radius: 40, corners: [.bottomLeft, .bottomRight]))
            .padding(.bottom, 30)

            VStack {
                Text("Primeira Etapa:")
                    .font(.system(size: 20, weight: .regular, design: .default))
                    .foregroundColor(.black)
                
                ZStack {
                    HStack {
                        Text(String(format: "%.2f", dataMateria.notaN1))
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                            .font(.system(size: 20))
                            .padding([.leading, .trailing], 20)
                            .padding(.vertical, 10)
                    }
                    
                }.background(LinearGradient(gradient: Gradient(colors: [.cardGrad1, .cardGrad2]), startPoint: .topLeading, endPoint: .bottomTrailing).blur(radius: 3.0))
                .border(LinearGradient(gradient: Gradient(colors: [.BorderCard1, .BorderCard2]), startPoint: .topLeading, endPoint: .bottom))
                .cornerRadius(5)
                .padding(.top, 10)
                .padding(.bottom,20)
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 4)

                Text("Segunda Etapa:")
                    .font(.system(size: 20, weight: .regular, design: .default))
                    .foregroundColor(.black)
                
                ZStack {
                    HStack {
                        Text(String(format: "%.2f", dataMateria.notaN2))
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                            .font(.system(size: 20))
                            .padding([.leading, .trailing], 20)
                            .padding(.vertical, 10)
                    }
                }.background(LinearGradient(gradient: Gradient(colors: [.cardGrad1, .cardGrad2]), startPoint: .topLeading, endPoint: .bottomTrailing).blur(radius: 3.0))
                .border(LinearGradient(gradient: Gradient(colors: [.BorderCard1, .BorderCard2]), startPoint: .topLeading, endPoint: .bottom))
                .cornerRadius(5)
                .padding(.top, 10)
//                .padding(.bottom, 10)
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 4)
                   
                Text("Avalição Final:")
                    .font(.system(size: 20, weight: .regular, design: .default))
                    .foregroundColor(.black)
                
                ZStack {
                    HStack {
                        Text(String(format: "%.2f",dataMateria.notaAF))
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                            .font(.system(size: 20))
                            .padding([.leading, .trailing], 20)
                            .padding(.vertical, 10)
                    }
                }.background(LinearGradient(gradient: Gradient(colors: [.cardGrad1, .cardGrad2]), startPoint: .topLeading, endPoint: .bottomTrailing).blur(radius: 3.0))
                .border(LinearGradient(gradient: Gradient(colors: [.BorderCard1, .BorderCard2]), startPoint: .topLeading, endPoint: .bottom))
                .cornerRadius(5)
                .padding(.top, 10)
//                .padding(.bottom, 10)
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 4)
                Spacer()
                
    //            Image("Plantin2")
    //                .resizable()
    //                .scaledToFit()
    //                .padding(.bottom, -5)
    //                .frame(minWidth: 100, idealWidth: 100, maxWidth: 140, minHeight: 160, idealHeight: 160, maxHeight: 200, alignment: .bottom)
            }

        }.clipped()
        .background(Image("Background")
            .resizable()
            .edgesIgnoringSafeArea(.all)
            .scaledToFill()
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
                
//        .navigationBarTitle("Matérias", displayMode: .inline)
        .foregroundColor(.BorderCard2)
        .navigationBarItems(trailing: trailingButton)
        
        .edgesIgnoringSafeArea(.vertical)
        
    }
    
    var trailingButton: some View {
        NavigationLink(destination: EditMateriaView(editDataMateria: dataMateria)) {
            Image(systemName: "ellipsis").imageScale(.large)
        }
        .foregroundColor(.actionColor)
    }
    
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


struct Materia_Previews: PreviewProvider {
    static var previews: some View {
        MateriaView()
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

