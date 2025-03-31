Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2AC2C3600B
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 11:05:11 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.49374.1743419104502470191
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 31 Mar 2025 04:05:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=qjGcvQD6;
 spf=pass (domain: linaro.org, ip: 209.85.167.50, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5498d2a8b89so5123094e87.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 31 Mar 2025 04:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743419103; x=1744023903; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EPzOUTfGedtR0lVrGfaYqvuaahnPIYuyDAeVosL1KMI=;
        b=qjGcvQD6SfT+FH+QeSpWpqp5B+CzBaoJdUlsVpHD9REZW/OcTyugTQ5GmxplpsvfOK
         BnsT7QZmv5CylKKKBo/aLpoOkXLVfg/BMnZtmpHmg9Fgj2N/mlNlJ1+hqvj6g5nSdMnS
         RlPZnd2pYy9IelCpsAU35xEEmupcwAY+DyM4+nnha1Q5BdqvwjMI0A9lRc3+IlLtT6OC
         2FjTBmVMDsR7/pSX9hD852LHoWOoQZqUTe9S2EUNXO/Q8VpY2L44e0PgsYuyBDQtCrvW
         KPbrZwIGGggZBMcacoYDPgyCN/29f3H+f6u+paY2ANmD3vT3Wjn+YZS+zjuMWzjpjHvK
         BpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743419103; x=1744023903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EPzOUTfGedtR0lVrGfaYqvuaahnPIYuyDAeVosL1KMI=;
        b=K9rgQ2POhETVq8B8zScGDTGwr8b+j4YaNApwlrjhDksOYcW0FEeQQdOD6dszzcD80u
         aKNtQBs+Tmooirud84XLRrKg7BB9UAVvDAXGqgBCNnTLh7bKPpCOuqzLrGlYIGltinP5
         LYRNfCEN+OIcv3nxmmJBhHoEC7RZiycrzOAxzHz70AKM3Fgp54aSHU2jCVhpBEK7zA6r
         BI2OmjTMB2sO2jSWFkKgD+1Ws0TrSj0+PWqMtJ2syKT79uZb0thl4ViFAuhvncAsdjAk
         1XGAnCXHRed/TEUhRA6MOSCg+CHJu4m8r4VMXaPgUCR9sJsk5U6moZxnvqEiw2/EUSnb
         TueA==
X-Gm-Message-State: AOJu0YyqaHP33jhz1Mte2OLG4C62Z4WQmLk16RkVKV2h2DbJMDBxCLgY
	6JldPIRq1IJsh4yTS340BDnh7reJnCksScqCLP6N9mF+FuNCtb6lvgJULCpuXYEQ8GVbA0ZmkO7
	U5R0=
X-Gm-Gg: ASbGncu91vNR4PjEQSBlngotvZ4vg5aK7u+Q2t0PVLFLrfZsyCD2bl9hNuwlu7UzjP2
	6cnR3Vxj3wSH7PHFIJHzyKd42WxMcsNsaPxAVIFRzir37rbHHn20Rt0diT3ZF1zET9XQMQZyiZZ
	MNL0C1mmklcE+k5z2m9kfi0HcFc7QmOd2dV1MiIPJdLA0DMIwmr8GnPFwBUKZKYK/OUCbvePt9A
	6rb8+7a5z+Rg0n3aXdnFr9XVgz/vdm0EfAsQpqswWYxKHgnHwxm7CXCNv3GiQmBM0AIAK4tq20g
	NhH0KDvW0uzvjVxX3atd2DQjAiza/3mH3yX/erLOAJJNcX3IeBP4RzoVATMhn/67AaC3oslsbXR
	uI9gb4FbXveRGuQthTPt5mg==
X-Google-Smtp-Source: AGHT+IGVLrJatBCirXcGMsgykKLLv+XW9FjqkcgVSa+qYFvBEvO3DKTct+umiwlHUc0EcTwyT9+2mQ==
X-Received: by 2002:a05:6512:12cb:b0:54b:117b:dbef with SMTP id 2adb3069b0e04-54b117bdc79mr2415001e87.54.1743419102535;
        Mon, 31 Mar 2025 04:05:02 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b095a034esm1100018e87.216.2025.03.31.04.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 04:05:02 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] edk2-firmware: fix SOURCE_DATE_EPOCH
