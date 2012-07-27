package pho

class User {

    static constraints = {
        email(email: true,blank: false, unique: true)
        password(blank: false,size: 4..8)
        isAdmin()
    }
    String email
    String password
    Boolean isAdmin

    String toString(){
        return email
    }
}
