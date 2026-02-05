//
//  SettingScreen.swift
//  CarsharingAfon
//
//  Created by afon.com on 01.02.2026.
//


import SwiftUI

struct SettingScreen: View {
    @ObservedObject private var viewModel: SettingViewModel
    private let presenter: SettingPresenter
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var themeManager: ThemeManager
    
    init(
        viewModel: SettingViewModel,
        presenter: SettingPresenter
    ) {
        self.viewModel = viewModel
        self.presenter = presenter
    }
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            List {
                // MARK: - Предпочтения
                Section("Предпочтения") {
                    // Dark Mode Toggle
                    HStack {
                        Image(systemName: "moon.fill")
                            .foregroundColor(.blue)
                            .frame(width: 24, height: 24)
                        
                        Text("Темный режим")
                        
                        Spacer()
                        
                        Toggle("", isOn: $themeManager.isDarkMode)
                    }
                    
                    // Language Picker
                    HStack {
                        Image(systemName: "globe")
                            .foregroundColor(.orange)
                            .frame(width: 24, height: 24)
                        
                        Text("Язык")
                        
                        Spacer()
                        
                        Picker("", selection: $themeManager.language) {
                            Text("Русский").tag("ru")
                            Text("English").tag("en")
                        }
                        .pickerStyle(.menu)
                    }
                }
                // MARK: - Поддержка
                Section("Поддержка") {
                    // Rate App
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .frame(width: 24, height: 24)
                        
                        Text("Оценить приложение")
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    .contentShape(Rectangle())
                    .accessibilityAddTraits(.isButton)
                    .onTapGesture {
                        print("Rate App tapped")
                    }
                    
                    // Send Feedback
                    HStack {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.blue)
                            .frame(width: 24, height: 24)
                        
                        Text("Отправить отзыв")
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    .contentShape(Rectangle())
                    .accessibilityAddTraits(.isButton)
                    .onTapGesture {
                        print("Send Feedback tapped")
                    }
                    
                    // Version
                    HStack {
                        Image(systemName: "info.circle.fill")
                            .foregroundColor(.gray)
                            .frame(width: 24, height: 24)
                        
                        Text("Версия")
                        
                        Spacer()
                        
                        Text("1.0.0")
                            .foregroundColor(.gray)
                    }
                }
                
            }
            .navigationTitle("Настройки")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Готово") {
                        dismiss()
                    }
                }
            }
            .preferredColorScheme(themeManager.colorScheme)
        }
    }
}
