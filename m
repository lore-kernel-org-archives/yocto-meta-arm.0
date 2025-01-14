Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B46E77188
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 09:42:34 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.40833.1736847750599282745
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jan 2025 01:42:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=X1aHV9KR;
 spf=pass (domain: linaro.org, ip: 209.85.167.51, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53e389d8dc7so5188212e87.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jan 2025 01:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736847749; x=1737452549; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pLpiNyrN3qqJ7PxeuqVwJQx1MiBzqYFgb6RvKcLdhHU=;
        b=X1aHV9KRBCV+PHYS4DSPz5yHPcdtNTKTTk2V64JIosZH6btgxcNcwL5V2pUez1Lfrc
         tz5MdELqcL5vZydimcMatUzvKoY63P47f/16SxOUIgdbZ7XMeEsVEGzQULXu6Yceg0Hu
         fNF2BNWBBnTgMkcrKniWqpDfMnF7VU0fHTnao/W41M593lAlhj0hAghBHxASdAivrpiA
         RD1jbnCE+TU19X/LglpShNEIqZd0QzUYBMFClHW3T2ZJ6G04cUfs3lfKJsTxNbcf0exY
         mTYyT7aIP4C9dlS0KzgLLTw8bXbjAwqVtIV/xt1iYxny688IQ3FWnBtcBqaal86pnPw1
         Brww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736847749; x=1737452549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pLpiNyrN3qqJ7PxeuqVwJQx1MiBzqYFgb6RvKcLdhHU=;
        b=jk1RWHNPDkg3JqOK45ud16wRorjvXfgdvFg9qIkPtTP02JMQjDKe9YeXxi7CY6gABd
         qNrwsl4mmj1pJkrD1f8vce1HRaxecxbsiY0XMozWNDZT0NaWINF43NivkTZaxANGCgHT
         N63GfRb5AexaIT4r/MWSDZBPkFTyB5U1Qp3VOIimW0uw7GKfjNAdJx3mEqf8m20uEFoo
         deoc8ChEx9Vj3ms0WOFKpO38QxXQS2gYLdQ82H16fetfmKwIXFjt9M0LjkOxO5fNdLBk
         OG5i54N6q+bRDmBFduFMt5RFS9jeSqPoCnE1Msk/lUoZTDKq5rJmYxXg83XhhO9ZHet9
         VeNA==
X-Gm-Message-State: AOJu0YzQ/NnWB8oOPhotdUXPrMCFLS0BDZHQw7CXRec1RYwwOCJkHXot
	AmhEzGkEifoE+SfCBjT+hnT/x20zVqUkqoQQ5kLH5jctv5ERGvHC4fTOuYocqpi40pGhW64XDBT
	Q
X-Gm-Gg: ASbGncsEuKZz8sVdg4kz80g4vPl62GxvPsFh8unnv39mu9rBuiVci8dwMamBBAI/qpI
	CyGFH4iAhAEy5Is3qXxvxuiP7bAFqgmSgnHg2ZufdqCPGoqxjuqpXitpqib9S7/tQQtvv43GARD
	Nck/7G4Oo1n6rBKLKp02xGEJGP1+Y7LfZJxrWk9ZsTfEfLB2SdneaGjBwHHleFu+xnY13pRtfz6
	xgPgYAc9zURqNB3rybPK6yV4SbOFmvZC8D0T5xY4PT6SESYwyLn80NAfmPZdjiATSvnvSEOQ3Sn
	BZ1G61LINoJnWZxT9ZfeMoH7iA==
X-Google-Smtp-Source: AGHT+IGsuZHMh2imTbZCoKtfbcdq/rv57o+48ZW+NpCfw/LtLJSzeQY7/aYfW1mvcemKNIs7r9gAXg==
X-Received: by 2002:a05:6512:3e28:b0:53e:395c:688e with SMTP id 2adb3069b0e04-542845b18c2mr7827962e87.10.1736847748633;
        Tue, 14 Jan 2025 01:42:28 -0800 (PST)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be49ee9sm1608739e87.52.2025.01.14.01.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 01:42:26 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] edk2-firmware: fix PlatformStandaloneMmRpmb.dsc build
Date: Tue, 14 Jan 2025 11:41:54 +0200
Message-ID: <20250114094154.304900-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Jan 2025 09:42:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6321

With backported patch from upstream. Error was:

| build.py...
| /home/builder/src/base/repo/build/tmp_rockpi4b/work/rockpi4b-poky-linux/e=
dk2-firmware/202408/edk2/edk2-platforms/Platform/StandaloneMm/PlatformS
tandaloneMmPkg/PlatformStandaloneMmRpmb.dsc(...): error 4000: Instance of l=
ibrary class [HobPrintLib] is not found
|       in [/home/builder/src/base/repo/build/tmp_rockpi4b/work/rockpi4b-po=
ky-linux/edk2-firmware/202408/edk2/StandaloneMmPkg/Core/StandaloneMmCor
e.inf] [AARCH64]
|       consumed by module [/home/builder/src/base/repo/build/tmp_rockpi4b/=
work/rockpi4b-poky-linux/edk2-firmware/202408/edk2/StandaloneMmPkg/Core
/StandaloneMmCore.inf]

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware.inc   |  1 +
 .../0001-Platform-StMmRpmb-Fix-build.patch    | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/uefi/files/0001-Platform-StMmRpmb-=
