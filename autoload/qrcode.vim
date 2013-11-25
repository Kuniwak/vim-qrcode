" Author:  OrgaChem <orga.chem.job@gmail.com>
" License: MIT License


let s:save_cpo = &cpo
set cpo&vim

function! qrcode#generate() range
	let l:selected = s:get_selected()
	let l:qrcode = s:get_qrcode(l:selected)

	if strlen(l:qrcode) > 0
		call s:prepare_buffer()
		call append(0, split(l:qrcode, '\n', 1))
		set filetype=qrcode

		call s:finish_buffer()
	endif
endfunction


function! s:get_qrcode(text)
	if !has('ruby')
		throw "vim-qrcode requires to enable a ruby interface."
		return ''
	endif

	ruby << EOF
	require 'rubygems'
	require 'rqrcode'

	qr = RQRCode::QRCode.new(VIM.evaluate('a:text'), :size => 8, :level => :l )
	lines = qr.to_s.gsub(/x/, '11').gsub(/ /, '00').each_line.to_a.map do |line|
		'  ' + line.chomp() + '  '
	end

	margin_line = ' ' * lines[0].size
	lines.unshift(margin_line)
	lines.push(margin_line)
	VIM.command('let l:qrcode = "' + lines.join('\n') +'"')
EOF

	return l:qrcode
endfunction


function! s:get_selected()
	let l:tmp = @@
	silent normal gvy
	let l:selected = @@
	let @@ = l:tmp
	return l:selected
endfunction


function! s:prepare_buffer()
	let needs_new_buffer =
				\ &modified
				\ || line('$') != 1
				\ || getline(1) != ''
	if needs_new_buffer
		new
	endif
endfunction


function! s:finish_buffer()
	set nomodified
	setlocal nocursorline
	normal! gg
endfunction

let &cpo = s:save_cpo
