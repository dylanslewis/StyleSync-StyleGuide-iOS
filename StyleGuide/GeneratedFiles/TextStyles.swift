//
//  Style Guide v9.0
//  
//  Generated by StyleSync
//  https://github.com/dylanslewis/StyleSync
//

import UIKit

public struct TextStyle {
	let font: UIFont
	let color: UIColor
	let kerning: CGFloat
	let lineHeight: CGFloat

	init(
		fontName: String,
		pointSize: CGFloat,
		color: UIColor,
		kerning: CGFloat,
		lineHeight: CGFloat
	) {
		let fontDescriptor = UIFontDescriptor(name: fontName, size: pointSize)
		self.font = UIFont(descriptor: fontDescriptor, size: pointSize)
		self.color = color
		self.kerning = kerning
		self.lineHeight = lineHeight
	}
}

extension TextStyle {

	static let sampleHeading = TextStyle(
		fontName: ".SFUIDisplay-Heavy",
		pointSize: 24.0,
		color: .sampleBlack,
		kerning: -0.71,
		lineHeight: 30.0
	)

	static let sampleBody = TextStyle(
		fontName: ".SFUIDisplay-Medium",
		pointSize: 12.0,
		color: .sampleBlack,
		kerning: 0.6,
		lineHeight: 30.0
	)

	static let sampleCaption = TextStyle(
		fontName: ".SFUIText-Light",
		pointSize: 8.0,
		color: .sampleGreen,
		kerning: 0.4,
		lineHeight: 30.0
	)

	@available(*, deprecated)
	static let sampleTitle = TextStyle(
		fontName: ".SFUIDisplay-Semibold",
		pointSize: 15.0,
		color: .sampleBlack,
		kerning: 0.56,
		lineHeight: 30.0
	)

	public static let allGeneratedStylesAndCodeNameAndName: [(TextStyle, String, String)] = [
			(.sampleHeading, "sampleHeading", "Sample Heading"),
			(.sampleBody, "sampleBody", "Sample Body"),
			(.sampleCaption, "sampleCaption", "Sample Caption"),
			(.sampleTitle, "sampleTitle", "Sample Title"),
	]
}

extension NSAttributedString {
	private static func attributes(for textStyle: TextStyle) -> [NSAttributedStringKey: Any] {
		let paragraphStyle = NSMutableParagraphStyle()
		paragraphStyle.maximumLineHeight = textStyle.lineHeight
		return [
			.font: textStyle.font,
			.foregroundColor: textStyle.color,
			.kern: textStyle.kerning,
			.paragraphStyle: paragraphStyle
		]
	}

	public convenience init(string: String, textStyle: TextStyle) {
		let attributes = NSAttributedString.attributes(for: textStyle)
		self.init(string: string, attributes: attributes)
	}
}