Fix-build.patch

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recipes=
-bsp/uefi/edk2-firmware.inc
index 42668d9d..c10154aa 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
@@ -20,6 +20,7 @@ SRCBRANCH_edk2_platforms =3D "master"
 SRC_URI =3D "\
     ${SRC_URI_EDK2};branch=3D${SRCBRANCH_edk2_platforms};name=3Dedk2;dests=
uffix=3Dedk2 \
     ${SRC_URI_EDK2_PLATFORMS};branch=3D${SRCBRANCH_edk2};name=3Dedk2-platf=
orms;destsuffix=3Dedk2/edk2-platforms \
+    file://0001-Platform-StMmRpmb-Fix-build.patch;patchdir=3Dedk2-platform=
s \
 "
=20
 SRCREV_FORMAT         =3D "edk2_edk2-platforms"
diff --git a/meta-arm/recipes-bsp/uefi/files/0001-Platform-StMmRpmb-Fix-bui=
ld.patch b/meta-arm/recipes-bsp/uefi/files/0001-Platform-StMmRpmb-Fix-build=
.patch
new file mode 100644
index 00000000..234ccf34
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/files/0001-Platform-StMmRpmb-Fix-build.patch
@@ -0,0 +1,38 @@
+From ee185eda7b7ec9a0c82827fea197fbb73d971f93 Mon Sep 17 00:00:00 2001
+From: Ard Biesheuvel <ardb@kernel.org>
+Date: Thu, 29 Aug 2024 21:21:50 +0200
+Subject: [PATCH] Platform/StMmRpmb: Fix build
+
+Add some missing library class resolutions relating to changes in the
+core upstream EDK2 repo.
+
+Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
+Reviewed-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
+---
+ .../PlatformStandaloneMmPkg/PlatformStandaloneMmRpmb.dsc       | 3 +++
+ 1 file changed, 3 insertions(+)
+
+Upstream-Status: Backport
+
+diff --git a/Platform/StandaloneMm/PlatformStandaloneMmPkg/PlatformStandal=
oneMmRpmb.dsc b/Platform/StandaloneMm/PlatformStandaloneMmPkg/PlatformStand=
aloneMmRpmb.dsc
+index 653029c52f..54c7a63b41 100644
+--- a/Platform/StandaloneMm/PlatformStandaloneMmPkg/PlatformStandaloneMmRp=
mb.dsc
++++ b/Platform/StandaloneMm/PlatformStandaloneMmPkg/PlatformStandaloneMmRp=
mb.dsc
+@@ -41,11 +41,14 @@
+   ExtractGuidedSectionLib|EmbeddedPkg/Library/PrePiExtractGuidedSectionLi=
b/PrePiExtractGuidedSectionLib.inf=0D
+   FvLib|StandaloneMmPkg/Library/FvLib/FvLib.inf=0D
+   HobLib|StandaloneMmPkg/Library/StandaloneMmCoreHobLib/StandaloneMmCoreH=
obLib.inf=0D
++  HobPrintLib|MdeModulePkg/Library/HobPrintLib/HobPrintLib.inf=0D
++  ImagePropertiesRecordLib|MdeModulePkg/Library/ImagePropertiesRecordLib/=
ImagePropertiesRecordLib.inf=0D
+   IoLib|MdePkg/Library/BaseIoLibIntrinsic/BaseIoLibIntrinsic.inf=0D
+   NULL|MdePkg/Library/BaseStackCheckLib/BaseStackCheckLib.inf=0D
+   MemLib|StandaloneMmPkg/Library/StandaloneMmMemLib/StandaloneMmMemLib.in=
f=0D
+   MemoryAllocationLib|StandaloneMmPkg/Library/StandaloneMmCoreMemoryAlloc=
ationLib/StandaloneMmCoreMemoryAllocationLib.inf=0D
+   PcdLib|MdePkg/Library/BasePcdLibNull/BasePcdLibNull.inf=0D
++  PeCoffGetEntryPointLib|MdePkg/Library/BasePeCoffGetEntryPointLib/BasePe=
CoffGetEntryPointLib.inf=0D
+   PeCoffLib|MdePkg/Library/BasePeCoffLib/BasePeCoffLib.inf=0D
+   PrintLib|MdePkg/Library/BasePrintLib/BasePrintLib.inf=0D
+   VariablePolicyLib|MdeModulePkg/Library/VariablePolicyLib/VariablePolicy=
Lib.inf=0D
+--=20
+2.43.0
+
--=20
2.43.0


