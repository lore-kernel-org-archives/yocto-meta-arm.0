Return-Path: <maciek@thing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C364C19F2B
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 10:35:13 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web09.6557.1659090909432249591
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 Jul 2022 03:35:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thing-com.20210112.gappssmtp.com header.s=20210112
 header.b=HKvDvIbA;
 spf=pass (domain: thing.com, ip: 209.85.167.42, mailfrom: maciek@thing.com)
Received: by mail-lf1-f42.google.com with SMTP id z25so6731890lfr.2
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 Jul 2022 03:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thing-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MvO7pjkBcIvA3cu+/RS1MWow/u511sSgj5nGtpwTVtI=;
        b=HKvDvIbAgYimZMh3UXgaDOYxbVmutMNPY1ddwkrgy8EQtzQTDjms+j9jlw7Ff9dnco
         1lTFWFqzWP1BAvfyae1LoR8I9jZBia1hROyfDxdyR+uvhXWfDmqb949fUFP7lrNI/IhJ
         FifCZnxXHosBziMFmyGEam5idJGlKJZICx9DnIzEG5FGsyRzAFStVWG5YPslQEChxDLi
         INPY2tKhZ+wy/3/5zVeq9beVmM8VsF+pg+OCmtNrLEnifUzV3dlMnXbbSD8yIKAcJNPM
         /xL8JEyWc31VcLzWzjeZqgjWbM0OiqxEg7aJMT4VEbVlvvRa4beNrOtMKOBG0zmZxR5P
         QaVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MvO7pjkBcIvA3cu+/RS1MWow/u511sSgj5nGtpwTVtI=;
        b=AgvxhBetENtufBR1vlkDldwuRWCu31nY7jVVfegc7JlHRMxV/JvMp7OyAI6A7DLD/E
         1iPfsj/LhmqZb+2cu1WRjFBnmQjhQKqI7eGFjNzokwJpGC7xqc4ldcH90jEbJBw8uSdX
         krw5FMnrIvN62OYW3/iYIysToqYmx4ah91ZWgB2uOX2BTDiLWJ7aYYYlF32zYks8Oz6O
         t9fj56SqNXU9fG8xrFrHMoNtxznfAnGE/4yR+jzLvR5ws8PC1GrC0KUC9/nohxRkaVHk
         Hqv1Ygn1TwD7jOLPCCtr5VXz9BmNdmtSMW0lYQGgvYdqYd9+TdgaiYMOVIQJ6BAY0dkV
         qVbg==
X-Gm-Message-State: AJIora/k5V4PQWLMN29LrEle7CaCETr1Lwkv1cNg3owRI3VZdRsgr1yP
	Nzi0EnLvgZbAfkry0l9JAFLBVbYvcIsRy0Io
X-Google-Smtp-Source: 
 AGRyM1ssjvnTQAsV4ge6d7vrfwB4mE5yDCzrOjyvY5/zhDut2rhobq9Ck+32DwLOjcA6Y059FqgMqQ==
X-Received: by 2002:a05:6512:3a92:b0:48a:b775:e30c with SMTP id
 q18-20020a0565123a9200b0048ab775e30cmr1052535lfu.327.1659090906743;
        Fri, 29 Jul 2022 03:35:06 -0700 (PDT)
Received: from localhost.localdomain (178-37-241-229.adsl.inetia.pl.
 [178.37.241.229])
        by smtp.googlemail.com with ESMTPSA id
 y21-20020a05651c021500b0025d6ecbc897sm605113ljn.46.2022.07.29.03.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 03:35:06 -0700 (PDT)
From: Maciej Borzecki <maciek@thing.com>
To: meta-arm@lists.yoctoproject.org
Cc: Ross Burton <Ross.Burton@arm.com>,
	Maciej Borzecki <maciek@thing.com>
Subject: [PATCH v2] arm/edk2-firmware: cherry pick gcc 12.x compatibility
 patches
Date: Fri, 29 Jul 2022 12:34:46 +0200
Message-Id: 
 <0a972044b11f7e469f122f3dc7b6778145b60133.1659090751.git.maciek@thing.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 29 Jul 2022 10:35:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3610

Cherry pick gcc 12.x compatibility patches from the upstream.

Signed-off-by: Maciej Borzecki <maciek@thing.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware.inc   |  3 ++
 ...001-Basetools-turn-off-gcc12-warning.patch | 39 +++++++++++++++
 .../0002-BaseTools-fix-gcc12-warning.patch    | 49 +++++++++++++++++++
 .../0003-BaseTools-fix-gcc12-warning.patch    | 47 ++++++++++++++++++
 4 files changed, 138 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/uefi/files/0001-Basetools-turn-off=
-gcc12-warning.patch
 create mode 100644 meta-arm/recipes-bsp/uefi/files/0002-BaseTools-fix-gcc1=
2-warning.patch
 create mode 100644 meta-arm/recipes-bsp/uefi/files/0003-BaseTools-fix-gcc1=
