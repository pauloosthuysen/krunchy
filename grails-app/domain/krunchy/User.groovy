package krunchy

class User {

    static constraints = {
        name(blank: false)
        email(email: true)
    }
	String name
	String email
}
