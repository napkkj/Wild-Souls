import SwiftUI


struct LoginDropDown :View {
    @State var expand = false
    @State var username: String = ""
    
    var body : some View{
        VStack{
            HStack{
                Text("Login")
                .font(.title)
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
                
            }
            .onTapGesture {
                self.expand.toggle()
                
            
            }
            if expand {
                TextField("Usuário", text: $username)
                    .padding()
                    .foregroundColor(.white)
                    .cornerRadius(40)
                    .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.blue, lineWidth:2)
                    )
                
                NavigationLink("Entrar") {
                    HomeView(name: username)
                    
                }
                .disabled(username.isEmpty)
                .navigationTitle("Unwaste")
                
            }
            
        }
        .padding()
        .background(LinearGradient(gradient:.init(colors: [.black,.black]), startPoint: .bottom, endPoint: .bottom))
        .cornerRadius(50)
        .animation(.spring())
    }
    
}

struct HomeView: View {
    
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    var body: some View {
        NavigationLink("Locais de Descarte") {
            VStack(alignment: .leading){
                Text("➤ Locais com coleta seletiva:")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.regular)
                Text("Pontos de entrega disponíveis na cidade de Fortaleza (CE).")
                    .font(.headline)
                    .padding()
                Text("")
                Spacer()
            }
        }
        .padding()
        NavigationLink("Dúvidas Frequentes") {
            DropDown()
            
        }
        .padding()
        .navigationTitle("Olá, \(name)")
    }
}


struct ContentView: View {
    @State var username: String = ""
    var body: some View {
        NavigationView {
            VStack {
                LoginDropDown()
                    .navigationTitle("Unwaste")
                
                
            }
            
        }
        
    }
}
struct DropDown : View {
    
    @State var expandone = false
    @State var expandtwo = false
        
    var body : some View{
        
        VStack{
            
            HStack{
                
                Text("O que é E-Waste")
                    .foregroundColor(.white)
                
                
            }.onTapGesture {
                self.expandone.toggle()
                
            }
            
            if expandone{
                Text("É um termo usado para se referir a todos os equipamentos eletroeletrônicos, que são descartados por seus proprietários sem a itenção de utilizá-los mais. Com o rápido avanço da tecnologia, o mundo produz cada vez mais E-West, devido, também, a obsolescência programada")
                    .font(.system(size: 18))
                    .padding()
            
            }
        }
        .padding()
        .background(LinearGradient(gradient: .init(colors: [.blue,.blue]), startPoint: .bottom, endPoint: .bottom))
        .cornerRadius(35)
        .animation(.spring())
        
        VStack{
        
            HStack{
            
            Text("Cautela no descarte")
                .foregroundColor(.white)
            
            
        }.onTapGesture {
            
            self.expandtwo.toggle()
            
        }
        
        if expandtwo{
            Text("O lixo eletrônico contém uma lista de produtos químicos que são prejudiciais às pessoas e ao meio ambiente, como o mercúrio e o chumbo. Levar esses equipamentos à um local específico facilita a reciclagem e reaproveitamento de peças e materiais que ainda podem ser utilizados, além de impedir a propagação de resíduos em ambientes que estes fariam mal")
                .font(.system(size: 18))
                .padding()
            
            
            
            
        }
    }
    .padding()
    .background(LinearGradient(gradient: .init(colors: [.blue,.blue]), startPoint: .bottom, endPoint: .bottom))
    .cornerRadius(35)
    .animation(.spring())
                    


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}