2-warning.patch

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recipes=
-bsp/uefi/edk2-firmware.inc
index e0dfa28b22fca06807cbdc5034618ede3c53a8f2..2219cae76ee79ee23b75b225dd4=
89413f03ed224 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
@@ -19,6 +19,9 @@ SRC_URI =3D "\
     ${EDK2_PLATFORMS_SRC_URI};name=3Dedk2-platforms;destsuffix=3Dedk2/edk2=
-platforms;nobranch=3D1 \
     file://unaligned.patch \
     file://default.patch;patchdir=3Dedk2-platforms \
+    file://0001-Basetools-turn-off-gcc12-warning.patch \
+    file://0002-BaseTools-fix-gcc12-warning.patch \
+    file://0003-BaseTools-fix-gcc12-warning.patch \
 "
=20
 SRCREV_FORMAT         =3D "edk2_edk2-platforms"
diff --git a/meta-arm/recipes-bsp/uefi/files/0001-Basetools-turn-off-gcc12-=
warning.patch b/meta-arm/recipes-bsp/uefi/files/0001-Basetools-turn-off-gcc=
12-warning.patch
new file mode 100644
index 0000000000000000000000000000000000000000..1a530f3d076b0802daaa3b85122=
26e44352c9ceb
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/files/0001-Basetools-turn-off-gcc12-warning=
.patch
@@ -0,0 +1,39 @@
+From 22130dcd98b4d4b76ac8d922adb4a2dbc86fa52c Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Thu, 24 Mar 2022 20:04:36 +0800
+Subject: [PATCH] Basetools: turn off gcc12 warning
+
+In function ?SetDevicePathEndNode?,
+    inlined from ?FileDevicePath? at DevicePathUtilities.c:857:5:
+DevicePathUtilities.c:321:3: error: writing 4 bytes into a region of size =
1 [-Werror=3Dstringop-overflow=3D]
+  321 |   memcpy (Node, &mUefiDevicePathLibEndDevicePath, sizeof (mUefiDev=
icePathLibEndDevicePath));
+      |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~
+In file included from UefiDevicePathLib.h:22,
+                 from DevicePathUtilities.c:16:
+../Include/Protocol/DevicePath.h: In function ?FileDevicePath?:
+../Include/Protocol/DevicePath.h:51:9: note: destination object ?Type? of =
size 1
+   51 |   UINT8 Type;       ///< 0x01 Hardware Device Path.
+      |         ^~~~
+
+Upstream-Status: Backport
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Reviewed-by: Bob Feng <bob.c.feng@intel.com>
+Signed-off-by: Maciej Borzecki <maciek@thing.com>
+---
+ BaseTools/Source/C/DevicePath/GNUmakefile | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/BaseTools/Source/C/DevicePath/GNUmakefile b/BaseTools/Source/=
C/DevicePath/GNUmakefile
+index 7ca08af9662d..b05d2bddfa68 100644
+--- a/BaseTools/Source/C/DevicePath/GNUmakefile
++++ b/BaseTools/Source/C/DevicePath/GNUmakefile
+@@ -13,6 +13,9 @@ OBJECTS =3D DevicePath.o UefiDevicePathLib.o DevicePathF=
romText.o  DevicePathUtili
+ =0D
+ include $(MAKEROOT)/Makefiles/app.makefile=0D
+ =0D
++# gcc 12 trips over device path handling=0D
++BUILD_CFLAGS +=3D -Wno-error=3Dstringop-overflow=0D
++=0D
+ LIBS =3D -lCommon=0D
+ ifeq ($(CYGWIN), CYGWIN)=0D
+   LIBS +=3D -L/lib/e2fsprogs -luuid=0D
diff --git a/meta-arm/recipes-bsp/uefi/files/0002-BaseTools-fix-gcc12-warni=
ng.patch b/meta-arm/recipes-bsp/uefi/files/0002-BaseTools-fix-gcc12-warning=
.patch
new file mode 100644
index 0000000000000000000000000000000000000000..8a095a0c2ea5e59f01360fa2641=
4042f84f0445f
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/files/0002-BaseTools-fix-gcc12-warning.patch
@@ -0,0 +1,49 @@
+From 85021f8cf22d1bd4114803c6c610dea5ef0059f1 Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Thu, 24 Mar 2022 20:04:35 +0800
+Subject: [PATCH] BaseTools: fix gcc12 warning
+
+Sdk/C/LzmaEnc.c: In function ?LzmaEnc_CodeOneMemBlock?:
+Sdk/C/LzmaEnc.c:2828:19: error: storing the address of local variable ?out=
Stream? in ?*p.rc.outStream? [-Werror=3Ddangling-pointer=3D]
+ 2828 |   p->rc.outStream =3D &outStream.vt;
+      |   ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
+Sdk/C/LzmaEnc.c:2811:28: note: ?outStream? declared here
+ 2811 |   CLzmaEnc_SeqOutStreamBuf outStream;
+      |                            ^~~~~~~~~
+Sdk/C/LzmaEnc.c:2811:28: note: ?pp? declared here
+Sdk/C/LzmaEnc.c:2828:19: error: storing the address of local variable ?out=
Stream? in ?*(CLzmaEnc *)pp.rc.outStream? [-Werror=3Ddangling-pointer=3D]
+ 2828 |   p->rc.outStream =3D &outStream.vt;
+      |   ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
+Sdk/C/LzmaEnc.c:2811:28: note: ?outStream? declared here
+ 2811 |   CLzmaEnc_SeqOutStreamBuf outStream;
+      |                            ^~~~~~~~~
+Sdk/C/LzmaEnc.c:2811:28: note: ?pp? declared here
+cc1: all warnings being treated as errors
+
+Upstream-Status: Backport
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Reviewed-by: Bob Feng <bob.c.feng@intel.com>
+Signed-off-by: Maciej Borzecki <maciek@thing.com>
+---
+ BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c b/BaseTools/S=
ource/C/LzmaCompress/Sdk/C/LzmaEnc.c
+index 4e9b499f8d80..4b9f5fa69248 100644
+--- a/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
++++ b/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
+@@ -2825,12 +2825,13 @@ SRes LzmaEnc_CodeOneMemBlock(CLzmaEncHandle pp, Bo=
olInt reInit,
+ =0D
+   nowPos64 =3D p->nowPos64;=0D
+   RangeEnc_Init(&p->rc);=0D
+-  p->rc.outStream =3D &outStream.vt;=0D
+ =0D
+   if (desiredPackSize =3D=3D 0)=0D
+     return SZ_ERROR_OUTPUT_EOF;=0D
+ =0D
++  p->rc.outStream =3D &outStream.vt;=0D
+   res =3D LzmaEnc_CodeOneBlock(p, desiredPackSize, *unpackSize);=0D
++  p->rc.outStream =3D NULL;=0D
+ =0D
+   *unpackSize =3D (UInt32)(p->nowPos64 - nowPos64);=0D
+   *destLen -=3D outStream.rem;=0D
diff --git a/meta-arm/recipes-bsp/uefi/files/0003-BaseTools-fix-gcc12-warni=
ng.patch b/meta-arm/recipes-bsp/uefi/files/0003-BaseTools-fix-gcc12-warning=
.patch
new file mode 100644
index 0000000000000000000000000000000000000000..a9f1ccf2152a00094fe99fd01bc=
fd885d3ca6ba9
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/files/0003-BaseTools-fix-gcc12-warning.patch
@@ -0,0 +1,47 @@
+From 7b005f344e533cd913c3ca05b266f9872df886d1 Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Thu, 24 Mar 2022 20:04:34 +0800
+Subject: [PATCH] BaseTools: fix gcc12 warning
+
+GenFfs.c:545:5: error: pointer ?InFileHandle? used after ?fclose? [-Werror=
=3Duse-after-free]
+  545 |     Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  =
of %s", InFileHandle);
+      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
+GenFfs.c:544:5: note: call to ?fclose? here
+  544 |     fclose (InFileHandle);
+      |     ^~~~~~~~~~~~~~~~~~~~~
+
+Upstream-Status: Backport
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Reviewed-by: Bob Feng <bob.c.feng@intel.com>
+Signed-off-by: Maciej Borzecki <maciek@thing.com>
+---
+ BaseTools/Source/C/GenFfs/GenFfs.c | 2 +-
+ BaseTools/Source/C/GenSec/GenSec.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/BaseTools/Source/C/GenFfs/GenFfs.c b/BaseTools/Source/C/GenFf=
s/GenFfs.c
+index 949025c33325..d78d62ab3689 100644
+--- a/BaseTools/Source/C/GenFfs/GenFfs.c
++++ b/BaseTools/Source/C/GenFfs/GenFfs.c
+@@ -542,7 +542,7 @@ GetAlignmentFromFile(char *InFile, UINT32 *Alignment)
+   PeFileBuffer =3D (UINT8 *) malloc (PeFileSize);=0D
+   if (PeFileBuffer =3D=3D NULL) {=0D
+     fclose (InFileHandle);=0D
+-    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  of %s",=
 InFileHandle);=0D
++    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated for %s",=
 InFile);=0D
+     return EFI_OUT_OF_RESOURCES;=0D
+   }=0D
+   fread (PeFileBuffer, sizeof (UINT8), PeFileSize, InFileHandle);=0D
+diff --git a/BaseTools/Source/C/GenSec/GenSec.c b/BaseTools/Source/C/GenSe=
c/GenSec.c
+index d54a4f9e0a7d..b1d05367ec0b 100644
+--- a/BaseTools/Source/C/GenSec/GenSec.c
++++ b/BaseTools/Source/C/GenSec/GenSec.c
+@@ -1062,7 +1062,7 @@ GetAlignmentFromFile(char *InFile, UINT32 *Alignment)
+   PeFileBuffer =3D (UINT8 *) malloc (PeFileSize);=0D
+   if (PeFileBuffer =3D=3D NULL) {=0D
+     fclose (InFileHandle);=0D
+-    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  of %s",=
 InFileHandle);=0D
++    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated for %s",=
 InFile);=0D
+     return EFI_OUT_OF_RESOURCES;=0D
+   }=0D
+   fread (PeFileBuffer, sizeof (UINT8), PeFileSize, InFileHandle);=0D
--=20
2.37.1


