Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26BD9C00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 17:52:44 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.11.1659117158786011842
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 Jul 2022 10:52:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=AFSYcNI6;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.177,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f177.google.com with SMTP id v28so4140491qkg.13
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 Jul 2022 10:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gAWU2tfa0G0ZfxItb8FDA4Ui6Yj3UDme7LcCdux5rdQ=;
        b=AFSYcNI6qKPG1k61OFhDKw+Cp7GeefkxMTkt3KNoYirQJNNQ1s7jbl35/POSgO28vK
         1GPfn/k/I/ALbq8swmIkD8zmvxVpn6EymKVh9mp9xO64B2/g4e3urYboZi0cEPVgdOwU
         BM90qaJsEuwa+haQLa5/asmCDv82E8U8Poufo4tEQvWQ7IYbcCv2tROT2Ikj8HJe8cf2
         whbwGXhdIBMH/Ckw6VoNGAYN1FHRqDt2mCQ27mfjbFTexNGxGVSwQhnQQtIypo/n7HQS
         y0qP17nBWjnMXYWqVZDTI4YPrDBqZqEhirSM23KrsbvTOZch4JgVuSF9ja9oiaLo1S/O
         StQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gAWU2tfa0G0ZfxItb8FDA4Ui6Yj3UDme7LcCdux5rdQ=;
        b=KJdrnhWFF9/x8ThrivapbsqlAcgLqiVTKoCz9QxhkJSucbxGOuo0AaLoL0zVoVPfJT
         UvHNOzKybc7Mw/IZ8GFoAriH/ZkLC1metuLgpou/H8BUOUS/FOfZpRiR9tVKcuYenXGA
         E1ZAwl/LW8iki9+XD8UxZdV+Yraj2s8o0/ZJMfeU965GqhaOILh5nA4UpkyPmBrX+p+b
         fyB7/Ett97yl/P7AMQVCA0OsR8YhKrXBu1IlVI3zmZDU4ct2z/rF9oInQm0xRVf+gZpM
         GrzyRTDMCNlHVBf9V8EM6clN+YUceT/mc2OsPkRmfMSJZk+g0ah9KDoLVteE1YzuexOP
         zeUg==
X-Gm-Message-State: AJIora/926SOtsmtWmVC0Yx4CTjGOlojBlQjFrjW8VkHPsArM1Bhx6bv
	iJhFA0LYd5sdCIXzYR/m4zxz2Q==
X-Google-Smtp-Source: 
 AGRyM1uKJK46YT3HT9p65RUJhyLavGNEYfawOGz4JdItwle/f6aoOOPfd6ywOrPWKBxZZpi1poGkOw==
X-Received: by 2002:a05:620a:1720:b0:6b5:ff44:4fab with SMTP id
 az32-20020a05620a172000b006b5ff444fabmr3582553qkb.744.1659117157595;
        Fri, 29 Jul 2022 10:52:37 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 do54-20020a05620a2b3600b006b5e833d996sm2931248qkb.22.2022.07.29.10.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 10:52:37 -0700 (PDT)
Date: Fri, 29 Jul 2022 13:52:35 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Maciej Borzecki <maciek@thing.com>
Cc: meta-arm@lists.yoctoproject.org, Ross Burton <Ross.Burton@arm.com>
Subject: Re: [PATCH v2] arm/edk2-firmware: cherry pick gcc 12.x compatibility
 patches
Message-ID: <YuQeY0ZhY7c7eG7A@kudzu.us>
References: 
 <0a972044b11f7e469f122f3dc7b6778145b60133.1659090751.git.maciek@thing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <0a972044b11f7e469f122f3dc7b6778145b60133.1659090751.git.maciek@thing.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 29 Jul 2022 17:52:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3614

On Fri, Jul 29, 2022 at 12:34:46PM +0200, Maciej Borzecki wrote:
> Cherry pick gcc 12.x compatibility patches from the upstream.
> 
> Signed-off-by: Maciej Borzecki <maciek@thing.com>
> ---
>  meta-arm/recipes-bsp/uefi/edk2-firmware.inc   |  3 ++
>  ...001-Basetools-turn-off-gcc12-warning.patch | 39 +++++++++++++++
>  .../0002-BaseTools-fix-gcc12-warning.patch    | 49 +++++++++++++++++++
>  .../0003-BaseTools-fix-gcc12-warning.patch    | 47 ++++++++++++++++++
>  4 files changed, 138 insertions(+)
>  create mode 100644 meta-arm/recipes-bsp/uefi/files/0001-Basetools-turn-off-gcc12-warning.patch
>  create mode 100644 meta-arm/recipes-bsp/uefi/files/0002-BaseTools-fix-gcc12-warning.patch
>  create mode 100644 meta-arm/recipes-bsp/uefi/files/0003-BaseTools-fix-gcc12-warning.patch
> 
> diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> index e0dfa28b22fca06807cbdc5034618ede3c53a8f2..2219cae76ee79ee23b75b225dd489413f03ed224 100644
> --- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> +++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> @@ -19,6 +19,9 @@ SRC_URI = "\
>      ${EDK2_PLATFORMS_SRC_URI};name=edk2-platforms;destsuffix=edk2/edk2-platforms;nobranch=1 \
>      file://unaligned.patch \
>      file://default.patch;patchdir=edk2-platforms \
> +    file://0001-Basetools-turn-off-gcc12-warning.patch \
> +    file://0002-BaseTools-fix-gcc12-warning.patch \
> +    file://0003-BaseTools-fix-gcc12-warning.patch \

