import AppKit
import PDFKit
let folder = URL(fileURLWithPath: "/tmp/ym22-repair-build")
let document = PDFDocument(url: folder.appendingPathComponent("main.pdf"))!
print("Pages: \(document.pageCount)")
var text = ""
for index in 0..<document.pageCount {
    let page = document.page(at: index)!
    text += "PAGE \(index + 1)\n" + (page.string ?? "") + "\n"
    let bounds = page.bounds(for: .mediaBox)
    let image = page.thumbnail(of: NSSize(width: bounds.width * 1.7, height: bounds.height * 1.7), for: .mediaBox)
    let bitmap = NSBitmapImageRep(data: image.tiffRepresentation!)!
    try bitmap.representation(using: .png, properties: [:])!.write(to: folder.appendingPathComponent("page-\(index + 1).png"))
}
try text.write(to: folder.appendingPathComponent("main.txt"), atomically: true, encoding: .utf8)
