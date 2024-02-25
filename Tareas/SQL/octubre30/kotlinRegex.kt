fun main (args : Array<String>) {
  val str : String = "4500022432F900B901012A7AC0A80166803B1764"
  //Split str into groups of 4 characters, separate them with a dash
    val regex = "(.{4})".toRegex()
    val result = regex.replace(str, "$1-")
    println(result)
    
}
