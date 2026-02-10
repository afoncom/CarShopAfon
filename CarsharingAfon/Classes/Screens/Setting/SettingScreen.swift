//
//  SettingScreen.swift
//  CarsharingAfon
//
//  Created by afon.com on 01.02.2026.
//


import SwiftUI

struct SettingScreen: View {
    @StateObject private var viewModel: SettingViewModel
    private var presenter: SettingPresenter
    
    init(
        viewModel: SettingViewModel,
        presenter: SettingPresenterImpl
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.presenter = presenter
    }
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            VStack {
                switch viewModel.viewState {
                case .loading:
                    ProgressView()
                    
                case .loaded:
                    makeSettingsListView()
                    
                case .error:
                    Text("Ошибка загрузки")
                }
            }
            .navigationTitle("Настройки")
            .navigationBarTitleDisplayMode(.inline)
            .preferredColorScheme(
                viewModel.isDarkMode ? .dark : .light
            )
            .task {
                presenter.load()
            }
        }
    }
}

extension SettingScreen {
    private func makeSettingsListView() -> some View {
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
                    
                    Toggle("", isOn: $viewModel.isDarkMode)
                        .labelsHidden()
                        .onChange(of: viewModel.isDarkMode) { newValue in
                            presenter.toggleDarkMode(newValue)
                        }
                }
                
                // Language Picker
                HStack {
                    Image(systemName: "globe")
                        .foregroundColor(.orange)
                        .frame(width: 24, height: 24)
                    
                    Text("Язык")
                    
                    Spacer()
                    
                    Picker("", selection: $viewModel.language) {
                        Text("Русский").tag("ru")
                        Text("English").tag("en")
                    }
                    .pickerStyle(.menu)
                    .onChange(of: viewModel.language) { newValue in
                        presenter.setLanguage(newValue)
                    }
                }
            }
            // MARK: - Поддержка
            Section("Поддержка") {
                // Rate App
                Button {
                    print("Rate App tapped")
                } label: {
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
                }
                .buttonStyle(.plain)
                
                // Send Feedback
                Button {
                    print("Send Feedback tapped")
                } label: {
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
                }
                .buttonStyle(.plain)
                
                // Version
                HStack {
                    Image(systemName: "info.circle.fill")
                        .foregroundColor(.gray)
                        .frame(width: 24, height: 24)
                    
                    Text("Версия")
                    
                    Spacer()
                    
                    Text(viewModel.appVersion)
                        .foregroundColor(.gray)
                }
            }
            
        }
    }
}
