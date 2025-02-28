import UIKit.UIImage

extension FileManagerService {
    func saveImage(data: Data, for id: String) async {
        let path = FileManagerService.Keys.image(id: id).path
        saveFile(data: data, forPath: path)
    }
    
    func fetchImage(with id: String) async -> Data? {
        let path = FileManagerService.Keys.image(id: id).path
        let imageData = getFile(forPath: path)
        return imageData
    }
    
    func removeImage(with id: String) async {
        let path = FileManagerService.Keys.image(id: id).path
        removeFile(forPath: path)
    }
}

extension FileManagerService {
    func saveImages(baseID: String, images: [UIImage]) async -> [String] {
        let fileManager = FileManagerService()
        
        let imageIds = images.compactMap {
            $0.sha256Hash(appending: baseID)
        }
        
        for id in imageIds {
            if let image = images.first(where: { $0.sha256Hash(appending: baseID) == id }),
               let imageData = image.pngData() {
                await fileManager.saveImage(data: imageData, for: id)
            }
        }
        
        return imageIds
    }
}
