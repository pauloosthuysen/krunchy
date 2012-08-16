package pho

class User {

    static constraints = {
        email(blank: false)
        password(blank: false)
        isAdmin()
    }
    String email
    String password
    Boolean isAdmin

    String toString(){
        return email
    }
}
