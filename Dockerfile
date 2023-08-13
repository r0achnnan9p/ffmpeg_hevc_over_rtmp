# 使用Ubuntu 22.04 LTS作为基础镜像
FROM ubuntu:22.04

# 设置非交互模式，避免一些提示信息
ENV DEBIAN_FRONTEND=noninteractive

# 更新软件库并安装必要的依赖项
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    yasm \
    curl \
    pkg-config \
    libtool \
    nasm \
    libx264-dev \
    libx265-dev \
    libsrt-openssl-dev \
    libssl-dev

# 克隆 ffmpeg 源代码
RUN git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg_source

# 克隆 RTMP HEVC 项目
RUN git clone https://github.com/runner365/ffmpeg_rtmp_h265.git && \
    cp ffmpeg_rtmp_h265/flv.h ffmpeg_rtmp_h265/flvdec.c ffmpeg_rtmp_h265/flvenc.c ffmpeg_source/libavformat/

# 进入源代码目录并编译 FFmpeg
WORKDIR /ffmpeg_source

# 克隆ffmpeg源码并进行编译
RUN ./configure \
    --enable-nonfree \
    --enable-gpl \
    --enable-libx264 \
    --enable-libx265 \
    --enable-libsrt \
    --enable-openssl && \
    make -j$(nproc) && \
    make install

# 清理不必要的包以减少镜像大小
RUN apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /ffmpeg


# 设置入口点
ENTRYPOINT ["ffmpeg"]
