default:
    @just --list

serve-kit:
    cp -r "./src" "./out"
    -[ ! -f "./sourcemap.json" ] && rojo sourcemap -o sourcemap.json sourcemap.project.json

    rojo sourcemap -o sourcemap.json sourcemap.project.json --watch &
    darklua process --watch src out &
    blink .blink --watch &
    rojo serve &
