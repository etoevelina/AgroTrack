import SwiftUI

struct AuthorizationView: View {
    @State private var email = ""
    @State private var password = ""
    @ObservedObject private var userManager = ApiClientUser()
    @State private var showMainView = false
    private let defaults = UserDefaults.standard
    
    // Состояния для алертов
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var isSuccessAlert = false

    var body: some View {
        ZStack {
            Color(red: 0.97, green: 0.96, blue: 0.9)
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Логотип или изображение
                    Image("auth")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: 300)

                    // Поле логина
                    Text("Login:")
                        .font(.system(size: 24, weight: .medium))
                        .foregroundStyle(Color.black)
                    customTextField(text: $email, placeholder: "Enter email")

                    // Поле пароля
                    Text("Password:")
                        .font(.system(size: 24, weight: .medium))
                        .foregroundStyle(Color.black)
                    customTextField(text: $password, placeholder: "Enter password")
                        .textContentType(.password)
                        .submitLabel(.done)

                    // Кнопка входа
                    Button(action: signIn) {
                        Text("Sign in")
                            .font(.system(size: 23, weight: .semibold))
                            .foregroundStyle(Color.black)
                            .frame(width: 138, height: 50)
                            .background(Color(red: 0.83, green: 0.89, blue: 0.65))
                            .cornerRadius(28)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 20)
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 20)
            }
            .scrollDismissesKeyboard(.interactively)
        }
        .fullScreenCover(isPresented: $showMainView) {
            ContentView()
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(isSuccessAlert ? "Success" : "Error"),
                message: Text(alertMessage),
                dismissButton: .default(Text("OK")) {
                    if isSuccessAlert {
                        showMainView = true // Переход на главный экран после успешного алерта
                    }
                }
            )
        }
    }

    // Кастомное текстовое поле
    private func customTextField(text: Binding<String>, placeholder: String) -> some View {
        TextField(placeholder, text: text)
            .foregroundStyle(Color.black)
            .frame(height: 45)
            .padding(.horizontal, 12)
            .background(Color(red: 0.83, green: 0.89, blue: 0.65))
            .cornerRadius(7)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black.opacity(0.2), lineWidth: 1)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black.opacity(0.5), lineWidth: 4)
                    .blur(radius: 4)
                    .offset(y: 4)
                    .mask(RoundedRectangle(cornerRadius: 10).fill(Color.black.opacity(0.6)))
            )
    }

    // Логика входа
    private func signIn() {
        let user = NewUser(email: email, password: password)
        userManager.auth(data: user) { result in
            switch result {
            case .success:
                defaults.set(email, forKey: "token")
                defaults.set(true, forKey: "login")
            case .failure(let error):
                alertMessage = "Authentication failed: \(error.localizedDescription)"
                isSuccessAlert = false
                showAlert = true
                print("Auth error: \(error)")
            }
        }
    }
}

#Preview {
    AuthorizationView()
}
