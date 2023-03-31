//
//  UserPlantsView.swift
//  Planted
//
//  Created by Kevin Buchholz on 3/29/23.
//

import SwiftUI
// create a card fpr user plants

struct MpCard: View {
    var  myPlants : MyPlants
    @EnvironmentObject private var vm : MyPlantsViewModel

    var body: some View {
        ZStack(alignment: .topTrailing){
        
            // if the toggle buton display descriptionwith light info
            
                    ZStack(alignment:.bottom){
                        Image(myPlants.imageUrl[0])
                            .resizable()
                            .cornerRadius(20)
                            .frame(width: 180)
                            .scaledToFit()
        
                        VStack(alignment: .leading){
                            Text("Latin Name")
                                .font(.footnote)
                            Text(myPlants.latinName)
                                .bold()
                            
//                            Text(myPlants.commonNames[0])
//                                .font(.caption)
                        }
                        .padding()
                        .frame(width: 180, alignment: .leading)
                        .background(.ultraThinMaterial)
                        .cornerRadius(20)
                        .overlay(
                            Button{
                                withAnimation{
                                    vm.showingDetails.toggle()
                                }
                            }
                            label:{
                                HStack{
                                    Spacer()
                                    Image(systemName: "chevron.down")
                                        .padding()
                                        .rotationEffect(Angle(degrees:
                                        vm.showingDetails ? 180 : 0))
                                }
                            }
                        )
        
        
        
        
                    }
                    .frame(width: 180,height: 250)
                .shadow(radius: 3)
        
                }
        
    }
}

struct UserPlantsView_Previews: PreviewProvider {
    static var previews: some View {
        MpCard(myPlants: PlantsDataService.myPlantList[0])
            .environmentObject(MyPlantsViewModel())
       
    }
}


//struct ProductCard: View {
//
////    let product access all the values fromt the prodict struct
//    @EnvironmentObject var cartManager : CartManagement
//
//    var product : Product
//    var body: some View {
//        ZStack(alignment: .topTrailing){
//
//            ZStack(alignment:.bottom){
//                Image(product.image)
//                    .resizable()
//                    .cornerRadius(20)
//                    .frame(width: 180)
//                    .scaledToFit()
//
//                VStack(alignment: .leading){
//                    Text(product.name)
//                        .bold()
//                Text("\(product.price)$")
//                        .font(.caption)
//                }
//                .padding()
//                .frame(width: 180, alignment: .leading)
//                .background(.ultraThinMaterial)
//                .cornerRadius(20)
//
//
//
//
//            }
//            .frame(width: 180,height: 250)
//        .shadow(radius: 3)
//
//
//            // created the lil plus button in top of corner
//            Button(){
//                // accesing data from inside our cartManger class
//        // this time we want to call a functon thats stored in there
//                // so we run that code when the button is pressed
//                cartManager.addToCart(product: product)
//            } label: {
//                Image(systemName: "plus")
//                    .padding(10)
//                    .foregroundColor(.white)
//                    .background(.black)
//                    .cornerRadius(50)
//                    .padding()
//            }
//        }
//
//
//    }
//}
//
//
//// when passing through data we gota have soemthing to showw
//struct ProductCard_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductCard(product: productList[0])
//            .environmentObject(CartManagement())
//    }
//}
