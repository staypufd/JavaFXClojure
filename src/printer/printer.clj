; printer.clj
; Author Sam Griffith Jr.  6-26-2009
(ns printer)

(defn print-string [arg]
  "Prints the arg to the console, then returns the arg"
  (println arg)
  arg)