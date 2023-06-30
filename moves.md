# Sapir Mod

    z l h g q j f o u
    s r n t m y c a e i
    v x b d k w p 

Sapir has `hjkl` torn apart. `w` is in an awkward place.

    . l h . . j . . .
    _ _ _ _ . . _ _ e _
    . . b . k w . 

Optimised `{}` and `()` can make it better than the original.

    . { } . . . . . .
    _ ( ) _ . . _ _ _ _
    . . . . . . . 

## Remapping

         last word <-  l  h -> next word
              left <- ^l ^h -> right
         last line <-  {  } -> next line
    last paragraph <-  (  ) -> next paragraph

# Vim Mapping 

## Motions

                    left <-  h  l -> right
                      up <-  k  j -> down
   
               last word <-  b  w -> next word 
        end of last word <- ge  e -> end of next word

           start of line <-  ^  $ -> end of line

           find backward <-  F  f -> find forward in line
          touch backward <-  T  t -> touch forward in line

          last paragraph <-  {  } -> next paragraph

          move up a line <- ^y ^e -> move down a line
          move up a half <- ^u ^d -> move down a half
        move up a screen <- ^b ^f -> move down a screen

         search backward <-  ?  / -> search forward
              last match <-  N  n -> next match
             older place <- ^o ^i -> newer place

    screen before cursor <- zb  zt -> screen after cursor
                                zz -> screen center of cursor

                                ^g -> show current position
                           #gg, #G -> to line #

                                 % -> to the pairing bracket

## Other

                  :s/<old>/<new>/   -> substitute a match in current line
               :#,#s/<old>/<new>/g  -> substitute all matches in lines # to #
                 :%s/<old>/<new>/gc -> substitute all matches in all lines with confirmation
    <visual> :'<,'>s/<old>/<new>/   -> substitue a match in the selected lines

    :!<command> -> execute the shell command
     : ^d <tab> -> autocomplete a command
          :help -> get help
             ^w -> split screen options
             :q -> close current window

# Mac Control

             left <- ^b ^f -> right
    start of line <- ^a ^e -> end of line
     clear before <- ^u ^k -> clear after
  delete backward <- ^h ^d -> delete forward
    delete a word <- ^w
