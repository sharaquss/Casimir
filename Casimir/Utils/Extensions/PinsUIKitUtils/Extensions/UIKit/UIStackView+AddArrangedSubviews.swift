import UIKit

extension UIStackView {
    /**
        Adds multiple views to the `arrangedSubviews` array.
        - Note: Order of the added subviews is maintained.
     */
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { addArrangedSubview($0) }
    }

    /**
        Removes multiple views from the passed array (or from the `arrangedSubviews` property if nil).
     */
    func removeArrangedSubviews(_ views: [UIView]? = nil) {
        (views ?? arrangedSubviews).forEach { removeArrangedSubview($0) }
    }

}
