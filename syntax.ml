(* variable names; ruby identifiers *)
type rbident = string

(* values *)
type rbvalue =
    BoolValue of bool
  | IntValue of int
  | StrValue of string
  | NilValue

(* binary operators *)
and rbbinop =
    AddOp
  | SubOp
  | MulOp
  | EqOp
  | NeqOp

(* expressions *)
and rbexpr =
    ConstExpr of rbvalue
  | IdentExpr of rbident
  | BinopExpr of rbbinop * rbexpr * rbexpr

(* statements / 文 *)
and rbstmt =
    AssignStmt of rbident * rbexpr
  | IfStmt of rbexpr * rbstmt list * rbstmt list
  | WhileStmt of rbexpr * rbstmt list
  | PutsStmt of rbexpr

(* programs / 文の集合がプログラム *)
type rbprog = rbstmt list

(* utility functions: To check truthiness *)
let truthy v =
  match v with
    BoolValue(false) -> false
  | NilValue -> false
  | _ -> true

(* utility functions: To convert values to strings *)
let string_of_rbvalue v =
  match v with
    BoolValue(b) -> string_of_bool b
  | IntValue(i) -> string_of_int i
  | StrValue(s) -> s
  | NilValue -> "nil"
