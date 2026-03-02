//
//  SettingsScreen.swift
//  CarShopAfon
//
//  Created by afon.com on 01.02.2026.
//


import SwiftUI

struct SettingsScreen: View {
    @StateObject private var viewModel: SettingsViewModel
    private var presenter: SettingsPresenter
    
    init(
        viewModel: SettingsViewModel,
        presenter: SettingsPresenter
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.presenter = presenter
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 0) {
            switch viewModel.viewState {
            case .loading:
                ProgressView()
                
            case .loaded:
                makeSettingsListView()
                
            case .error:
                Text(L10n.Text.error)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.appBackground)
        .navigationTitle(L10n.NavigationTitle.settings)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color.appBackground, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .preferredColorScheme(
            viewModel.isDarkMode ? .dark : .light
        )
        .task {
            presenter.load()
        }
    }
}

extension SettingsScreen {
    private func makeSettingsListView() -> some View {
        List {
            // MARK: - Предпочтения
            Section(L10n.Section.preferences) {
                darkModeView
                
                languagePickerView
            }
            .listRowBackground(Color.appBackground)
            // MARK: - Поддержка
            Section(L10n.Section.support) {
                rateAppView
                
                sendFeedbackView
                
                versionView
            }
            .listRowBackground(Color.appBackground)
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(Color.appBackground)
    }
    
    
    var darkModeView: some View {
        HStack {
            Image(systemName: "moon.fill")
                .foregroundColor(Color.symbolDarkTheme)
                .frame(width: 24, height: 24)
            
            Text(L10n.Text.darkMode)
                .foregroundStyle(Color.textDark)
            
            Spacer()
            
            Toggle("", isOn: $viewModel.isDarkMode)
                .labelsHidden()
                .onChange(of: viewModel.isDarkMode) { _, newValue in
                    presenter.toggleDarkMode(newValue)
                }
        }
    }
    
    var languagePickerView: some View {
        HStack {
            Image(systemName: "globe")
                .foregroundColor(Color.symbolLanguage)
                .frame(width: 24, height: 24)
            
            Text(L10n.Text.language)
                .foregroundStyle(Color.textDark)
            
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
    
    var rateAppView: some View {
        Button {
            presenter.requestAppReview()
        } label: {
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(Color.symbolGradeApp)
                    .frame(width: 24, height: 24)
                
                Text(L10n.Text.rateTheApp)
                    .foregroundStyle(Color.textDark)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(Color.textSubGray)
                    .font(.caption)
            }
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
    
    var sendFeedbackView: some View {
        Button {
            presenter.sendFeedback()
        } label: {
            HStack {
                Image(systemName: "envelope.fill")
                    .foregroundColor(Color.symbolSendFeedback)
                    .frame(width: 24, height: 24)
                
                Text(L10n.Text.sendFeedback)
                    .foregroundStyle(Color.textDark)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(Color.textSubGray)
                    .font(.caption)
            }
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
    
    var versionView: some View {
        HStack {
            Image(systemName: "info.circle.fill")
                .foregroundColor(Color.textSubGray)
                .frame(width: 24, height: 24)
            
            Text(L10n.Text.version)
                .foregroundStyle(Color.textDark)
            
            Spacer()
            
            Text(viewModel.appVersion)
                .foregroundColor(Color.textDark)
        }
    }
}
