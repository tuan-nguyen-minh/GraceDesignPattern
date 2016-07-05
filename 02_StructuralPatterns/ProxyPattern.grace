//The proxy pattern is a design pattern that creates a surrogate, or placeholder class. 
//Proxy instances accept requests from client objects, pass them to the underlying object and return the results. 
//Proxies can improve efficiency and enhance functionality.

//demonstrate how we use Proxy Pattern to cache file. 

class File (_fileName){
    var fileName := _fileName
    method open {}
}

class PDFDocument (_fileName) {
    inherit File (_fileName)

    method loadFile {
        print "Load file: {fileName}"
    }

    method open is override {
        print "Open file: {fileName}"
    }
}

class ProxyFile (_fileName) {
    inherit File (_fileName)
    var pDFDocument := false

    method open is override {
        if (pDFDocument == false) then {
            pDFDocument := PDFDocument (fileName)
            pDFDocument.loadFile
        }
        pDFDocument.open
    }
}

var file := ProxyFile("textBook.pdf")
file.open
file.open
    