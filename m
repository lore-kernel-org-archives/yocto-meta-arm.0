Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D33AC433EF
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 16:30:38 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.370.1652459437174033474
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 May 2022 09:30:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=niJaf0JN;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id iq10so8548897pjb.0
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 May 2022 09:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8aSJSXcANlUB638XlzDXw1ffJH77xw0LOol8vDfj/20=;
        b=niJaf0JN263gsLjUUBd2OWb9vwWcQNzGY0YS4P+6KFpx809k3LHc1NqaQ7gzr/PiiY
         ULijv0ErO3EYOTB8zLGakGpOs4wbzDWTXJM77q5IwWagUmetH+qPZKcwf+6lnuvPFe1A
         022z3VAbQnrO7Dwm42GQKnIwO1jWap70sisTyCN1FQ+N3xUmoPvN3xaZ413EcWqSYinZ
         Vt0YRGND3O8n5Q6IXxW/dhGepTYUR1I1J15wX+5j0BdtxZPajcVJICkiFByN7uwpKjFX
         I9Zko46BBh/tftw6KFsXL8KbdmAxMaOtpL2QadxrEhXMjFnsasG4Ejxh0dy9PN1QWnaH
         FS0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8aSJSXcANlUB638XlzDXw1ffJH77xw0LOol8vDfj/20=;
        b=Kb9O7Ch5a1aNVDJrUJNI3TWA6PMLwycdzslVv8QtuvL5kfR22US5X5WqYyAb5SXxhn
         fCy7YFgK0Xbqh3lzjkVl2KFRYJGRpvzQc2uKl7UC+bh7mG3XP1VOL04P91nXQZxR5AWC
         JDuaqt2HbZZRtItM771Ilg/h7+J2Jmmdd4B6jaCBU4DH2CuXlUuSnEDZN8hXs7i9CKr6
         YYHqvR/j//Od8uQWTbBN+J5odlbSbYt3+cYS+v0BAsreHbfP7Bws7uSXfY4BNjmG0SMJ
         HtHMMdlAwkRj55Bv10WCcuG4d7fVI+AMUsMGCrosCMEjhtl+iE8gNZ5FRJEZdWBUtb4L
         wiig==
X-Gm-Message-State: AOAM530mD2gJnwxOZ92RxzRbIfHVpVVoVFxpgHThZmLfv6cXs8QqgIkM
	lb21Gxhdj2Ij/I2wGI0tsK1At0aOLU1y3g==
X-Google-Smtp-Source: 
 ABdhPJzCeSRhaGnGIB9UB83gLMdi6a4DlN3Grn0dM3XUKmEdaC/oCfVgCU/vMpeMr/+ehMEl5HrbWg==
X-Received: by 2002:a17:90b:1a8a:b0:1dc:ea29:f6a9 with SMTP id
 ng10-20020a17090b1a8a00b001dcea29f6a9mr17256053pjb.108.1652459435894;
        Fri, 13 May 2022 09:30:35 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 2-20020a170902c10200b0015e8d4eb2absm2030693pli.245.2022.05.13.09.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 09:30:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] sbsa-acs: Fix build with gcc12
Date: Fri, 13 May 2022 09:30:32 -0700
Message-Id: <20220513163032.586208-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 13 May 2022 16:30:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3402

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-BaseTools-fix-gcc12-warning-1.patch  | 51 +++++++++++++++++++
 .../0001-BaseTools-fix-gcc12-warning.patch    | 42 +++++++++++++++
 meta-arm/recipes-bsp/uefi/sbsa-acs_3.1.bb     |  6 +++
 3 files changed, 99 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/uefi/sbsa-acs/0001-BaseTools-fix-g=
cc12-warning-1.patch
 create mode 100644 meta-arm/recipes-bsp/uefi/sbsa-acs/0001-BaseTools-fix-g=
cc12-warning.patch

diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-BaseTools-fix-gcc12-wa=
rning-1.patch b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-BaseTools-fix-gcc12=
-warning-1.patch
new file mode 100644
index 0000000..23366b4
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-BaseTools-fix-gcc12-warning-1=
.patch
@@ -0,0 +1,51 @@
+From b0a0b7b605aeb8106e7b50d1efeb746f401498cc Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/85021f=
8cf22d1bd4114803c6c610dea5ef0059f1]
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Reviewed-by: Bob Feng <bob.c.feng@intel.com>
+---
+ BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c b/BaseTools/S=
ource/C/LzmaCompress/Sdk/C/LzmaEnc.c
+index 4e9b499f8d..4b9f5fa692 100644
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
+--=20
+2.36.1
+
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-BaseTools-fix-gcc12-wa=
rning.patch b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-BaseTools-fix-gcc12-w=
arning.patch
new file mode 100644
index 0000000..ebdc78b
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-BaseTools-fix-gcc12-warning.p=
atch
@@ -0,0 +1,42 @@
+From 2435c17e56652479315853cec5b91fb0ea0911a3 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/7b005f=
344e533cd913c3ca05b266f9872df886d1]
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Reviewed-by: Bob Feng <bob.c.feng@intel.com>
+---
+ BaseTools/Source/C/GenFfs/GenFfs.c | 2 +-
+ BaseTools/Source/C/GenSec/GenSec.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+--- a/BaseTools/Source/C/GenFfs/GenFfs.c
++++ b/BaseTools/Source/C/GenFfs/GenFfs.c
+@@ -542,7 +542,7 @@ GetAlignmentFromFile(char *InFile, UINT3
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
+--- a/BaseTools/Source/C/GenSec/GenSec.c
++++ b/BaseTools/Source/C/GenSec/GenSec.c
+@@ -1062,7 +1062,7 @@ GetAlignmentFromFile(char *InFile, UINT3
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
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs_3.1.bb b/meta-arm/recipes-b=
sp/uefi/sbsa-acs_3.1.bb
index 5eb6767..a1e896b 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs_3.1.bb
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs_3.1.bb
@@ -8,11 +8,17 @@ SRC_URI +=3D "git://github.com/ARM-software/sbsa-acs;dest=
suffix=3Dedk2/ShellPkg/Appl
             git://github.com/tianocore/edk2-libc;destsuffix=3Dedk2/edk2-li=
bc;protocol=3Dhttps;branch=3Dmaster;name=3Dlibc \
             file://shell.patch \
             file://use_bfd_linker.patch \
+            file://0001-BaseTools-fix-gcc12-warning.patch \
+            file://0001-BaseTools-fix-gcc12-warning-1.patch \
             "
=20
 SRCREV_acs =3D "ec02a7736ae5714326507c60595f4d5299e3dec8"
 SRCREV_libc =3D "61687168fe02ac4d933a36c9145fdd242ac424d1"
=20
+# GCC12 trips on it
+#see https://src.fedoraproject.org/rpms/edk2/blob/rawhide/f/0032-Basetools=
-turn-off-gcc12-warning.patch
+BUILD_CFLAGS +=3D "-Wno-error=3Dstringop-overflow"
+
 COMPATIBLE_HOST =3D "aarch64.*-linux"
 COMPATIBLE_MACHINE =3D ""
 PACKAGE_ARCH =3D "${TUNE_PKGARCH}"
--=20
2.36.1


