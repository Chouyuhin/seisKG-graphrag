#!/bin/bash
# 用 GMT6 将三个地震目录（巧家/Ridgecrest/玛多）的分布图拼成一张组合图（1行3列）。
# 风格与 plot_catalog_maps.sh 保持一致：墨卡托投影，海陆矢量填色 + 海岸线/国界/省界 + 按震级着色定大小的震中散点。
set -e
cd "$(dirname "$0")"

gmt makecpt -Cinferno -T-1/7.5/0.5 > mag.cpt

panel_one () {
    PANEL="$1"; R="$2"; DATA="$3"; TITLE="$4"
    # Fixed 6x6 cm linear (degree) frame for every panel, regardless of the
    # region's native lon/lat aspect ratio, so all three panels are exactly
    # the same size and each map fills its own outer frame with no whitespace.
    gmt basemap -R${R} -JX6cd/6cd -Baf -B+t"${TITLE}" -c${PANEL}
    gmt coast -Ggray92 -Slightblue -Da -W0.3p,gray40 -N1/0.5p,gray20 -N2/0.3p,gray55 -A20
    awk '{print $1, $2, $3, ($3+2.2)*0.011}' "${DATA}" | \
        gmt plot -Sc -Cmag.cpt -t10
    # Compact colorbar inside this panel's own bottom-right corner, sized to
    # stay well within the 6x6 cm frame so it never overflows.
    gmt colorbar -Cmag.cpt -DjBR+w2.6c/0.18c+o0.25c/0.45c+h -Bxaf+l"M" -F+gwhite@30+p0.3p
}

gmt begin fig6_event_maps_gmt pdf,png
    gmt set MAP_TICK_LENGTH 2p
    gmt set MAP_FRAME_TYPE plain
    gmt set FONT_TITLE 11p,Helvetica-Bold
    gmt set FONT_ANNOT_PRIMARY 8p

    gmt subplot begin 1x3 -Fs6c/6c -M0.4c/0.2c

        panel_one 0,0 "102.3/103.6/25.9/27.6"     qiaojia_evt.txt    "(a) Qiaojia-Dongchuan (n=5,218)"
        panel_one 0,1 "-117.95/-117.15/35.4/36.1" ridgecrest_evt.txt "(b) Ridgecrest (n=4,188)"
        panel_one 0,2 "97.2/99.6/33.6/35.5"       maduo_evt.txt      "(c) Maduo (n=10,621)"

    gmt subplot end
gmt end

pdftocairo -svg fig6_event_maps_gmt.pdf fig6_event_maps_gmt.svg
echo "done: fig6_event_maps_gmt.png / .pdf / .svg"
