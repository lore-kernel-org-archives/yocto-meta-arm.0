Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 991FEC433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 14:08:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.5561.1647007700546835095
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Mar 2022 06:08:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4ABC14BF
	for <meta-arm@lists.yoctoproject.org>; Fri, 11 Mar 2022 06:08:19 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 721203FA27
	for <meta-arm@lists.yoctoproject.org>; Fri, 11 Mar 2022 06:08:19 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/edk2-firmware: upgrade to 202222
Date: Fri, 11 Mar 2022 14:08:14 +0000
Message-Id: <20220311140814.3406439-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 11 Mar 2022 14:08:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3155

Drop 0001-Fix-VLA-parameter-warning.patch, this is merged upstream.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware.inc   |  1 -
 .../recipes-bsp/uefi/edk2-firmware_202111.bb  |  4 --
 .../recipes-bsp/uefi/edk2-firmware_202202.bb  |  4 ++
 .../0001-Fix-VLA-parameter-warning.patch      | 44 -----------------
 .../recipes-bsp/uefi/files/unaligned.patch    | 48 ++++++++-----------
 meta-arm/recipes-bsp/uefi/sbsa-acs_3.1.bb     |  2 +-
 6 files changed, 26 insertions(+), 77 deletions(-)
 delete mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202111.bb
 create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202202.bb
 delete mode 100644 meta-arm/recipes-bsp/uefi/files/0001-Fix-VLA-parameter-=
warning.patch

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recipes=
-bsp/uefi/edk2-firmware.inc
index dc561eef..a653d295 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
@@ -16,7 +16,6 @@ EDK2_PLATFORMS_SRC_URI =3D "git://github.com/tianocore/ed=
k2-platforms.git;branch=3Dm
 SRC_URI =3D "\
     ${EDK2_SRC_URI};name=3Dedk2;destsuffix=3Dedk2;nobranch=3D1 \
     ${EDK2_PLATFORMS_SRC_URI};name=3Dedk2-platforms;destsuffix=3Dedk2/edk2=
-platforms;nobranch=3D1 \
-    file://0001-Fix-VLA-parameter-warning.patch \
     file://unaligned.patch \
 "
