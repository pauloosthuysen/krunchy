package pho

class Note {

    static constraints = {
        name(blank: false)
        subject()
        content(maxSize: 300)
    }
    String name
    String subject
    String content
    User user
}
