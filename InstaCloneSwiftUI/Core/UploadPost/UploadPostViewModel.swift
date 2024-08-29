//
//  UploadPostViewModel.swift
//  InstaCloneSwiftUI
//
//  Created by Harun AYDIN on 3.08.2024.
//

import Foundation
import PhotosUI
import SwiftUI


@MainActor
class UploadPostViewModel: ObservableObject {
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage(fromItem: selectedImage)
            }
        }
    }
    
    @Published var postImage: Image?
    
    private func loadImage(fromItem item: PhotosPickerItem?) async {
        
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        
        guard let uiImage = UIImage(data: data) else { return }
        
        // Ana iş parçacığında postImage'i güncelle
        self.postImage = Image(uiImage: uiImage)
    }
}
