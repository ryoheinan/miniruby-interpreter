open Syntax

let one: rbvalue = IntValue 1
let const_one: rbexpr = ConstExpr one

let two: rbvalue = IntValue 2
let const_two: rbexpr = ConstExpr two

let const_binop : rbexpr =
  BinopExpr (AddOp, const_one, const_two)

let assign_stmt: rbstmt =
  AssignStmt ("x", const_binop) (* x = 1 + 2 *)

let puts_stmt: rbstmt =
  PutsStmt (IdentExpr "x") (* puts x *)

(* Programs *)
let program: rbprog = [assign_stmt; puts_stmt]

let () =
  ignore program;
  print_endline "program constructed"
