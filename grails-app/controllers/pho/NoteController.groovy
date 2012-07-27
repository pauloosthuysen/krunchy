package pho

class NoteController {
    def beforeInterceptor = [action: this.&checkUser]
    static scaffold = true

    def checkUser() {
        if (!session.user) {
            redirect(controller: "user", action: "login")
            return false
        }
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [noteInstanceList: Note.findAllWhere(user: session.user,params), noteInstanceTotal: Note.count()]
    }

    def show(Long id) {
        def noteInstance = Note.get(id)
        if (!noteInstance || noteInstance.user.id != session.user.id) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'note.label', default: 'Note'), id])
            redirect(action: "list")
            return
        }

        [noteInstance: noteInstance]
    }

    def edit(Long id) {
        def noteInstance = Note.get(id)
        if (!noteInstance || noteInstance.user.id != session.user.id) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'note.label', default: 'Note'), id])
            redirect(action: "list")
            return
        }

        [noteInstance: noteInstance]
    }
}
