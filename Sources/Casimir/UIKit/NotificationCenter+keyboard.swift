#if canImport(UIKit)
import UIKit
import Combine

@available(iOS 13.0, *)
extension NotificationCenter {
    var keyboardHeight: AnyPublisher<CGFloat, Never> {
        Publishers.MergeMany(
            publisher(for: UIApplication.keyboardWillShowNotification).map { $0.keyboardHeight },
            publisher(for: UIApplication.keyboardWillHideNotification).map { _ in CGFloat(0) })
            .eraseToAnyPublisher()
    }
}

private extension Notification {
    var keyboardHeight: CGFloat {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }
}
#endif