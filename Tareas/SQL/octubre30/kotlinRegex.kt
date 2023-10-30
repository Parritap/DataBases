fun main (args : Array<String>) {
    val regex = Regex("\\w*([aeiou])\\w*\\1+\\w*")
    println (regex.matches("ana"))
}
