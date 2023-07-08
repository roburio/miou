let print () = print_endline "Resource released"

let () =
  Miou.run @@ fun () ->
  let p =
    Miou.call_cc @@ fun () ->
    let _ = Miou.Ownership.own ~finally:print () in
    raise (Failure "p")
  in
  Miou.await_exn p
