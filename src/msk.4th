\ Minimum Shift Keying (MSK) Modulation
\ REQUIRES: bit-array.4th


create sine-table \ 1024 pts, 1023 max amp.
$200 , $203 , $206 , $209 , $20c , $20f , $212 , $215 , 
$219 , $21c , $21f , $222 , $225 , $228 , $22b , $22f , 
$232 , $235 , $238 , $23b , $23e , $241 , $244 , $247 , 
$24b , $24e , $251 , $254 , $257 , $25a , $25d , $260 , 
$263 , $266 , $269 , $26d , $270 , $273 , $276 , $279 , 
$27c , $27f , $282 , $285 , $288 , $28b , $28e , $291 , 
$294 , $297 , $29a , $29d , $2a0 , $2a3 , $2a6 , $2a9 , 
$2ac , $2af , $2b2 , $2b5 , $2b8 , $2bb , $2bd , $2c0 , 
$2c3 , $2c6 , $2c9 , $2cc , $2cf , $2d2 , $2d5 , $2d7 , 
$2da , $2dd , $2e0 , $2e3 , $2e5 , $2e8 , $2eb , $2ee , 
$2f1 , $2f3 , $2f6 , $2f9 , $2fc , $2fe , $301 , $304 , 
$306 , $309 , $30c , $30e , $311 , $314 , $316 , $319 , 
$31c , $31e , $321 , $323 , $326 , $329 , $32b , $32e , 
$330 , $333 , $335 , $338 , $33a , $33d , $33f , $342 , 
$344 , $346 , $349 , $34b , $34e , $350 , $352 , $355 , 
$357 , $359 , $35c , $35e , $360 , $362 , $365 , $367 , 
$369 , $36b , $36e , $370 , $372 , $374 , $376 , $378 , 
$37a , $37d , $37f , $381 , $383 , $385 , $387 , $389 , 
$38b , $38d , $38f , $391 , $393 , $395 , $397 , $398 , 
$39a , $39c , $39e , $3a0 , $3a2 , $3a3 , $3a5 , $3a7 , 
$3a9 , $3ab , $3ac , $3ae , $3b0 , $3b1 , $3b3 , $3b5 , 
$3b6 , $3b8 , $3b9 , $3bb , $3bd , $3be , $3c0 , $3c1 , 
$3c3 , $3c4 , $3c6 , $3c7 , $3c8 , $3ca , $3cb , $3cd , 
$3ce , $3cf , $3d1 , $3d2 , $3d3 , $3d4 , $3d6 , $3d7 , 
$3d8 , $3d9 , $3da , $3dc , $3dd , $3de , $3df , $3e0 , 
$3e1 , $3e2 , $3e3 , $3e4 , $3e5 , $3e6 , $3e7 , $3e8 , 
$3e9 , $3ea , $3eb , $3ec , $3ec , $3ed , $3ee , $3ef , 
$3f0 , $3f0 , $3f1 , $3f2 , $3f3 , $3f3 , $3f4 , $3f5 , 
$3f5 , $3f6 , $3f6 , $3f7 , $3f7 , $3f8 , $3f9 , $3f9 , 
$3f9 , $3fa , $3fa , $3fb , $3fb , $3fc , $3fc , $3fc , 
$3fd , $3fd , $3fd , $3fd , $3fe , $3fe , $3fe , $3fe , 
$3fe , $3ff , $3ff , $3ff , $3ff , $3ff , $3ff , $3ff , 
$3ff , $3ff , $3ff , $3ff , $3ff , $3ff , $3ff , $3ff , 
$3fe , $3fe , $3fe , $3fe , $3fe , $3fd , $3fd , $3fd , 
$3fd , $3fc , $3fc , $3fc , $3fb , $3fb , $3fa , $3fa , 
$3f9 , $3f9 , $3f9 , $3f8 , $3f7 , $3f7 , $3f6 , $3f6 , 
$3f5 , $3f5 , $3f4 , $3f3 , $3f3 , $3f2 , $3f1 , $3f0 , 
$3f0 , $3ef , $3ee , $3ed , $3ec , $3ec , $3eb , $3ea , 
$3e9 , $3e8 , $3e7 , $3e6 , $3e5 , $3e4 , $3e3 , $3e2 , 
$3e1 , $3e0 , $3df , $3de , $3dd , $3dc , $3da , $3d9 , 
$3d8 , $3d7 , $3d6 , $3d4 , $3d3 , $3d2 , $3d1 , $3cf , 
$3ce , $3cd , $3cb , $3ca , $3c8 , $3c7 , $3c6 , $3c4 , 
$3c3 , $3c1 , $3c0 , $3be , $3bd , $3bb , $3b9 , $3b8 , 
$3b6 , $3b5 , $3b3 , $3b1 , $3b0 , $3ae , $3ac , $3ab , 
$3a9 , $3a7 , $3a5 , $3a3 , $3a2 , $3a0 , $39e , $39c , 
$39a , $398 , $397 , $395 , $393 , $391 , $38f , $38d , 
$38b , $389 , $387 , $385 , $383 , $381 , $37f , $37d , 
$37a , $378 , $376 , $374 , $372 , $370 , $36e , $36b , 
$369 , $367 , $365 , $362 , $360 , $35e , $35c , $359 , 
$357 , $355 , $352 , $350 , $34e , $34b , $349 , $346 , 
$344 , $342 , $33f , $33d , $33a , $338 , $335 , $333 , 
$330 , $32e , $32b , $329 , $326 , $323 , $321 , $31e , 
$31c , $319 , $316 , $314 , $311 , $30e , $30c , $309 , 
$306 , $304 , $301 , $2fe , $2fc , $2f9 , $2f6 , $2f3 , 
$2f1 , $2ee , $2eb , $2e8 , $2e5 , $2e3 , $2e0 , $2dd , 
$2da , $2d7 , $2d5 , $2d2 , $2cf , $2cc , $2c9 , $2c6 , 
$2c3 , $2c0 , $2bd , $2bb , $2b8 , $2b5 , $2b2 , $2af , 
$2ac , $2a9 , $2a6 , $2a3 , $2a0 , $29d , $29a , $297 , 
$294 , $291 , $28e , $28b , $288 , $285 , $282 , $27f , 
$27c , $279 , $276 , $273 , $270 , $26d , $269 , $266 , 
$263 , $260 , $25d , $25a , $257 , $254 , $251 , $24e , 
$24b , $247 , $244 , $241 , $23e , $23b , $238 , $235 , 
$232 , $22f , $22b , $228 , $225 , $222 , $21f , $21c , 
$219 , $215 , $212 , $20f , $20c , $209 , $206 , $203 , 
$200 , $1fc , $1f9 , $1f6 , $1f3 , $1f0 , $1ed , $1ea , 
$1e6 , $1e3 , $1e0 , $1dd , $1da , $1d7 , $1d4 , $1d0 , 
$1cd , $1ca , $1c7 , $1c4 , $1c1 , $1be , $1bb , $1b8 , 
$1b4 , $1b1 , $1ae , $1ab , $1a8 , $1a5 , $1a2 , $19f , 
$19c , $199 , $196 , $192 , $18f , $18c , $189 , $186 , 
$183 , $180 , $17d , $17a , $177 , $174 , $171 , $16e , 
$16b , $168 , $165 , $162 , $15f , $15c , $159 , $156 , 
$153 , $150 , $14d , $14a , $147 , $144 , $142 , $13f , 
$13c , $139 , $136 , $133 , $130 , $12d , $12a , $128 , 
$125 , $122 , $11f , $11c , $11a , $117 , $114 , $111 , 
$10e , $10c , $109 , $106 , $103 , $101 , $fe , $fb , 
$f9 , $f6 , $f3 , $f1 , $ee , $eb , $e9 , $e6 , 
$e3 , $e1 , $de , $dc , $d9 , $d6 , $d4 , $d1 , 
$cf , $cc , $ca , $c7 , $c5 , $c2 , $c0 , $bd , 
$bb , $b9 , $b6 , $b4 , $b1 , $af , $ad , $aa , 
$a8 , $a6 , $a3 , $a1 , $9f , $9d , $9a , $98 , 
$96 , $94 , $91 , $8f , $8d , $8b , $89 , $87 , 
$85 , $82 , $80 , $7e , $7c , $7a , $78 , $76 , 
$74 , $72 , $70 , $6e , $6c , $6a , $68 , $67 , 
$65 , $63 , $61 , $5f , $5d , $5c , $5a , $58 , 
$56 , $54 , $53 , $51 , $4f , $4e , $4c , $4a , 
$49 , $47 , $46 , $44 , $42 , $41 , $3f , $3e , 
$3c , $3b , $39 , $38 , $37 , $35 , $34 , $32 , 
$31 , $30 , $2e , $2d , $2c , $2b , $29 , $28 , 
$27 , $26 , $25 , $23 , $22 , $21 , $20 , $1f , 
$1e , $1d , $1c , $1b , $1a , $19 , $18 , $17 , 
$16 , $15 , $14 , $13 , $13 , $12 , $11 , $10 , 
$f , $f , $e , $d , $c , $c , $b , $a , 
$a , $9 , $9 , $8 , $8 , $7 , $6 , $6 , 
$6 , $5 , $5 , $4 , $4 , $3 , $3 , $3 , 
$2 , $2 , $2 , $2 , $1 , $1 , $1 , $1 , 
$1 , $0 , $0 , $0 , $0 , $0 , $0 , $0 , 
$0 , $0 , $0 , $0 , $0 , $0 , $0 , $0 , 
$1 , $1 , $1 , $1 , $1 , $2 , $2 , $2 , 
$2 , $3 , $3 , $3 , $4 , $4 , $5 , $5 , 
$6 , $6 , $6 , $7 , $8 , $8 , $9 , $9 , 
$a , $a , $b , $c , $c , $d , $e , $f , 
$f , $10 , $11 , $12 , $13 , $13 , $14 , $15 , 
$16 , $17 , $18 , $19 , $1a , $1b , $1c , $1d , 
$1e , $1f , $20 , $21 , $22 , $23 , $25 , $26 , 
$27 , $28 , $29 , $2b , $2c , $2d , $2e , $30 , 
$31 , $32 , $34 , $35 , $37 , $38 , $39 , $3b , 
$3c , $3e , $3f , $41 , $42 , $44 , $46 , $47 , 
$49 , $4a , $4c , $4e , $4f , $51 , $53 , $54 , 
$56 , $58 , $5a , $5c , $5d , $5f , $61 , $63 , 
$65 , $67 , $68 , $6a , $6c , $6e , $70 , $72 , 
$74 , $76 , $78 , $7a , $7c , $7e , $80 , $82 , 
$85 , $87 , $89 , $8b , $8d , $8f , $91 , $94 , 
$96 , $98 , $9a , $9d , $9f , $a1 , $a3 , $a6 , 
$a8 , $aa , $ad , $af , $b1 , $b4 , $b6 , $b9 , 
$bb , $bd , $c0 , $c2 , $c5 , $c7 , $ca , $cc , 
$cf , $d1 , $d4 , $d6 , $d9 , $dc , $de , $e1 , 
$e3 , $e6 , $e9 , $eb , $ee , $f1 , $f3 , $f6 , 
$f9 , $fb , $fe , $101 , $103 , $106 , $109 , $10c , 
$10e , $111 , $114 , $117 , $11a , $11c , $11f , $122 , 
$125 , $128 , $12a , $12d , $130 , $133 , $136 , $139 , 
$13c , $13f , $142 , $144 , $147 , $14a , $14d , $150 , 
$153 , $156 , $159 , $15c , $15f , $162 , $165 , $168 , 
$16b , $16e , $171 , $174 , $177 , $17a , $17d , $180 , 
$183 , $186 , $189 , $18c , $18f , $192 , $196 , $199 , 
$19c , $19f , $1a2 , $1a5 , $1a8 , $1ab , $1ae , $1b1 , 
$1b4 , $1b8 , $1bb , $1be , $1c1 , $1c4 , $1c7 , $1ca , 
$1cd , $1d0 , $1d4 , $1d7 , $1da , $1dd , $1e0 , $1e3 , 
$1e6 , $1ea , $1ed , $1f0 , $1f3 , $1f6 , $1f9 , $1fc , 