All 3 of these patches are in the version of edk2 that the master
branch is using.  Was your intention to send these for the kirkstone
branch?  If so, it does not apply cleanly.

Thanks,
Jon

>  "
>  
>  SRCREV_FORMAT         = "edk2_edk2-platforms"
> diff --git a/meta-arm/recipes-bsp/uefi/files/0001-Basetools-turn-off-gcc12-warning.patch b/meta-arm/recipes-bsp/uefi/files/0001-Basetools-turn-off-gcc12-warning.patch
> new file mode 100644
> index 0000000000000000000000000000000000000000..1a530f3d076b0802daaa3b8512226e44352c9ceb
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/uefi/files/0001-Basetools-turn-off-gcc12-warning.patch
> @@ -0,0 +1,39 @@
> +From 22130dcd98b4d4b76ac8d922adb4a2dbc86fa52c Mon Sep 17 00:00:00 2001
> +From: Gerd Hoffmann <kraxel@redhat.com>
> +Date: Thu, 24 Mar 2022 20:04:36 +0800
> +Subject: [PATCH] Basetools: turn off gcc12 warning
> +
> +In function ?SetDevicePathEndNode?,
> +    inlined from ?FileDevicePath? at DevicePathUtilities.c:857:5:
> +DevicePathUtilities.c:321:3: error: writing 4 bytes into a region of size 1 [-Werror=stringop-overflow=]
> +  321 |   memcpy (Node, &mUefiDevicePathLibEndDevicePath, sizeof (mUefiDevicePathLibEndDevicePath));
> +      |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +In file included from UefiDevicePathLib.h:22,
> +                 from DevicePathUtilities.c:16:
> +../Include/Protocol/DevicePath.h: In function ?FileDevicePath?:
> +../Include/Protocol/DevicePath.h:51:9: note: destination object ?Type? of size 1
> +   51 |   UINT8 Type;       ///< 0x01 Hardware Device Path.
> +      |         ^~~~
> +
> +Upstream-Status: Backport
> +Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> +Reviewed-by: Bob Feng <bob.c.feng@intel.com>
> +Signed-off-by: Maciej Borzecki <maciek@thing.com>
> +---
> + BaseTools/Source/C/DevicePath/GNUmakefile | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/BaseTools/Source/C/DevicePath/GNUmakefile b/BaseTools/Source/C/DevicePath/GNUmakefile
> +index 7ca08af9662d..b05d2bddfa68 100644
> +--- a/BaseTools/Source/C/DevicePath/GNUmakefile
> ++++ b/BaseTools/Source/C/DevicePath/GNUmakefile
> +@@ -13,6 +13,9 @@ OBJECTS = DevicePath.o UefiDevicePathLib.o DevicePathFromText.o  DevicePathUtili
> + 
> + include $(MAKEROOT)/Makefiles/app.makefile
> + 
> ++# gcc 12 trips over device path handling
> ++BUILD_CFLAGS += -Wno-error=stringop-overflow
> ++
> + LIBS = -lCommon
> + ifeq ($(CYGWIN), CYGWIN)
> +   LIBS += -L/lib/e2fsprogs -luuid
> diff --git a/meta-arm/recipes-bsp/uefi/files/0002-BaseTools-fix-gcc12-warning.patch b/meta-arm/recipes-bsp/uefi/files/0002-BaseTools-fix-gcc12-warning.patch
> new file mode 100644
> index 0000000000000000000000000000000000000000..8a095a0c2ea5e59f01360fa26414042f84f0445f
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/uefi/files/0002-BaseTools-fix-gcc12-warning.patch
> @@ -0,0 +1,49 @@
> +From 85021f8cf22d1bd4114803c6c610dea5ef0059f1 Mon Sep 17 00:00:00 2001
> +From: Gerd Hoffmann <kraxel@redhat.com>
> +Date: Thu, 24 Mar 2022 20:04:35 +0800
> +Subject: [PATCH] BaseTools: fix gcc12 warning
> +
> +Sdk/C/LzmaEnc.c: In function ?LzmaEnc_CodeOneMemBlock?:
> +Sdk/C/LzmaEnc.c:2828:19: error: storing the address of local variable ?outStream? in ?*p.rc.outStream? [-Werror=dangling-pointer=]
> + 2828 |   p->rc.outStream = &outStream.vt;
> +      |   ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
> +Sdk/C/LzmaEnc.c:2811:28: note: ?outStream? declared here
> + 2811 |   CLzmaEnc_SeqOutStreamBuf outStream;
> +      |                            ^~~~~~~~~
> +Sdk/C/LzmaEnc.c:2811:28: note: ?pp? declared here
> +Sdk/C/LzmaEnc.c:2828:19: error: storing the address of local variable ?outStream? in ?*(CLzmaEnc *)pp.rc.outStream? [-Werror=dangling-pointer=]
> + 2828 |   p->rc.outStream = &outStream.vt;
> +      |   ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
> +Sdk/C/LzmaEnc.c:2811:28: note: ?outStream? declared here
> + 2811 |   CLzmaEnc_SeqOutStreamBuf outStream;
> +      |                            ^~~~~~~~~
> +Sdk/C/LzmaEnc.c:2811:28: note: ?pp? declared here
> +cc1: all warnings being treated as errors
> +
> +Upstream-Status: Backport
> +Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> +Reviewed-by: Bob Feng <bob.c.feng@intel.com>
> +Signed-off-by: Maciej Borzecki <maciek@thing.com>
> +---
> + BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c b/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
> +index 4e9b499f8d80..4b9f5fa69248 100644
> +--- a/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
> ++++ b/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
> +@@ -2825,12 +2825,13 @@ SRes LzmaEnc_CodeOneMemBlock(CLzmaEncHandle pp, BoolInt reInit,
> + 
> +   nowPos64 = p->nowPos64;
> +   RangeEnc_Init(&p->rc);
> +-  p->rc.outStream = &outStream.vt;
> + 
> +   if (desiredPackSize == 0)
> +     return SZ_ERROR_OUTPUT_EOF;
> + 
> ++  p->rc.outStream = &outStream.vt;
> +   res = LzmaEnc_CodeOneBlock(p, desiredPackSize, *unpackSize);
> ++  p->rc.outStream = NULL;
> + 
> +   *unpackSize = (UInt32)(p->nowPos64 - nowPos64);
> +   *destLen -= outStream.rem;
> diff --git a/meta-arm/recipes-bsp/uefi/files/0003-BaseTools-fix-gcc12-warning.patch b/meta-arm/recipes-bsp/uefi/files/0003-BaseTools-fix-gcc12-warning.patch
> new file mode 100644
> index 0000000000000000000000000000000000000000..a9f1ccf2152a00094fe99fd01bcfd885d3ca6ba9
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/uefi/files/0003-BaseTools-fix-gcc12-warning.patch
> @@ -0,0 +1,47 @@
> +From 7b005f344e533cd913c3ca05b266f9872df886d1 Mon Sep 17 00:00:00 2001
> +From: Gerd Hoffmann <kraxel@redhat.com>
> +Date: Thu, 24 Mar 2022 20:04:34 +0800
> +Subject: [PATCH] BaseTools: fix gcc12 warning
> +
> +GenFfs.c:545:5: error: pointer ?InFileHandle? used after ?fclose? [-Werror=use-after-free]
> +  545 |     Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  of %s", InFileHandle);
> +      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +GenFfs.c:544:5: note: call to ?fclose? here
> +  544 |     fclose (InFileHandle);
> +      |     ^~~~~~~~~~~~~~~~~~~~~
> +
> +Upstream-Status: Backport
> +Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> +Reviewed-by: Bob Feng <bob.c.feng@intel.com>
> +Signed-off-by: Maciej Borzecki <maciek@thing.com>
> +---
> + BaseTools/Source/C/GenFfs/GenFfs.c | 2 +-
> + BaseTools/Source/C/GenSec/GenSec.c | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/BaseTools/Source/C/GenFfs/GenFfs.c b/BaseTools/Source/C/GenFfs/GenFfs.c
> +index 949025c33325..d78d62ab3689 100644
> +--- a/BaseTools/Source/C/GenFfs/GenFfs.c
> ++++ b/BaseTools/Source/C/GenFfs/GenFfs.c
> +@@ -542,7 +542,7 @@ GetAlignmentFromFile(char *InFile, UINT32 *Alignment)
> +   PeFileBuffer = (UINT8 *) malloc (PeFileSize);
> +   if (PeFileBuffer == NULL) {
> +     fclose (InFileHandle);
> +-    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  of %s", InFileHandle);
> ++    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated for %s", InFile);
> +     return EFI_OUT_OF_RESOURCES;
> +   }
> +   fread (PeFileBuffer, sizeof (UINT8), PeFileSize, InFileHandle);
> +diff --git a/BaseTools/Source/C/GenSec/GenSec.c b/BaseTools/Source/C/GenSec/GenSec.c
> +index d54a4f9e0a7d..b1d05367ec0b 100644
> +--- a/BaseTools/Source/C/GenSec/GenSec.c
> ++++ b/BaseTools/Source/C/GenSec/GenSec.c
> +@@ -1062,7 +1062,7 @@ GetAlignmentFromFile(char *InFile, UINT32 *Alignment)
> +   PeFileBuffer = (UINT8 *) malloc (PeFileSize);
> +   if (PeFileBuffer == NULL) {
> +     fclose (InFileHandle);
> +-    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  of %s", InFileHandle);
> ++    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated for %s", InFile);
> +     return EFI_OUT_OF_RESOURCES;
> +   }
> +   fread (PeFileBuffer, sizeof (UINT8), PeFileSize, InFileHandle);
> -- 
> 2.37.1
> 
> 

