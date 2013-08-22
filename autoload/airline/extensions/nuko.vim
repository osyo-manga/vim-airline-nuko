scriptencoding utf-8
let s:save_cpo = &cpo
set cpo&vim


let s:nuko_count = 0
let s:last_time = 0

function! airline#extensions#nuko#update()
	let time = str2float(reltimestr(reltime()))
	let nuko =[
	\      '     (≡ΦωΦ)                ',
	\      '    -(≡ΦωΦ)                ',
	\      '    -=(≡ΦωΦ)               ',
	\      '     -=(≡ーωー)              ',
	\      '    -=≡(≡▼ω▼) ﾇｺｫ…       ',
	\      '     --=≡(≡▼ω▼) ﾇｺｫ…     ',
	\      '       --=≡(≡▼ω▼) ﾇｺｫ…   ',
	\      '          -=≡(≡▼ω▼) ﾇｺｫ… ',
	\      '             -=(≡ーωー)      ',
	\      '             -=(≡ΦωΦ)      ',
	\      '              -(≡ΦωΦ)      ',
	\      '               (≡ΦωΦ)      ',
	\]
	if (time - s:last_time) > 0.45
		let s:nuko_count += 1
		let s:last_time = time
	endif
	return nuko[ s:nuko_count % len(nuko) ]
endfunction


function! airline#extensions#nuko#init(...)
	let g:airline_section_c = g:airline_section_c .  ' %{airline#extensions#nuko#update()}'
endfunction


augroup airline-nuko
	autocmd!
	autocmd CursorHold  * call feedkeys("g\<ESC>", 'n')
	autocmd CursorHoldI  * call feedkeys("\<C-g>\<ESC>", 'n')
augroup END


let &cpo = s:save_cpo
unlet s:save_cpo
