import SwiftUI

struct tela4: View {
    // Variáveis de estado (Inputs e Resultados)
    @State private var distancia: Double? = nil
    @State private var tempo: Double? = nil
    @State private var velocidade: Double = 0.0
    @State private var calculou: Bool = false
    
    var body: some View {
        ZStack {
            // Fundo dinâmico baseado no cálculo
            corFundo
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                // Inputs do Usuário
                VStack(spacing: 5) {
                    Text("Digite a distância (km):")
                        .font(.subheadline)
                        .bold()
                    
                    TextField("0", value: $distancia, format: .number)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 150)
                        .multilineTextAlignment(.center)
                    
                    Text("Digite o tempo (h):")
                        .font(.subheadline)
                        .bold()
                        .padding(.top, 10)
                    
                    TextField("0", value: $tempo, format: .number)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 150)
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 40)
                
                // Botão de Cálculo
                Button(action: calcular) {
                    Text("Calcular")
                        .fontWeight(.bold)
                        .foregroundColor(.orange)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 10)
                        .background(Color.black)
                        .cornerRadius(10)
                }
                
                // Resultado da Velocidade
                Text(String(format: "%.2f km/h", velocidade))
                    .font(.system(size: 32, weight: .regular))
                    .padding(.top, 20)
                
                // Imagem Dinâmica do Animal
                if calculou {
                    Image(nomeImagem)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 250, height: 250)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                } else {
                    // Estado Inicial (Ponto de interrogação)
                    ZStack {
                        Circle()
                            .fill(Color.orange)
                            .frame(width: 250, height: 250)
                        Image(systemName: "questionmark")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 100, height: 100)
                            .bold()
                    }
                }
                
                Spacer()
                
                // Legenda Inferior
                LegendaView()
                    .padding(.bottom, 20)
            }
        }
    }
    
    func calcular() {
        // Garantindo que distancia e tempo existam e tempo seja maior que 0
        if let d = distancia, let t = tempo, t > 0 {
            velocidade = d / t
            calculou = true
        }
    }
    
    var corFundo: Color {
        if !calculou { return Color.gray.opacity(0.8) }
        
        switch velocidade {
        case 0..<10: return Color(hex: "#ABFFAC")   // Tartaruga
        case 10..<30: return Color(hex: "#ACFFF2")  // Elefante
        case 30..<70: return Color(hex: "#FFC5A6")  // Avestruz
        case 70..<90: return Color(hex: "#EEFFA4")  // Leão
        case 90...130: return Color(hex: "#FF7764") // Guepardo
        default: return Color.gray.opacity(0.8)
        }
    }
    
    var nomeImagem: String {
        switch velocidade {
        case 0..<10: return "tartaruga"
        case 10..<30: return "elefante"
        case 30..<70: return "avestruz"
        case 70..<90: return "leao"
        case 90...130: return "guepardo"
        default: return "interrogacao"
        }
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
struct LegendaView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            LinhaLegenda(animal: "TARTARUGA", intervalo: "(0 - 9.9km/h)", cor: Color(hex: "#ABFFAC"))
            LinhaLegenda(animal: "ELEFANTE", intervalo: "(10 - 29.9km/h)", cor: Color(hex: "#ACFFF2"))
            LinhaLegenda(animal: "AVESTRUZ", intervalo: "(30 - 69.9km/h)", cor: Color(hex: "#FFC5A6"))
            LinhaLegenda(animal: "LEÃO", intervalo: "(70 - 89.9km/h)", cor: Color(hex: "#EEFFA4"))
            LinhaLegenda(animal: "GUEPARDO", intervalo: "(90 - 130km/h)", cor: Color(hex: "#FF7764"))
        }
        .padding()
        .background(Color.black)
        .cornerRadius(10)
        .foregroundColor(.white)
        .font(.caption)
    }
}

struct LinhaLegenda: View {
    var animal: String
    var intervalo: String
    var cor: Color
    
    var body: some View {
        HStack {
            Text(animal)
                .frame(width: 80, alignment: .trailing)
            Text(intervalo)
                .frame(width: 100, alignment: .leading)
            Circle()
                .fill(cor)
                .frame(width: 15, height: 15)
        }
    }
}

#Preview {
    tela4()
}
