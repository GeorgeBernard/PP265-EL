object RankQuiz {

  def main(args: Array[String]): Unit = {
    import scala.util.Sorting 

    object preferenceOrdering extends Ordering[String] {
      def compare(a: String, b: String) = askPreference[String](a, b)
    }

    Sorting.quickSort(args)(preferenceOrdering)

    args.zipWithIndex.reverse.foreach(println)
  }

  def askPreference[T](a: T, b: T): Int = {
    import scala.io 
    
    val aStr = a.toString()
    val bStr = b.toString()
    val ask = "Do you prefer " + aStr + " over " + bStr + "\n"
    val select = "z for yes, x for no preference, c for no \n"
    val choice = io.StdIn.readLine(ask + select)   
   
    val preference = choice match {
      case "z"  => 1
      case "x"  => 0
      case "c"  => -1
      case _    => askPreference(a, b)
    }

    return preference
  }
}
