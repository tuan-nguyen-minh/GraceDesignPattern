def nothing is public = object {
    method get(index) {
        Exception.raise "Index out of bounds"
    }

    method do(procedure) {}

    method asString {
        ""
    }
}

class node(element') is confidential {
// class node(element') {
    def element = element'
    var next := nothing

    method get(index) {
        if (index == 0) then {
            element
        } else {
            next.get(index - 1)
        }
    }

    method add(element') {
        if (next == nothing) then {
            next := node(element')
        } else {
            next.add(element')
        }
    }

    method do(procedure) {
        procedure.apply(element)
        next.do(procedure)
    }

    method asString {
        if (next == nothing) then {
            element.asString
        } else {
            "{element.asString}, {next.asString}"
            //element.asString
        }
    }
}

class with(elements) {
    var node := nothing
    var sizeOfList := 0
    method get(index) {
        node.get(index)
    }

    method add(element') {
        if (node == nothing) then {
            node := node(element')
        } else {
            node.add(element')
        }
        sizeOfList := sizeOfList + 1
    }

    method do(procedure) {
        node.do(procedure)
    }

    method size {
        sizeOfList
    }

    method asString {
        "{node.asString}"
    }

    for (elements) do { element' ->
        add(element')
    }

    method printAll {
        print "{node.asString}"
    }
}
