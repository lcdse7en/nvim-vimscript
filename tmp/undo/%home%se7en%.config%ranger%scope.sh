Vim�UnDo� Sa�5���$y(�e|�Ԋ�]�.�$<	���  �   0            xlsx2csv -- "${FILE_PATH}" && exit 5   c                         b��5    _�                     *        ����                                                                                                                                                                                                                                                                                                                            *   "       0   A       V   A    `XxX     �   /   1          AOPENSCAD_COLORSCHEME=${RNGR_OPENSCAD_COLORSCHEME:-Tomorrow Night}�   .   0          4OPENSCAD_IMGSIZE=${RNGR_OPENSCAD_IMGSIZE:-1000,1000}�   -   /          ,PYGMENTIZE_STYLE=${PYGMENTIZE_STYLE:-autumn}�   ,   .          jHIGHLIGHT_OPTIONS="--replace-tabs=${HIGHLIGHT_TABWIDTH} --style=${HIGHLIGHT_STYLE} ${HIGHLIGHT_OPTIONS:-}"�   +   -          )HIGHLIGHT_STYLE=${HIGHLIGHT_STYLE:-pablo}�   *   ,          +HIGHLIGHT_TABWIDTH=${HIGHLIGHT_TABWIDTH:-8}�   )   +          #HIGHLIGHT_SIZE_MAX=262143  # 256KiB5�_�                    0        ����                                                                                                                                                                                                                                                                                                                            *   "       0   A       V   A    `Xx\     �   0   2  e    5�_�                    1        ����                                                                                                                                                                                                                                                                                                                            2           3          v       `Xxg    �   0   5  f       �   1   2  f    5�_�                    �        ����                                                                                                                                                                                                                                                                                                                            �                   V       `Xy    �   �   �       <   9        ## Preview archives using the first image inside.   @        ## (Very useful for comic book collections for example.)   I        # application/zip|application/x-rar|application/x-7z-compressed|\   X        #     application/x-xz|application/x-bzip2|application/x-gzip|application/x-tar)   &        #     local fn=""; local fe=""   D        #     local zip=""; local rar=""; local tar=""; local bsd=""   #        #     case "${mimetype}" in   +        #         application/zip) zip=1 ;;   -        #         application/x-rar) rar=1 ;;   1        #         application/x-7z-compressed) ;;           #         *) tar=1 ;;           #     esac   L        #     { [ "$tar" ] && fn=$(tar --list --file "${FILE_PATH}"); } || \   T        #     { fn=$(bsdtar --list --file "${FILE_PATH}") && bsd=1 && tar=""; } || \   J        #     { [ "$rar" ] && fn=$(unrar lb -p- -- "${FILE_PATH}"); } || \   M        #     { [ "$zip" ] && fn=$(zipinfo -1 -- "${FILE_PATH}"); } || return   	        #   O        #     fn=$(echo "$fn" | python -c "import sys; import mimetypes as m; \   @        #             [ print(l, end='') for l in sys.stdin if \   R        #               (m.guess_type(l[:-1])[0] or '').startswith('image/') ]" |\   &        #         sort -V | head -n 1)   &        #     [ "$fn" = "" ] && return   3        #     [ "$bsd" ] && fn=$(printf '%b' "$fn")   	        #   7        #     [ "$tar" ] && tar --extract --to-stdout \   R        #         --file "${FILE_PATH}" -- "$fn" > "${IMAGE_CACHE_PATH}" && exit 6   :        #     fe=$(echo -n "$fn" | sed 's/[][*?\]/\\\0/g')   :        #     [ "$bsd" ] && bsdtar --extract --to-stdout \   R        #         --file "${FILE_PATH}" -- "$fe" > "${IMAGE_CACHE_PATH}" && exit 6   E        #     [ "$bsd" ] || [ "$tar" ] && rm -- "${IMAGE_CACHE_PATH}"   I        #     [ "$rar" ] && unrar p -p- -inul -- "${FILE_PATH}" "$fn" > \   1        #         "${IMAGE_CACHE_PATH}" && exit 6   D        #     [ "$zip" ] && unzip -pP "" -- "${FILE_PATH}" "$fe" > \   1        #         "${IMAGE_CACHE_PATH}" && exit 6   E        #     [ "$rar" ] || [ "$zip" ] && rm -- "${IMAGE_CACHE_PATH}"           #     ;;       esac           # openscad_image() {   *    #     TMPPNG="$(mktemp -t XXXXXX.png)"   <    #     openscad --colorscheme="${OPENSCAD_COLORSCHEME}" \   3    #         --imgsize="${OPENSCAD_IMGSIZE/x/,}" \   #    #         -o "${TMPPNG}" "${1}"   .    #     mv "${TMPPNG}" "${IMAGE_CACHE_PATH}"       # }       '    # case "${FILE_EXTENSION_LOWER}" in       #     ## 3D models   M    #     ## OpenSCAD only supports png image output, and ${IMAGE_CACHE_PATH}   E    #     ## is hardcoded as jpeg. So we make a tempfile.png and just   J    #     ## move/rename it to jpg. This works because image libraries are   '    #     ## smart enough to handle it.       #     csg|scad)   5    #         openscad_image "${FILE_PATH}" && exit 6       #         ;;       #     3mf|amf|dxf|off|stl)   J    #         openscad_image <(echo "import(\"${FILE_PATH}\");") && exit 6       #         ;;   
    # esac   }5�_�                    �        ����                                                                                                                                                                                                                                                                                                                            �          �          V       `Xy"     �   �   �  -       �   �   �  -    5�_�                    �        ����                                                                                                                                                                                                                                                                                                                            �          �          V       `Xy'     �   �   �  P    5�_�                    �        ����                                                                                                                                                                                                                                                                                                                            �          �          V       `Xy*     �   �   �  Q    5�_�      	              �        ����                                                                                                                                                                                                                                                                                                                            �          �          V       `Xy+    �   �   �                  �   �   �                  5�_�      
           	   �        ����                                                                                                                                                                                                                                                                                                                            �         K          V       `Xyx    �  J  L          exit 1�  I  K           �  H  J          handle_fallback�  G  I          handle_mime "${MIMETYPE}"�  F  H          handle_extension�  E  G          fi�  D  F              handle_image "${MIMETYPE}"�  C  E          .if [[ "${PV_IMAGE_ENABLED}" == 'True' ]]; then�  B  D          HMIMETYPE="$( file --dereference --brief --mime-type -- "${FILE_PATH}" )"�  A  C           �  @  B           �  ?  A          }�  >  @          
    exit 1�  =  ?          i    echo '----- File Type Classification -----' && file --dereference --brief -- "${FILE_PATH}" && exit 5�  <  >          handle_fallback() {�  ;  =           �  :  <          }�  9  ;              esac�  8  :                      exit 1;;�  7  9          -            exiftool "${FILE_PATH}" && exit 5�  6  8          .            mediainfo "${FILE_PATH}" && exit 5�  5  7                  video/* | audio/*)�  4  6                  ## Video and audio�  3  5           �  2  4                      exit 1;;�  1  3          -            exiftool "${FILE_PATH}" && exit 5�  0  2          S            # img2txt --gamma=0.6 --width="${PV_WIDTH}" -- "${FILE_PATH}" && exit 4�  /  1          )            ## Preview as text conversion�  .  0                  image/*)�  -  /                  ## Image�  ,  .           �  +  -                      exit 1;;�  *  ,          -            exiftool "${FILE_PATH}" && exit 5�  )  +          C            djvutxt "${FILE_PATH}" | fmt -w "${PV_WIDTH}" && exit 5�  (  *          >            ## Preview as text conversion (requires djvulibre)�  '  )                  image/vnd.djvu)�  &  (                  ## DjVu�  %  '           �  $  &                      exit 2;;�  #  %          +                -- "${FILE_PATH}" && exit 5�  "  $          P            pygmentize -f "${pygmentize_format}" -O "style=${PYGMENTIZE_STYLE}"\�  !  #          +                -- "${FILE_PATH}" && exit 5�     "          C            env COLORTERM=8bit bat --color=always --style="plain" \�    !          3                --force -- "${FILE_PATH}" && exit 5�               4                --out-format="${highlight_format}" \�              D            env HIGHLIGHT_OPTIONS="${HIGHLIGHT_OPTIONS}" highlight \�                          fi�              -                local highlight_format='ansi'�              2                local pygmentize_format='terminal'�                          else�              1                local highlight_format='xterm256'�              5                local pygmentize_format='terminal256'�              5            if [[ "$( tput colors )" -ge 256 ]]; then�                          fi�                              exit 2�              b            if [[ "$( stat --printf='%s' -- "${FILE_PATH}" )" -gt "${HIGHLIGHT_SIZE_MAX}" ]]; then�                          ## Syntax highlight�                      text/* | */xml)�                      ## Text�               �                          exit 1;;�              /            xls2csv -- "${FILE_PATH}" && exit 5�              @            ##   http://www.wagner.pp.ru/~vitus/software/catdoc/�              )            ## xls2csv comes with catdoc:�  
            (            ## Preview as csv conversion�  	                    *ms-excel)�    
                  ## XLS�    	           �                          exit 1;;�              =            pandoc -s -t markdown -- "${FILE_PATH}" && exit 5�              -            ## Preview as markdown conversion�              B        *wordprocessingml.document|*/epub+zip|*/x-fictionbook+xml)�              =        ## uncommented other methods to preview those formats�              K        ## You might want to remove "|epub" and/or "|fb2" below if you have�               +        ## DOCX, ePub, FB2 (using markdown)�   �             �   �                         exit 1;;�   �   �          .            catdoc -- "${FILE_PATH}" && exit 5�   �   �          F            ## catdoc: http://www.wagner.pp.ru/~vitus/software/catdoc/�   �   �          ?            ## note: catdoc does not always work for .doc files�   �   �          )            ## Preview as text conversion�   �   �                  text/rtf|*msword)�   �   �                  ## RTF and DOC�   �   �              case "${mimetype}" in�   �   �              local mimetype="${1}"�   �   �          handle_mime() {5�_�   	              
  M        ����                                                                                                                                                                                                                                                                                                                            �         K          V       `Xy�    �  L  }  R       �  M  N  R    5�_�   
                        ����                                                                                                                                                                                                                                                                                                                                    %          V   (    `��    �  $  &          #             exit 2;;�  #  %          -#                 -- "${FILE_PATH}" && exit 5�  "  $          R#             pygmentize -f "${pygmentize_format}" -O "style=${PYGMENTIZE_STYLE}"\�  !  #          -#                 -- "${FILE_PATH}" && exit 5�     "          E#             env COLORTERM=8bit bat --color=always --style="plain" \�    !          5#                 --force -- "${FILE_PATH}" && exit 5�               6#                 --out-format="${highlight_format}" \�              F#             env HIGHLIGHT_OPTIONS="${HIGHLIGHT_OPTIONS}" highlight \�              #             fi�              /#                 local highlight_format='ansi'�              4#                 local pygmentize_format='terminal'�              #             else�              3#                 local highlight_format='xterm256'�              7#                 local pygmentize_format='terminal256'�              7#             if [[ "$( tput colors )" -ge 256 ]]; then�              #             fi�              #                 exit 2�              d#             if [[ "$( stat --printf='%s' -- "${FILE_PATH}" )" -gt "${HIGHLIGHT_SIZE_MAX}" ]]; then�              !#             ## Syntax highlight�              #         text/* | */xml)�              #         ## Text5�_�                      4    ����                                                                                                                                                                                                                                                                                                                                                             `���     �      �      5                local pygmentize_format='terminal256'5�_�                      0    ����                                                                                                                                                                                                                                                                                                                                                             `���     �      �      1                local highlight_format='xterm256'5�_�                      1    ����                                                                                                                                                                                                                                                                                                                                                             `���    �      �      2                local pygmentize_format='terminal'5�_�                           ����                                                                                                                                                                                                                                                                                                                                     %           V        `���   	 �  $  &                      exit 2;;�  #  %          +                -- "${FILE_PATH}" && exit 5�  "  $          P            pygmentize -f "${pygmentize_format}" -O "style=${PYGMENTIZE_STYLE}"\�  !  #          +                -- "${FILE_PATH}" && exit 5�     "          C            env COLORTERM=8bit bat --color=always --style="plain" \�    !          3                --force -- "${FILE_PATH}" && exit 5�               4                --out-format="${highlight_format}" \�              D            env HIGHLIGHT_OPTIONS="${HIGHLIGHT_OPTIONS}" highlight \�                          fi�              -                local highlight_format='ansi'�              .                local pygmentize_format='ansi'�                          else�              -                local highlight_format='ansi'�              .                local pygmentize_format='ansi'�              5            if [[ "$( tput colors )" -ge 256 ]]; then�                          fi�                              exit 2�              b            if [[ "$( stat --printf='%s' -- "${FILE_PATH}" )" -gt "${HIGHLIGHT_SIZE_MAX}" ]]; then�                          ## Syntax highlight�                      text/* | */xml)5�_�                    b        ����                                                                                                                                                                                                                                                                                                                                                             b��0     �   b   d  �    �   b   c  �    5�_�                    b       ����                                                                                                                                                                                                                                                                                                                            b          b          V       b��1    �   a   c          0            xlsx2csv -- "${FILE_PATH}" && exit 55�_�                     c       ����                                                                                                                                                                                                                                                                                                                                                             b��5   
 �   b   d  �      +            wps -- "${FILE_PATH}" && exit 55��