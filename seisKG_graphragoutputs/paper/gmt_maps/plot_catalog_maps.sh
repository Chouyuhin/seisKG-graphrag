#!/bin/bash
# 用 GMT6 为三个地震目录（巧家/Ridgecrest/玛多）绘制地震目录分布图（纯矢量）。
# 墨卡托投影，海陆矢量填色 + 海岸线/国界/省界 + 按震级着色定大小的震中散点。
# GMT 输出 PDF（矢量），再用 pdftocairo 转为 SVG 矢量图。
set -e
cd "$(dirname "$0")"

# 震级配色表（黄->橙->红）
gmt makecpt -Cinferno -T-1/7.5/0.5 > mag.cpt

plot_one () {
    NAME="$1"; R="$2"; DATA="$3"; TITLE="$4"
    gmt begin "map_${NAME}" pdf
        gmt set MAP_TICK_LENGTH 2p
        gmt set MAP_FRAME_TYPE plain
        gmt set FONT_TITLE 11p,Helvetica-Bold
        gmt set FONT_ANNOT_PRIMARY 8p

        # 墨卡托投影，宽 7cm；矩形范围 -R w/e/s/n
        gmt basemap -R${R} -JM7c -Baf -B+t"${TITLE}"
        # 海陆矢量填色 + 海岸线 + 国界(N1) + 省/州界(N2)
        gmt coast -Ggray92 -Slightblue -Da -W0.3p,gray40 -N1/0.5p,gray20 -N2/0.3p,gray55 -A20
        # 震中散点：按震级着色、按震级定大小（大震更大）
        awk '{print $1, $2, $3, ($3+2.2)*0.011}' "${DATA}" | \
            gmt plot -Sc -Cmag.cpt -t10
        # 色标
        gmt colorbar -Cmag.cpt -DjBR+w2.6c/0.20c+o0.25c/0.30c+h -Bxaf+l"M" -F+gwhite@25+p0.3p
    gmt end
    pdftocairo -svg "map_${NAME}.pdf" "map_${NAME}.svg"
    echo "done: map_${NAME}.svg  ($(du -h map_${NAME}.svg | cut -f1))"
}

plot_one qiaojia    "102.3/103.6/25.9/27.6"     qiaojia_evt.txt    "(a) Qiaojia-Dongchuan (n=5,218)"
plot_one ridgecrest "-117.95/-117.15/35.4/36.1" ridgecrest_evt.txt "(b) Ridgecrest (n=4,188)"
plot_one maduo      "97.2/99.6/33.6/35.5"       maduo_evt.txt      "(c) Maduo (n=10,621)"

echo "ALL DONE"
