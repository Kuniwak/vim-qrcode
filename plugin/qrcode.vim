" Author:  OrgaChem <orga.chem.job@gmail.com>
" License: MIT License


let s:save_cpo = &cpo
set cpo&vim

command! -range -nargs=? QRCode call qrcode#generate(<f-args>)

let g:loaded_qrcode = 1

let &cpo = s:save_cpo
