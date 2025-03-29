import SwiftUI

struct ContentView: View {
    @State private var isAddNewBedPresented = false // Управляет показом sheet
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    stops: [
                        Gradient.Stop(color: Color(red: 0.15, green: 0.71, blue: 1), location: 0),
                        Gradient.Stop(color: Color(red: 1, green: 0.97, blue: 0.56), location: 1),
                    ],
                    startPoint: UnitPoint(x: 1, y: 0),
                    endPoint: UnitPoint(x: 0, y: 1)
                )
                .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    
                    HStack {
                        
                        VStack(alignment: .leading) {
                            Text("Welcome back!")
                                .font(.system(size: 21, weight: .medium))
                                .foregroundColor(Color(red: 0.6, green: 0.6, blue: 0.6))
                            
                            Text("Evelina Penkova")
                                .font(.system(size: 21, weight: .medium))
                                .foregroundColor(.black)
                        }
                        Spacer()
                        
//                        HStack(spacing: 21) {
//                            NavigationLink(destination: ContentView()) {
//                                Image(systemName: "person.crop.circle")
//                                    .resizable()
//                                    .frame(width: 30, height: 30)
//                                    .foregroundColor(Color.white)
//                            }
//                            
//                            NavigationLink(destination: ContentView()) {
//                                Image(systemName: "bell")
//                                    .resizable()
//                                    .frame(width: 30, height: 30)
//                                    .foregroundColor(Color.white)
//                            }
//                        }
                    }
                    HStack{
                        Text("Today's work")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundStyle(Color.black)
                        Spacer()
                    }
                    DaylicView()
                    HStack {
                        Text("Grass beds")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundStyle(Color.black)
                        Spacer()
                        Button {
                            isAddNewBedPresented = true
                        } label: {
                            Text("Add new")
                                .font(.system(size: 19, weight: .medium))
                                .foregroundStyle(Color.black)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 12)
                                .background(Color(red: 0.73, green: 0.82, blue: 0.49))
                                .cornerRadius(18)
                        }
                    }
                    GardenBedView()
                }
                .padding(.horizontal)
                
            }
        }
        .sheet(isPresented: $isAddNewBedPresented) {
            AddNewBedView()
        }
    }
}

#Preview {
    ContentView()
}
