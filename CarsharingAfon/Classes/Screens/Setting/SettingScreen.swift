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
                    Text(L10n.Text.error)
                }
            }
            .navigationTitle(L10n.NavigationTitle.settings)
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
            Section(L10n.Section.preferences) {
                // Dark Mode Toggle
                HStack {
                    Image(systemName: "moon.fill")
                        .foregroundColor(Color.symbolDarkTheme)
                        .frame(width: 24, height: 24)
                    
                    Text(L10n.Text.darkMode)
                    
                    Spacer()
                    
                    Toggle("", isOn: $viewModel.isDarkMode)
                        .labelsHidden()
                        .onChange(of: viewModel.isDarkMode) { _, newValue in
                            presenter.toggleDarkMode(newValue)
                        }
                }
                
                // Language Picker
                HStack {
                    Image(systemName: "globe")
                        .foregroundColor(Color.symbolLanguage)
                        .frame(width: 24, height: 24)
                    
                    Text(L10n.Text.language)
                    
                    Spacer()
                    
                    Picker("", selection: $viewModel.language) {
                        Text(L10n.Text.russian).tag("ru")
                        Text(L10n.Text.english).tag("en")
                    }
                    .pickerStyle(.menu)
                    .onChange(of: viewModel.language) { _, newValue in
                        presenter.setLanguage(newValue)
                    }
                }
            }
            // MARK: - Поддержка
            Section(L10n.Section.support) {
                // Rate App
                Button {
                    print("Rate App tapped")
                } label: {
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.symbolGradeApp)
                            .frame(width: 24, height: 24)
                        
                        Text(L10n.Text.rateTheApp)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color.textSubGray)
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
                            .foregroundColor(Color.symbolSendFeedback)
                            .frame(width: 24, height: 24)
                        
                        Text(L10n.Text.sendFeedback)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color.textSubGray)
                            .font(.caption)
                    }
                }
                .buttonStyle(.plain)
                
                // Version
                HStack {
                    Image(systemName: "info.circle.fill")
                        .foregroundColor(Color.textSubGray)
                        .frame(width: 24, height: 24)
                    
                    Text(L10n.Text.version)
                    
                    Spacer()
                    
                    Text(viewModel.appVersion)
                        .foregroundColor(Color.textSubGray)
                }
            }
            
        }
    }
}