=20
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202111.bb b/meta-arm/r=
ecipes-bsp/uefi/edk2-firmware_202111.bb
deleted file mode 100644
index bc027ef7..00000000
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_202111.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-SRCREV_edk2           ?=3D "bb1bba3d776733c41dbfa2d1dc0fe234819a79f2"
-SRCREV_edk2-platforms ?=3D "3e73df15730667c46a1e449cca872e7f8861007c"
-
-require edk2-firmware.inc
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202202.bb b/meta-arm/r=
ecipes-bsp/uefi/edk2-firmware_202202.bb
new file mode 100644
index 00000000..441805e3
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_202202.bb
@@ -0,0 +1,4 @@
+SRCREV_edk2           ?=3D "b24306f15daa2ff8510b06702114724b33895d3c"
+SRCREV_edk2-platforms ?=3D "c9e377b00fc086fcb5a5b41663a0149bde9bcc2e"
+
+require edk2-firmware.inc
diff --git a/meta-arm/recipes-bsp/uefi/files/0001-Fix-VLA-parameter-warning=
.patch b/meta-arm/recipes-bsp/uefi/files/0001-Fix-VLA-parameter-warning.pat=
ch
deleted file mode 100644
index 66dede8f..00000000
--- a/meta-arm/recipes-bsp/uefi/files/0001-Fix-VLA-parameter-warning.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 498627ebda6271b59920f43a0b9b6187edeb7b09 Mon Sep 17 00:00:00 2001
-From: Adrian Herrera <adr.her.arc.95@gmail.com>
-Date: Mon, 22 Mar 2021 21:06:47 +0000
-Subject: [PATCH] Fix VLA parameter warning
-
-Make VLA buffer types consistent in declarations and definitions.
-Resolves build crash when using -Werror due to "vla-parameter" warning.
-
-Upstream-Status: Submitted [https://github.com/google/brotli/pull/893]
-Signed-off-by: Adrian Herrera <adr.her.arc.95@gmail.com>
----
- c/dec/decode.c | 6 ++++--
- c/enc/encode.c | 5 +++--
- 2 files changed, 7 insertions(+), 4 deletions(-)
-
---- a/BaseTools/Source/C/BrotliCompress/brotli/c/dec/decode.c
-+++ b/BaseTools/Source/C/BrotliCompress/brotli/c/dec/decode.c
-@@ -2030,8 +2030,10 @@ static BROTLI_NOINLINE BrotliDecoderErro
- }
-=20
- BrotliDecoderResult BrotliDecoderDecompress(
--    size_t encoded_size, const uint8_t* encoded_buffer, size_t* decoded_s=
ize,
--    uint8_t* decoded_buffer) {
-+    size_t encoded_size,
-+    const uint8_t encoded_buffer[BROTLI_ARRAY_PARAM(encoded_size)],
-+    size_t* decoded_size,
-+    uint8_t decoded_buffer[BROTLI_ARRAY_PARAM(*decoded_size)]) {
-   BrotliDecoderState s;
-   BrotliDecoderResult result;
-   size_t total_out =3D 0;
---- a/BaseTools/Source/C/BrotliCompress/brotli/c/enc/encode.c
-+++ b/BaseTools/Source/C/BrotliCompress/brotli/c/enc/encode.c
-@@ -1470,8 +1470,9 @@ static size_t MakeUncompressedStream(
-=20
- BROTLI_BOOL BrotliEncoderCompress(
-     int quality, int lgwin, BrotliEncoderMode mode, size_t input_size,
--    const uint8_t* input_buffer, size_t* encoded_size,
--    uint8_t* encoded_buffer) {
-+    const uint8_t input_buffer[BROTLI_ARRAY_PARAM(input_size)],
-+    size_t* encoded_size,
-+    uint8_t encoded_buffer[BROTLI_ARRAY_PARAM(*encoded_size)]) {
-   BrotliEncoderState* s;
-   size_t out_size =3D *encoded_size;
-   const uint8_t* input_start =3D input_buffer;
diff --git a/meta-arm/recipes-bsp/uefi/files/unaligned.patch b/meta-arm/rec=
ipes-bsp/uefi/files/unaligned.patch
index 1930f4c7..fa13956f 100644
--- a/meta-arm/recipes-bsp/uefi/files/unaligned.patch
+++ b/meta-arm/recipes-bsp/uefi/files/unaligned.patch
@@ -1,27 +1,21 @@
-Latest clang is causing build failures because -Werror is used:=0D
-=0D
-  edk2/MdeModulePkg/Include/Guid/ExtendedFirmwarePerformance.h:78:47:=0D
-  error: field Guid within 'FPDT_GUID_EVENT_RECORD' is less aligned than '=
EFI_GUID'=0D
-  and is usually due to 'FPDT_GUID_EVENT_RECORD' being packed, which can l=
ead to=0D
-  unaligned accesses [-Werror,-Wunaligned-access]=0D
-=0D
-This has been reported upstream[1] so until this is resolved, ignore the w=
arnings.=0D
-=0D
-[1] https://edk2.groups.io/g/devel/message/86838=0D
-=0D
-Upstream-Status: Pending=0D
-Signed-off-by: Ross Burton <ross.burton@arm.com>=0D
-=0D
-diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_def.=
template=0D
-index 2e6b382ab6..75bfbc5ae6 100755=0D
---- a/BaseTools/Conf/tools_def.template=0D
-+++ b/BaseTools/Conf/tools_def.template=0D
-@@ -2566,7 +2566,7 @@ DEFINE CLANG38_X64_PREFIX           =3D ENV(CLANG38_=
BIN)=0D
- DEFINE CLANG38_IA32_TARGET          =3D -target i686-pc-linux-gnu=0D=0D
- DEFINE CLANG38_X64_TARGET           =3D -target x86_64-pc-linux-gnu=0D=0D
- =0D=0D
--DEFINE CLANG38_WARNING_OVERRIDES    =3D -Wno-parentheses-equality -Wno-ta=
utological-compare -Wno-tautological-constant-out-of-range-compare -Wno-emp=
ty-body -Wno-unused-const-variable -Wno-varargs -Wno-unknown-warning-option=
=0D=0D
-+DEFINE CLANG38_WARNING_OVERRIDES    =3D -Wno-parentheses-equality -Wno-ta=
utological-compare -Wno-tautological-constant-out-of-range-compare -Wno-emp=
ty-body -Wno-unused-const-variable -Wno-varargs -Wno-unknown-warning-option=
 -Wno-error=3Dunaligned-access=0D=0D
- DEFINE CLANG38_ALL_CC_FLAGS         =3D DEF(GCC48_ALL_CC_FLAGS) DEF(CLANG=
38_WARNING_OVERRIDES) -fno-stack-protector -mms-bitfields -Wno-address -Wno=
-shift-negative-value -Wno-unknown-pragmas -Wno-incompatible-library-redecl=
aration -fno-asynchronous-unwind-tables -mno-sse -mno-mmx -msoft-float -mno=
-implicit-float  -ftrap-function=3Dundefined_behavior_has_been_optimized_aw=
ay_by_clang -funsigned-char -fno-ms-extensions -Wno-null-dereference=0D=0D
- =0D=0D
- ###########################=0D=0D
+Latest clang is causing build failures because -Werror is used:
+
+  edk2/MdeModulePkg/Include/Guid/ExtendedFirmwarePerformance.h:78:47:
+  error: field Guid within 'FPDT_GUID_EVENT_RECORD' is less aligned than '=
EFI_GUID'
+  and is usually due to 'FPDT_GUID_EVENT_RECORD' being packed, which can l=
ead to
+  unaligned accesses [-Werror,-Wunaligned-access]
+
+This has been reported upstream[1] so until this is resolved, ignore the w=
arnings.
+
+[1] https://edk2.groups.io/g/devel/message/86838
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_def.=
template
+index f2bb6247e8..ca2b449f0a 100755
+--- a/BaseTools/Conf/tools_def.template
++++ b/BaseTools/Conf/tools_def.template
+@@ -2570 +2570 @@ DEFINE CLANG38_X64_TARGET           =3D -target x86_64-p=
c-linux-gnu
+-DEFINE CLANG38_WARNING_OVERRIDES    =3D -Wno-parentheses-equality -Wno-ta=
utological-compare -Wno-tautological-constant-out-of-range-compare -Wno-emp=
ty-body -Wno-unused-const-variable -Wno-varargs -Wno-unknown-warning-option=
 -Wno-unused-but-set-variable -Wno-unused-const-variable=0D
++DEFINE CLANG38_WARNING_OVERRIDES    =3D -Wno-parentheses-equality -Wno-ta=
utological-compare -Wno-tautological-constant-out-of-range-compare -Wno-emp=
ty-body -Wno-unused-const-variable -Wno-varargs -Wno-unknown-warning-option=
 -Wno-unused-but-set-variable -Wno-unused-const-variable -Wno-error=3Dunali=
gned-access=0D
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs_3.1.bb b/meta-arm/recipes-b=
sp/uefi/sbsa-acs_3.1.bb
index fabeeaef..83852d0a 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs_3.1.bb
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs_3.1.bb
@@ -1,4 +1,4 @@
-require recipes-bsp/uefi/edk2-firmware_202111.bb
+require recipes-bsp/uefi/edk2-firmware_202202.bb
=20
 LICENSE +=3D "& Apache-2.0"
 LIC_FILES_CHKSUM +=3D "file://ShellPkg/Application/sbsa-acs/LICENSE.md;md5=
=3D2a944942e1496af1886903d274dedb13"
--=20
2.25.1


