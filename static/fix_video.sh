#!/bin/bash

# 设置原始视频目录
INPUT_DIR="/home/lenovo/acm_mm_dataset/Endo_TTAP_website/static/video"

# 遍历所有 mp4 文件
for input_file in "$INPUT_DIR"/*.mp4; do
    # 跳过非文件（如无匹配）
    [ -f "$input_file" ] || continue

    # 获取不带扩展名的文件名
    filename=$(basename "$input_file" .mp4)

    # 设置输出文件路径（添加后缀 _h264）
    output_file="$INPUT_DIR/${filename}_h264.mp4"

    echo "🔄 转换中: $filename.mp4 -> ${filename}_h264.mp4"

    # 使用 ffmpeg 转码为 H.264
    ffmpeg -i "$input_file" -vcodec libx264 -pix_fmt yuv420p -acodec aac "$output_file" -y
done

echo "✅ 所有视频已处理完成。"
