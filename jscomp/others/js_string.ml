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

type t = string

external make : 'a -> t = "String" [@@bs.new]
external fromCharCode : int -> t = "String.fromCharCode" [@@bs.val]
external fromCharCodeMany : int array -> t = "String.fromCharCode" [@@bs.val] [@@bs.splice]
external fromCodePoint : int -> t = "String.fromCodePoint" [@@bs.val] (** ES2015 *)
external fromCodePointMany : int array -> t = "String.fromCodePoint" [@@bs.val] [@@bs.splice] (** ES2015 *)
(* String.raw: ES2015, meant to be used with template strings, not directly *)

external length : t -> int = "" [@@bs.get]
external get : t -> int -> t = "" [@@bs.get_index]

external charAt : int ->  t = "" [@@bs.send.pipe: t]
external charCodeAt : int -> float  = "" [@@bs.send.pipe: t]
(** type it as [float] due to that it may return NAN  *)
external codePointAt : int -> int Js.undefined = "" [@@bs.send.pipe: t] (** ES2015 *)

external concat : t -> t = "" [@@bs.send.pipe: t]
external concatMany : t array -> t = "concat" [@@bs.send.pipe: t] [@@bs.splice]

external endsWith : t -> Js.boolean = "" [@@bs.send.pipe: t] (** ES2015 *)
external endsWithFrom : t -> int -> Js.boolean = "endsWith" [@@bs.send.pipe: t] (** ES2015 *)

external includes : t -> Js.boolean = "" [@@bs.send.pipe: t] (** ES2015 *)
external includesFrom : t -> int -> Js.boolean = "includes" [@@bs.send.pipe: t] (** ES2015 *)

external indexOf : t -> int = "" [@@bs.send.pipe: t]
external indexOfFrom : t -> int -> int = "indexOf" [@@bs.send.pipe: t]

external lastIndexOf : t -> int = "" [@@bs.send.pipe: t]
external lastIndexOfFrom : t -> int -> int = "lastIndexOf" [@@bs.send.pipe: t]

external localeCompare : t -> float = "" [@@bs.send.pipe: t]
(* extended by ECMA-402 *)

external match_ : Js_re.t -> t array Js.null = "match" [@@bs.send.pipe: t]

external normalize : t = "" [@@bs.send.pipe: t] (** ES2015 *)
external normalizeByForm : t -> t = "normalize" [@@bs.send.pipe: t] (** ES2015 *)

external repeat : int -> t = "" [@@bs.send.pipe: t] (** ES2015 *)

external replace : t ->  t ->  t = "" [@@bs.send.pipe: t]
external replaceByRe : Js_re.t ->  t ->  t = "replace" [@@bs.send.pipe: t]

external search : Js_re.t -> int = "" [@@bs.send.pipe: t]

external slice : from:int -> to_:int ->  t = "" [@@bs.send.pipe: t]
external sliceToEnd : from:int ->  t = "slice" [@@bs.send.pipe: t]

external split : t -> t array  = "" [@@bs.send.pipe: t]
external splitAtMost: t -> limit:int -> t array = "split" [@@bs.send.pipe: t]
external splitLimited : t -> int -> t array = "split" [@@bs.send.pipe: t]
[@@ocaml.deprecated "Please use splitAtMost"]
external splitByRe : Js_re.t ->  t array = "split" [@@bs.send.pipe: t]
external splitByReAtMost : Js_re.t -> limit:int ->  t array = "split" [@@bs.send.pipe: t]
external splitRegexpLimited : Js_re.t -> int ->  t array = "" [@@bs.send.pipe: t]
[@@ocaml.deprecated "Please use splitByReAtMost"]

external startsWith : t -> Js.boolean = "" [@@bs.send.pipe: t] (** ES2015 *)
external startsWithFrom : t -> int -> Js.boolean = "startsWith" [@@bs.send.pipe: t] (** ES2015 *)

external substr : from:int -> t = "" [@@bs.send.pipe: t]
external substrAtMost : from:int -> length:int -> t = "substr" [@@bs.send.pipe: t]

external substring : from:int -> to_:int ->  t = "" [@@bs.send.pipe: t]
external substringToEnd : from:int ->  t = "substring" [@@bs.send.pipe: t]

external toLowerCase : t = "" [@@bs.send.pipe: t]
external toLocaleLowerCase : t = "" [@@bs.send.pipe: t]
external toUpperCase : t = "" [@@bs.send.pipe: t]
external toLocaleUpperCase : t = "" [@@bs.send.pipe: t]

external trim : t = "" [@@bs.send.pipe: t]

(* HTML wrappers *)
external anchor : t -> t = "" [@@bs.send.pipe: t] (** ES2015 *)
external link : t -> t = "" [@@bs.send.pipe: t] (** ES2015 *)
