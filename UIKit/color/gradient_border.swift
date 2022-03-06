/*
     And then you create color like this:

          let gradient = UIImage.gradientImage(bounds: borderView.bounds, colors: [.systemBlue, .systemRed])
          let gradientColor = UIColor(patternImage: gradient)
     
     Last step is just a matter of assignment:

          borderView.layer.borderColor = gradientColor.cgColor
          borderView.layer.borderWidth = 3
     
     And we have a view with a gradient border.
*/



extension UIImage {
    static func gradientImage(bounds: CGRect, colors: [UIColor]) -> UIImage {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map(\.cgColor)

        // This makes it left to right, default is top to bottom
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)

        let renderer = UIGraphicsImageRenderer(bounds: bounds)

        return renderer.image { ctx in
            gradientLayer.render(in: ctx.cgContext)
        }
    }
}

