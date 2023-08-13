# 使用 Alpine Linux 作为基础镜像
FROM alpine:latest

# 安装必要的依赖项
RUN apk update && \
    apk add --no-cache \
    git \
    build-base \
    yasm \
    curl \
    coreutils \
    pkgconf \
    libtool \
    nasm \
    libx264-dev \
    libx265-dev \
    srt-dev \
    openssl-dev

# 克隆 ffmpeg 源代码
RUN git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg_source

# 克隆 RTMP HEVC 项目
RUN git clone https://github.com/runner365/ffmpeg_rtmp_h265.git && \
    cp ffmpeg_rtmp_h265/flv.h ffmpeg_rtmp_h265/flvdec.c ffmpeg_rtmp_h265/flvenc.c ffmpeg_source/libavformat/

# 进入源代码目录并编译 FFmpeg
WORKDIR /ffmpeg_source
RUN ./configure --enable-libsrt --enable-libx264 --enable-libx265 --enable-openssl && \
    make && \
    make install

# 设置容器的默认入口点
ENTRYPOINT ["ffmpeg"]
