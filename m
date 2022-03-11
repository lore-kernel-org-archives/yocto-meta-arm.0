Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDE0AC433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 17:16:22 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.7984.1647018978043055972
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Mar 2022 09:16:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C0AE440C46;
	Fri, 11 Mar 2022 17:16:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AuhGWEiljV5T; Fri, 11 Mar 2022 17:16:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9A0A840A03;
	Fri, 11 Mar 2022 17:16:15 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id CE7C716BAE9; Fri, 11 Mar 2022 12:16:14 -0500 (EST)
Date: Fri, 11 Mar 2022 12:16:14 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm/edk2-firmware: upgrade to 202222
Message-ID: <20220311171614.GA1766@denix.org>
References: <20220311140814.3406439-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220311140814.3406439-1-ross.burton@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 11 Mar 2022 17:16:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3156

Is it 202222 or 202202?

On Fri, Mar 11, 2022 at 02:08:14PM +0000, Ross Burton wrote:
> Drop 0001-Fix-VLA-parameter-warning.patch, this is merged upstream.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta-arm/recipes-bsp/uefi/edk2-firmware.inc   |  1 -
>  .../recipes-bsp/uefi/edk2-firmware_202111.bb  |  4 --
>  .../recipes-bsp/uefi/edk2-firmware_202202.bb  |  4 ++
>  .../0001-Fix-VLA-parameter-warning.patch      | 44 -----------------
>  .../recipes-bsp/uefi/files/unaligned.patch    | 48 ++++++++-----------
>  meta-arm/recipes-bsp/uefi/sbsa-acs_3.1.bb     |  2 +-
>  6 files changed, 26 insertions(+), 77 deletions(-)
>  delete mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202111.bb
>  create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202202.bb
>  delete mode 100644 meta-arm/recipes-bsp/uefi/files/0001-Fix-VLA-parameter-warning.patch
> 
> diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> index dc561eef..a653d295 100644
> --- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> +++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> @@ -16,7 +16,6 @@ EDK2_PLATFORMS_SRC_URI = "git://github.com/tianocore/edk2-platforms.git;branch=m
>  SRC_URI = "\
>      ${EDK2_SRC_URI};name=edk2;destsuffix=edk2;nobranch=1 \
>      ${EDK2_PLATFORMS_SRC_URI};name=edk2-platforms;destsuffix=edk2/edk2-platforms;nobranch=1 \
> -    file://0001-Fix-VLA-parameter-warning.patch \
>      file://unaligned.patch \
>  "
>  
> diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202111.bb b/meta-arm/recipes-bsp/uefi/edk2-firmware_202111.bb
> deleted file mode 100644
> index bc027ef7..00000000
> --- a/meta-arm/recipes-bsp/uefi/edk2-firmware_202111.bb
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -SRCREV_edk2           ?= "bb1bba3d776733c41dbfa2d1dc0fe234819a79f2"
> -SRCREV_edk2-platforms ?= "3e73df15730667c46a1e449cca872e7f8861007c"
> -
> -require edk2-firmware.inc
> diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202202.bb b/meta-arm/recipes-bsp/uefi/edk2-firmware_202202.bb
> new file mode 100644
> index 00000000..441805e3
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_202202.bb
> @@ -0,0 +1,4 @@
> +SRCREV_edk2           ?= "b24306f15daa2ff8510b06702114724b33895d3c"
> +SRCREV_edk2-platforms ?= "c9e377b00fc086fcb5a5b41663a0149bde9bcc2e"
> +
> +require edk2-firmware.inc
> diff --git a/meta-arm/recipes-bsp/uefi/files/0001-Fix-VLA-parameter-warning.patch b/meta-arm/recipes-bsp/uefi/files/0001-Fix-VLA-parameter-warning.patch
> deleted file mode 100644
> index 66dede8f..00000000
> --- a/meta-arm/recipes-bsp/uefi/files/0001-Fix-VLA-parameter-warning.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From 498627ebda6271b59920f43a0b9b6187edeb7b09 Mon Sep 17 00:00:00 2001
> -From: Adrian Herrera <adr.her.arc.95@gmail.com>
> -Date: Mon, 22 Mar 2021 21:06:47 +0000
> -Subject: [PATCH] Fix VLA parameter warning
> -
> -Make VLA buffer types consistent in declarations and definitions.
> -Resolves build crash when using -Werror due to "vla-parameter" warning.
> -
> -Upstream-Status: Submitted [https://github.com/google/brotli/pull/893]
> -Signed-off-by: Adrian Herrera <adr.her.arc.95@gmail.com>
> ----
> - c/dec/decode.c | 6 ++++--
> - c/enc/encode.c | 5 +++--
> - 2 files changed, 7 insertions(+), 4 deletions(-)
> -
> ---- a/BaseTools/Source/C/BrotliCompress/brotli/c/dec/decode.c
> -+++ b/BaseTools/Source/C/BrotliCompress/brotli/c/dec/decode.c
> -@@ -2030,8 +2030,10 @@ static BROTLI_NOINLINE BrotliDecoderErro
> - }
> - 
> - BrotliDecoderResult BrotliDecoderDecompress(
> --    size_t encoded_size, const uint8_t* encoded_buffer, size_t* decoded_size,
> --    uint8_t* decoded_buffer) {
> -+    size_t encoded_size,
> -+    const uint8_t encoded_buffer[BROTLI_ARRAY_PARAM(encoded_size)],
> -+    size_t* decoded_size,
> -+    uint8_t decoded_buffer[BROTLI_ARRAY_PARAM(*decoded_size)]) {
> -   BrotliDecoderState s;
> -   BrotliDecoderResult result;
> -   size_t total_out = 0;
> ---- a/BaseTools/Source/C/BrotliCompress/brotli/c/enc/encode.c
> -+++ b/BaseTools/Source/C/BrotliCompress/brotli/c/enc/encode.c
> -@@ -1470,8 +1470,9 @@ static size_t MakeUncompressedStream(
> - 
> - BROTLI_BOOL BrotliEncoderCompress(
> -     int quality, int lgwin, BrotliEncoderMode mode, size_t input_size,
> --    const uint8_t* input_buffer, size_t* encoded_size,
> --    uint8_t* encoded_buffer) {
> -+    const uint8_t input_buffer[BROTLI_ARRAY_PARAM(input_size)],
> -+    size_t* encoded_size,
> -+    uint8_t encoded_buffer[BROTLI_ARRAY_PARAM(*encoded_size)]) {
> -   BrotliEncoderState* s;
> -   size_t out_size = *encoded_size;
> -   const uint8_t* input_start = input_buffer;
> diff --git a/meta-arm/recipes-bsp/uefi/files/unaligned.patch b/meta-arm/recipes-bsp/uefi/files/unaligned.patch
> index 1930f4c7..fa13956f 100644
> --- a/meta-arm/recipes-bsp/uefi/files/unaligned.patch
> +++ b/meta-arm/recipes-bsp/uefi/files/unaligned.patch
> @@ -1,27 +1,21 @@
> -Latest clang is causing build failures because -Werror is used:
> -
> -  edk2/MdeModulePkg/Include/Guid/ExtendedFirmwarePerformance.h:78:47:
> -  error: field Guid within 'FPDT_GUID_EVENT_RECORD' is less aligned than 'EFI_GUID'
> -  and is usually due to 'FPDT_GUID_EVENT_RECORD' being packed, which can lead to
> -  unaligned accesses [-Werror,-Wunaligned-access]
> -
> -This has been reported upstream[1] so until this is resolved, ignore the warnings.
> -
> -[1] https://edk2.groups.io/g/devel/message/86838
> -
> -Upstream-Status: Pending
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> -
> -diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_def.template
> -index 2e6b382ab6..75bfbc5ae6 100755
> ---- a/BaseTools/Conf/tools_def.template
> -+++ b/BaseTools/Conf/tools_def.template
> -@@ -2566,7 +2566,7 @@ DEFINE CLANG38_X64_PREFIX           = ENV(CLANG38_BIN)
> - DEFINE CLANG38_IA32_TARGET          = -target i686-pc-linux-gnu
> - DEFINE CLANG38_X64_TARGET           = -target x86_64-pc-linux-gnu
> - 
> --DEFINE CLANG38_WARNING_OVERRIDES    = -Wno-parentheses-equality -Wno-tautological-compare -Wno-tautological-constant-out-of-range-compare -Wno-empty-body -Wno-unused-const-variable -Wno-varargs -Wno-unknown-warning-option
> -+DEFINE CLANG38_WARNING_OVERRIDES    = -Wno-parentheses-equality -Wno-tautological-compare -Wno-tautological-constant-out-of-range-compare -Wno-empty-body -Wno-unused-const-variable -Wno-varargs -Wno-unknown-warning-option -Wno-error=unaligned-access
> - DEFINE CLANG38_ALL_CC_FLAGS         = DEF(GCC48_ALL_CC_FLAGS) DEF(CLANG38_WARNING_OVERRIDES) -fno-stack-protector -mms-bitfields -Wno-address -Wno-shift-negative-value -Wno-unknown-pragmas -Wno-incompatible-library-redeclaration -fno-asynchronous-unwind-tables -mno-sse -mno-mmx -msoft-float -mno-implicit-float  -ftrap-function=undefined_behavior_has_been_optimized_away_by_clang -funsigned-char -fno-ms-extensions -Wno-null-dereference
> - 
> - ###########################
> +Latest clang is causing build failures because -Werror is used:
> +
> +  edk2/MdeModulePkg/Include/Guid/ExtendedFirmwarePerformance.h:78:47:
> +  error: field Guid within 'FPDT_GUID_EVENT_RECORD' is less aligned than 'EFI_GUID'
> +  and is usually due to 'FPDT_GUID_EVENT_RECORD' being packed, which can lead to
> +  unaligned accesses [-Werror,-Wunaligned-access]
> +
> +This has been reported upstream[1] so until this is resolved, ignore the warnings.
> +
> +[1] https://edk2.groups.io/g/devel/message/86838
> +
> +Upstream-Status: Pending
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +
> +diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_def.template
> +index f2bb6247e8..ca2b449f0a 100755
> +--- a/BaseTools/Conf/tools_def.template
> ++++ b/BaseTools/Conf/tools_def.template
> +@@ -2570 +2570 @@ DEFINE CLANG38_X64_TARGET           = -target x86_64-pc-linux-gnu
> +-DEFINE CLANG38_WARNING_OVERRIDES    = -Wno-parentheses-equality -Wno-tautological-compare -Wno-tautological-constant-out-of-range-compare -Wno-empty-body -Wno-unused-const-variable -Wno-varargs -Wno-unknown-warning-option -Wno-unused-but-set-variable -Wno-unused-const-variable
> ++DEFINE CLANG38_WARNING_OVERRIDES    = -Wno-parentheses-equality -Wno-tautological-compare -Wno-tautological-constant-out-of-range-compare -Wno-empty-body -Wno-unused-const-variable -Wno-varargs -Wno-unknown-warning-option -Wno-unused-but-set-variable -Wno-unused-const-variable -Wno-error=unaligned-access
> diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs_3.1.bb b/meta-arm/recipes-bsp/uefi/sbsa-acs_3.1.bb
> index fabeeaef..83852d0a 100644
> --- a/meta-arm/recipes-bsp/uefi/sbsa-acs_3.1.bb
> +++ b/meta-arm/recipes-bsp/uefi/sbsa-acs_3.1.bb
> @@ -1,4 +1,4 @@
> -require recipes-bsp/uefi/edk2-firmware_202111.bb
> +require recipes-bsp/uefi/edk2-firmware_202202.bb
>  
>  LICENSE += "& Apache-2.0"
>  LIC_FILES_CHKSUM += "file://ShellPkg/Application/sbsa-acs/LICENSE.md;md5=2a944942e1496af1886903d274dedb13"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3155): https://lists.yoctoproject.org/g/meta-arm/message/3155
> Mute This Topic: https://lists.yoctoproject.org/mt/89710722/3617104
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [denis@denix.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

