# prebuilt/

Place the extracted kernel image here as `Image.gz`.

## How to extract from stock boot.img

### Windows — Android Image Kitchen (AIK)
1. Download AIK from: https://forum.xda-developers.com/t/tool-android-image-kitchen-unpack-repack-kernel-boot-images.2073775/
2. Place your `boot.img` in the AIK folder
3. Run `unpackimg.bat`
4. Copy `split_img/boot.img-kernel` to this folder and rename it to `Image.gz`

### Linux
```bash
# Using magiskboot (from Magisk releases)
./magiskboot unpack boot.img
# Output: kernel → rename to Image.gz
cp kernel ../device/huawei/hry-lx1/prebuilt/Image.gz
```

## Expected file
`prebuilt/Image.gz` — ARM64 kernel, typically 8–12MB for Kirin 710
