(* Copyright (C) 2015-2016 Bloomberg Finance L.P.
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * In addition to the permissions granted to you by the LGPL, you may combine
 * or link a "work that uses the Library" with a publicly distributed version
 * of this file to produce a combined library or application, then distribute
 * that combined work under the terms of your choosing, with no requirement
 * to comply with the obligations normally placed on you by section 4 of the
 * LGPL version 3 (or the corresponding section of a later version of the LGPL
 * should you choose to use a later version).
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA. *)


type external_module_name = 
  { bundle : string ; 
    bind_name : string option
  }

type pipe = bool 
type js_call = { 
  name : string;
  external_module_name : external_module_name option;
  splice : bool 
}

type js_send = { 
  name : string ;
  splice : bool ; 
  pipe : pipe   
} (* we know it is a js send, but what will happen if you pass an ocaml objct *)

type js_global_val = {
  name : string ; 
  external_module_name : external_module_name option
}

type js_new_val = {
  name : string ; 
  external_module_name : external_module_name option;
  splice : bool ;
}

type js_module_as_fn = 
  { external_module_name : external_module_name;
    splice : bool 
  }

type arg_type = Ast_core_type.arg_type
type arg_label = 
  | Label of string 
  | Label_int_lit of string * int 
  | Label_string_lit of string * string 
  | Optional of string 
  | Empty (* it will be ignored , side effect will be recorded *)
  | Empty_int_lit of int 
  | Empty_string_lit of string 

type arg_kind = 
  {
    arg_type : arg_type;
    arg_label : arg_label
  }

type obj_create = arg_kind list

type ffi = 
  (* | Obj_create of obj_create*)
  | Js_global of js_global_val 
  | Js_module_as_var of  external_module_name
  | Js_module_as_fn of js_module_as_fn
  | Js_module_as_class of external_module_name             
  | Js_call of js_call 
  | Js_send of js_send
  | Js_new of js_new_val
  | Js_set of string
  | Js_get of string
  | Js_get_index
  | Js_set_index

type t  = 
  | Ffi_bs of arg_kind list  * bool * ffi
  | Ffi_obj_create of obj_create
  | Ffi_normal 
  (* When it's normal, it is handled as normal c functional ffi call *)


val name_of_ffi : ffi -> string

val check_ffi : ?loc:Location.t ->  ffi -> unit 

val to_string : t -> string 

(** Note *)
val from_string : string -> t 

