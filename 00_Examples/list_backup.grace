def nothing = object {
    method get(index) {
        Exception.raise "Index out of bounds"
    }

    method do(procedure) {}

    method asString {
        ""
    }
}

class node(element') is confidential {
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
        }
    }
}

class with(elements) {
    var node := nothing

    method get(index) {
        node.get(index)
    }

    method add(element') {
        if (node == nothing) then {
            node := node(element')
        } else {
            node.add(element')
        }
    }

    method do(procedure) {
        node.do(procedure)
    }

    method asString {
        "[{node.asString}]"
    }

    for (elements) do { element' ->
        add(element')
    }
}