Date: Mon, 31 Mar 2025 14:04:46 +0300
Message-ID: <20250331110446.33082-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 31 Mar 2025 11:05:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6424

edk2-firmware build scripts use printenv to print SOURCE_DATE_EPOCH
but that is not in HOSTTOOLS and thus fails. Change to using
environment variable directly to fix builds. I think this is OE
specific build config change and thus not submitted to upstream.

Applying patch in 202411 recipe and not .inc since 202408 recipe
from meta-arm-bsp does not find the patch file from meta-arm
side.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 .../recipes-bsp/uefi/edk2-firmware_202411.bb  |  4 +++
 .../uefi/files/edk2_fix_epoch.patch           | 27 +++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/uefi/files/edk2_fix_epoch.patch

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202411.bb b/meta-arm/r=
ecipes-bsp/uefi/edk2-firmware_202411.bb
index 5892a485..22e72434 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_202411.bb
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_202411.bb
@@ -5,3 +5,7 @@ SRCREV_edk2-platforms ?=3D "2d66a9e048285af8ba4bfe4bdaab37a=
8e98288b3"
 TOOLCHAIN:aarch64 =3D "gcc"
=20
 require recipes-bsp/uefi/edk2-firmware.inc
+
+SRC_URI +=3D "\
+    file://edk2_fix_epoch.patch \
+"
diff --git a/meta-arm/recipes-bsp/uefi/files/edk2_fix_epoch.patch b/meta-ar=
m/recipes-bsp/uefi/files/edk2_fix_epoch.patch
new file mode 100644
index 00000000..278de593
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/files/edk2_fix_epoch.patch
@@ -0,0 +1,27 @@
+edk2-firmware: fix SOURCE_DATE_EPOCH use
+
+printenv host tool is not exposed to recipes so
+just set epoch using SOURCE_DATE_EPOCH which is always
+set. Fixes compile error:
+
+Building ... ../build/tmp_zynqmp-kria-starter-psa/work/zynqmp_kria_starter=
_psa-poky-linux/edk2-firmware/202411/edk2/MdePkg/Library/UefiMemoryAllocati=
onLib/UefiMemoryAllocationLib.inf [AARCH64]
+../build/tmp_zynqmp-kria-starter-psa/work/zynqmp_kria_starter_psa-poky-lin=
ux/edk2-firmware/202411/edk2/EmbeddedPkg/Library/VirtualRealTimeClockLib/Vi=
rtualRealTimeClockLib.c: In function 'LibGetTime':
+<command-line>: error: stray '`' in program
+../build/tmp_zynqmp-kria-starter-psa/work/zynqmp_kria_starter_psa-poky-lin=
ux/edk2-firmware/202411/edk2/EmbeddedPkg/Library/VirtualRealTimeClockLib/Vi=
rtualRealTimeClockLib.c:89:20: note: in expansion of macro 'BUILD_EPOCH'
+   89 |     EpochSeconds =3D BUILD_EPOCH;
+      |                    ^~~~~~~~~~~
+
+Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
+
+Upstream-Status: Inappropriate [OE specific build config fix]
+
+diff --git a/EmbeddedPkg/Library/VirtualRealTimeClockLib/VirtualRealTimeCl=
ockLib.inf b/EmbeddedPkg/Library/VirtualRealTimeClockLib/VirtualRealTimeClo=
ckLib.inf
+index 285e880daa..e1c986a653 100644
+--- a/EmbeddedPkg/Library/VirtualRealTimeClockLib/VirtualRealTimeClockLib.=
inf
++++ b/EmbeddedPkg/Library/VirtualRealTimeClockLib/VirtualRealTimeClockLib.=
inf
+@@ -34,4 +34,4 @@
+ =0D
+ # Current usage of this library expects GCC in a UNIX-like shell environm=
ent with the date command=0D
+ [BuildOptions]=0D
+-  GCC:*_*_*_CC_FLAGS =3D -DBUILD_EPOCH=3D`printenv SOURCE_DATE_EPOCH || d=
ate +%s`=0D
++  GCC:*_*_*_CC_FLAGS =3D -DBUILD_EPOCH=3D${SOURCE_DATE_EPOCH}=0D
--=20
2.43.0


