# FFmpeg with HEVC over RTMP Support

这是一个为 Linux x86 和 ARM64 架构定制的 FFmpeg 版本，增加了对通过 RTMP 传输的 HEVC（H.265）的支持。

## 特点

- 支持 x86 和 ARM64 架构。
- 增加了对通过 RTMP 传输的 HEVC（H.265）的支持。
- 基于最新的 FFmpeg 版本进行编译。
- 集成了 [ffmpeg_rtmp_h265](https://github.com/runner365/ffmpeg_rtmp_h265.git) 项目的功能。

## 如何使用

### 直接从 Docker Hub 获取

1. 拉取镜像
docker pull r0achnnan9p/ffmpeg_hevc_over_rtmp


2. 运行 FFmpeg
docker run r0achnnan9p/ffmpeg_hevc_over_rtmp [FFmpeg命令行参数]

## 致谢

- [ffmpeg_rtmp_h265](https://github.com/runner365/ffmpeg_rtmp_h265.git) 项目为 RTMP 传输的 HEVC 提供支持。

## 贡献

如果您发现任何问题或有任何改进建议，请提交 issue 或者 pull request。
