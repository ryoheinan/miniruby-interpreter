open Syntax

let rec evaluate_expr (expr : rbexpr) (value: rbvalue) : rbvalue =
  match expr with
  | ConstExpr v -> v
  | BinopExpr (op, e1, e2) -> 
      let v1 = evaluate_expr e1 value in
      let v2 = evaluate_expr e2 value in
      (match op, v1, v2 with
      | AddOp, IntValue n1, IntValue n2 -> IntValue (n1 + n2)
      | _ -> failwith "not implemented")
  | IdentExpr name ->
      match name with
      | "x" -> value
      | _ -> failwith "unknown identifier"

let x : rbvalue ref = ref NilValue

let evaluate_stmt stmt =
  match stmt with
    PutsStmt(expr) ->
    let v = evaluate_expr expr (!x) in
      print_endline (string_of_rbvalue v)
  | AssignStmt(identExpr, expr) ->
    let v = evaluate_expr expr (!x) in
      x := v
  | _ -> failwith "not implemented"

let () =
  (* x = 1 + 2 *)
  evaluate_stmt (AssignStmt ("x", BinopExpr (AddOp, ConstExpr (IntValue 1), ConstExpr (IntValue 2))));
  (* puts x *)
  evaluate_stmt (PutsStmt (IdentExpr "x"))

