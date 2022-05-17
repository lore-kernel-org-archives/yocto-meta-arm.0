Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E2FC433F5
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 01:46:28 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.2165.1652751978605871970
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 16 May 2022 18:46:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gEMuXNou;
 spf=pass (domain: gmail.com, ip: 209.85.210.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id k16so8847450pff.5
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 16 May 2022 18:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=il/3SUzObbvYTs1J/Qo1QWLdK6o4ToW1Q+TSyuMMch0=;
        b=gEMuXNouwWgV33SvCyEmhRT+kh6fmu2my+RSG5fJCrrese2c60xy/+i/Sx6YYeRXB5
         D6zh1g6Wv5V3+B/fzPIeI/XQQW1Om3ETEYU+ZNn2GPUZzD2y4x/OtGHM8xMt5hZFsM3/
         J6GvCpWnBOS13YrDKgSIBYlv50hFcZDixmgKjSMju/Xe1ZdC1yVIA8XdraCYhpaV1/Rd
         K2cC8XiVCYow/F0F5/EWbCkPgNX5EODir/anKOwkBVNJmlwvQFPJyXJv9UGMAKFtCAkQ
         NvDvDmwkQm0OiAp0uxDrw7iKVDs7kRvh0IcFX4OaExrWYG4MMwz+jqjGRK/ml1NRVEwa
         gpFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=il/3SUzObbvYTs1J/Qo1QWLdK6o4ToW1Q+TSyuMMch0=;
        b=p3mngphezqJ89DQZI+7tylRa6O+vPbTWY0oRaZk32wh+ZIoFS0DsJtseqpum+dhAGL
         ugaD1bWLxvBmPUUiFIs96j/HnY4M3Wf90qQy4YaOJM9+kBiC86hL3ZftrxGes6agxkqF
         ZSErSP/o9OIUvLx61EBObXFNanEfUsHtC9eDaSN0oVkkWLfyeq86BfG/L1jvQmGx4+va
         tnuTqgx6dwT8XUPgoRKNafsMRFoWRM/TzHjvm0purWM+Bf6EPZKW8+LsMcg+C0BOEE54
         rrFerjq5MuRSUfhf3NTJnQeB0fccNFq7qAgrXavYU8dp1ShrgKZTBJ+C5NLE4YBrZwFf
         u7zQ==
X-Gm-Message-State: AOAM533wHQPK3SGVQ+softTC5C/D31+woirpHJsfQWhjXZIiWKMhtYrz
	q8sAWkjefPeMk7iIG4OErqQGylV4YCJGFw==
X-Google-Smtp-Source: 
 ABdhPJyzg2mBYKl3+QE5WjiI3fY4go1/QS3xmbTTtBhxRLLNTybJUiB5ECOk0EQZiz+RFJdaScL3kw==
X-Received: by 2002:a63:ec53:0:b0:3db:822d:1e49 with SMTP id
 r19-20020a63ec53000000b003db822d1e49mr17311979pgj.134.1652751977728;
        Mon, 16 May 2022 18:46:17 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 u16-20020a62d450000000b0050dc762814fsm7480222pfl.41.2022.05.16.18.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 18:46:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] sbsa-acs: Refresh GCC 12 patches
Date: Mon, 16 May 2022 18:46:14 -0700
Message-Id: <20220517014614.148223-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 May 2022 01:46:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3412

Current patches do not apply cleanly.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-BaseTools-fix-gcc12-warning-1.patch  | 35 ++++++++-----------
 .../0001-BaseTools-fix-gcc12-warning.patch    | 32 ++++++++---------
 2 files changed, 31 insertions(+), 36 deletions(-)

diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-BaseTools-fix-gcc12-wa=
rning-1.patch b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-BaseTools-fix-gcc12=
-warning-1.patch
index 565ba11..175dfa7 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-BaseTools-fix-gcc12-warning-1=
.patch
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-BaseTools-fix-gcc12-warning-1=
.patch
@@ -27,25 +27,20 @@ Reviewed-by: Bob Feng <bob.c.feng@intel.com>
  BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
=20
-diff --git a/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c b/BaseTools/S=
ource/C/LzmaCompress/Sdk/C/LzmaEnc.c
-index 4e9b499f8d..4b9f5fa692 100644
 --- a/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
 +++ b/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
-@@ -2825,12 +2825,13 @@ SRes LzmaEnc_CodeOneMemBlock(CLzmaEncHandle pp, Bo=
olInt reInit,
-=20
-   nowPos64 =3D p->nowPos64;
-   RangeEnc_Init(&p->rc);
--  p->rc.outStream =3D &outStream.vt;
-=20
-   if (desiredPackSize =3D=3D 0)
-     return SZ_ERROR_OUTPUT_EOF;
-=20
-+  p->rc.outStream =3D &outStream.vt;
-   res =3D LzmaEnc_CodeOneBlock(p, desiredPackSize, *unpackSize);
-+  p->rc.outStream =3D NULL;
-=20
-   *unpackSize =3D (UInt32)(p->nowPos64 - nowPos64);
-   *destLen -=3D outStream.rem;
---=20
-2.36.1
-
+@@ -2825,12 +2825,13 @@ SRes LzmaEnc_CodeOneMemBlock(CLzmaEncHan
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
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-BaseTools-fix-gcc12-wa=
rning.patch b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-BaseTools-fix-gcc12-w=
arning.patch
index f2142de..ebdc78b 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-BaseTools-fix-gcc12-warning.p=
atch
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-BaseTools-fix-gcc12-warning.p=
atch
@@ -21,22 +21,22 @@ Reviewed-by: Bob Feng <bob.c.feng@intel.com>
 --- a/BaseTools/Source/C/GenFfs/GenFfs.c
 +++ b/BaseTools/Source/C/GenFfs/GenFfs.c
 @@ -542,7 +542,7 @@ GetAlignmentFromFile(char *InFile, UINT3
-   PeFileBuffer =3D (UINT8 *) malloc (PeFileSize);
-   if (PeFileBuffer =3D=3D NULL) {
-     fclose (InFileHandle);
--    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  of %s",=
 InFileHandle);
-+    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated for %s",=
 InFile);
-     return EFI_OUT_OF_RESOURCES;
-   }
-   fread (PeFileBuffer, sizeof (UINT8), PeFileSize, InFileHandle);
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
 --- a/BaseTools/Source/C/GenSec/GenSec.c
 +++ b/BaseTools/Source/C/GenSec/GenSec.c
 @@ -1062,7 +1062,7 @@ GetAlignmentFromFile(char *InFile, UINT3
-   PeFileBuffer =3D (UINT8 *) malloc (PeFileSize);
-   if (PeFileBuffer =3D=3D NULL) {
-     fclose (InFileHandle);
--    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  of %s",=
 InFileHandle);
-+    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated for %s",=
 InFile);
-     return EFI_OUT_OF_RESOURCES;
-   }
-   fread (PeFileBuffer, sizeof (UINT8), PeFileSize, InFileHandle);
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
2.36.1