$400 constant pts/cycle \ number of points per cycle
$100 constant #steps


: bounds ( addr len -- addr+len addr )
  over + swap
 ;

: #bits ( c -- c ) \ returns the size in number of bits.
  $3 lshift
 ;
 
: bit<byte ( byte n -- 0|1 )
  1 over lshift ( byte 2^n -- )
  rot and swap rshift
 ;

: phase-offset ( phase ai -- phase )
  0= if $200 + then \ FIXME
  \ swap tuck = if $300 else $500 then \ if ai=aq add 270deg, else add 450deg
 ;

: cos@<angle ( angle -- sine-value )
    $100 + pts/cycle mod cells sine-table + @
 ;


: spin ( start-offset T dist -- )
  ( -- start-offset #steps dist #steps )
  ( -- start-offset #steps step-sz )
  ?do i cos@<angle dac dup us loop drop \ 270deg in 256 steps
 ;

: fast ( start-offset -- )
  3 $500 rot over + swap spin \ 450deg in 10 steps
 ;

: slow ( start-offset -- )
  5 $300 rot over + swap spin \ 270deg in 10 steps
 ;


: /bit ( start ai aq -- phase )
  over -rot
  =
  if
    over slow
  else
    over fast
  then
  phase-offset
 ;

: stop-loop
   key?
   if   key $1B =  \ ESC
   else 0
   then
 ;

: bit< ( addr bit# -- 0|1 )
  $8 /mod rot + c@ ( addr n char  -- )
  swap ( -- addr char n )
  bit<byte
 ;

: bit+< ( addr bit# pos-win -- addr bit ) \ Grab the next nth bit from the current index.
  + bit<
 ;


: 2bit< ( addr i -- bit1 bit2 )
    over swap tuck
    0 bit+< -rot
    1 bit+< swap
 ;

: even? ( n -- 0=false|-1=true )
  2 mod 0=
 ;

: message s" Hello, World!" 2dup $F0 fill ;
\ : >msk2 #bits 0 ?do dup i bit< . dup i 1+ bit< . dup i 2 + bit< . cr loop ;
: >msk  \ sliding window
  0 \ phase
  message
  #bits 1- \ because we're grabbing 2 at a time.
  0 ?do
    dup i 2bit< 2swap swap 2swap
    i even? if swap then
    swap /bit swap
    \ i 1 + $8 /mod rot + c@ swap bit< .
  loop 2drop
  0 dac
 ;

: msk-test
  begin
  >msk
  stop-loop
  until
 ;

