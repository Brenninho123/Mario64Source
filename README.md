# Mario64Source — Windows + Android CI starter

This package provides a GitHub Actions starting point for building a Super Mario 64 PC port for Windows and an Android APK.

## Important status

This is **not the complete game source** and does not produce a playable build until the workflow can download a legally obtained base ROM. The current `BrenninhoTools/Mario64Source` repository appears to be a minimal shell, so this package does not pretend that source files are already integrated.

The workflows fetch source during CI from:
- Windows: `https://github.com/sm64pc/sm64ex` (`nightly` branch)
- Android: `https://github.com/VDavid003/sm64-port-android-base` (`master` branch)

Review upstream licenses and build instructions before redistributing or modifying their code.

## Required repository secrets

GitHub-hosted runners cannot read files from your phone or computer. Do not commit a ROM to a public repository and do not put an 8 MB ROM in a GitHub Actions secret.

Configure these repository secrets if you have a private, authorized download location for your own base ROM:

- `BASEROM_DOWNLOAD_URL`: direct HTTPS download URL for your own `baserom.us.z64`
- `BASEROM_DOWNLOAD_TOKEN` (optional): bearer token if the endpoint requires it

The workflow downloads the file only during the job and does not upload it as an artifact. The URL must return the ROM file itself, not an HTML page. If you don't have a suitable private download endpoint, use a self-hosted runner or adapt the workflow to a private asset store you control.

## Run a build

1. Add these files to your `BrenninhoTools/Mario64Source` repository.
2. Open **Settings → Secrets and variables → Actions** and add the secrets above.
3. Open **Actions → Mario64Source CI → Run workflow**.
4. Choose `windows`, `android`, or `both`.
5. Download build artifacts from the workflow run's **Artifacts** section.

## Included files

- `.github/workflows/build.yml` — Windows and Android jobs.
- `.gitignore` — excludes ROM files and generated output.
- `scripts/check-baserom.sh` — basic local file-presence/size check.

## Build limitations

- This is a CI starter, not a verified successful build. Upstream repositories and dependencies can change.
- It fetches upstream source during CI; it does not merge thousands of upstream source files into `Mario64Source`.
- The Android job follows the Android port's documented Linux build sequence: native build under `app/jni/src`, then `./gradlew assembleDebug`.
- A green workflow means the build commands completed; it does not guarantee that the result runs on every device.
- No ROM or extracted copyrighted game assets are included.

## References

- `sm64ex`: https://github.com/sm64pc/sm64ex
- Windows build guide: https://github.com/sm64pc/sm64ex/wiki/Compiling-on-Windows
- Android source port: https://github.com/VDavid003/sm64-port-android-base
