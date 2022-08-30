if exists("b:current_syntax")
  finish
endif

syn keyword cKeyword auto double int struct break else long switch case
                   \ enum register typedef char extern return union continue
                   \ for signed void do if static while default goto sizeof
                   \ volatile const float short unsigned typeof size_t ssize_t
                   \ off_t wchar_t ptrdiff_t sig_atomic_t fpos_t clock_t time_t
                   \ va_list jmp_buf FILE DIR div_t ldiv_t mbstate_t wctrans_t
                   \ wint_t wctype_t bool complex imaginary int8_t int16_t
                   \ int32_t int64_t uint8_t uint16_t uint32_t uint64_t inline
                   \ restrict alignas alignof noreturn char16_t char32_t
                   \ max_align_t atomic_bool atomic_char atomic_schar
                   \ atomic_uchar atomic_short atomic_ushort atomic_int
                   \ atomic_uint atomic_long atomic_ulong atomic_llong
                   \ atomic_ullong atomic_char16_t atomic_char32_t
                   \ atomic_wchar_t atomic_int_least8_t atomic_uint_least8_t
                   \ atomic_int_least16_t atomic_uint_least16_t
                   \ atomic_int_least32_t atomic_uint_least32_t
                   \ atomic_int_least64_t atomic_uint_least64_t
                   \ atomic_int_fast8_t atomic_uint_fast8_t atomic_int_fast16_t
                   \ atomic_uint_fast16_t atomic_int_fast32_t
                   \ atomic_uint_fast32_t atomic_int_fast64_t
                   \ atomic_uint_fast64_t atomic_intptr_t atomic_uintptr_t
                   \ atomic_size_t atomic_ptrdiff_t atomic_intmax_t
                   \ atomic_uintmax_t

syn region cComment start="/\*" end="\*/"
syn region cComment start="//" skip="\\$" end="$" keepend

syn region cString start=+"+ skip=+\\"+ end=+"+
syn region cString start=+'+ skip=+\\'+ end=+'+

syn match cSpecial "\\\(x\x\+\|\o\{1,3}\|.\|$\)"
                 \ display contained containedin=cString

syn match cIncludeString "<[^>]*>" display contained
syn region cIncludeString start=+"+ skip=+\\"+ end=+"+ display contained
syn match cInclude "#include\s*[<"]" display contains=cIncludeString

syn match cPreProc /#\(define\|undef\|ifdef\|ifndef\|if\|else\|elif\|endif\|
                      \error\|pragma\)/ display

hi def link cKeyword       Statement
hi def link cComment       Comment
hi def link cSpecial       Special
hi def link cString        String
hi def link cIncludeString Identifier
hi def link cInclude       String
hi def link cPreProc       String

syn sync minlines=200
let b:current_syntax = "c"
