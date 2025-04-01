Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E767FC36014
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 08:25:50 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.14114.1743495948241907807
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Apr 2025 01:25:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ZdzjklgG;
 spf=pass (domain: linaro.org, ip: 209.85.167.42, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5499c5d9691so5579062e87.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 01 Apr 2025 01:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743495946; x=1744100746; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k3sfsUNDzK9hbKsgFW4A2OEe0snd99/GtqU4zbUO1GQ=;
        b=ZdzjklgGHAyJ1LVakOniOQs+hqRUxtR/E/uYnV7WMFP4aEzFJjfk6p8MkEiDIfCPF6
         fucBhAE7RK1mz2RMGHt2SMTW7kroEoOqHokvQBcSDTG5v1BIrPucdTmCmpHM6dBgzd9z
         CP8U48T058+VhlccUQeYj7NbYFuzb/nimx8Vbpy9v/1lyPxfazIT6zhrPg2gTw6oT1SU
         eVmt/1uOXNVy9l2aRYggtwuIhCEVMeWh/r9JHnwsdAstVreMoCWVyqglPz1xWjyCVQ5/
         1fPCfEY/ux9QyVvEXJ72YmTT74fvbuwfDkdWC2JQITZRNGQk1rWT+NyXx03sv01xf8/0
         DDvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743495946; x=1744100746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k3sfsUNDzK9hbKsgFW4A2OEe0snd99/GtqU4zbUO1GQ=;
        b=mEBlPD/95OJrS4sB5TTZgGhfrDG7K8UAfhRYnuU4RBjp19xfF7qiVRMoxTAmJFCvcG
         /c6VhNA+4p0yFmlFoSlChan+bMDFWDr9DTq8B5wfmoXPZatuzwtp04+EZ7y3UDlKqzef
         k7i0lJNh6KvV6Ds2MWV7z+0YFSNVl88MqcOVc9FBFO01HBnpVTICmL2DyRaZ9cMPaHR9
         CHRexK9bsFR/nMj2CqaA9/hDPhfgkHhdHeaT7F7CH1MBmh20aFtsImT68qj0YDHwLWpl
         KctoUlHirErAybweG+H1mvHYDNzOj5iiFNPWYs7ZOWhBr1CFm4A7EPCqsYaEc6Y1vYdD
         PEzA==
X-Gm-Message-State: AOJu0YyQ6PJujoTz1pf+qzl8EdN7PvOdzFtMdRQdM7VpDniaOTIaDcmB
	po1Lzw8lYB2XeFHba+/6YPgoQTDnBh+H8gk13UM8GloSGbSIG2klvJlYFkmGjb+6Pg2hAHS4e8b
	0dgw=
X-Gm-Gg: ASbGncuKmq8hn0G1tMGrdtDkN3iJQp65ZfClYy1YUgynPBCeAJy3wKPwZn0nicJD1Bl
	9636hhrTlVsRMBYCS9coIcuXkmVHNGoucViaF1zPnK9/mCGfA8ZnhgAb/KZTryA6qRgFILb11Xt
	Q/KqEB8HcTQMAuub0Oj6cFZ6fPpHjSRwuSSkGtQn84C2K9BccGC8ZHtsf9n6H028RzNYkR7af6J
	HEeKSyCfWVO8ujeHOTgS/HfOtSmmomf8Bpo/n4fjxqknz/NgqAmLCfVxMO/yujWMk150rtdJ7RS
	rcr2O/AgTAJG7YZ/h2tKawm2RMGChGMJXWXWQNhpjGW/3VVjYWcjfysXmw+aU2rDaabIqNhRX5v
	v+X9JZVBvKYA8m+QRrCdAcg==
X-Google-Smtp-Source: AGHT+IH/5vWqLchKtRe29+kd3ij+e36ICsxXsn6H4778+oDdVzevfOyD6o62lPEC/0R1Mz8J4fuvsw==
X-Received: by 2002:a05:6512:2c8e:b0:54b:117b:dbf2 with SMTP id 2adb3069b0e04-54b117bdc84mr3176214e87.57.1743495946039;
        Tue, 01 Apr 2025 01:25:46 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b0957fbc8sm1316013e87.123.2025.04.01.01.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 01:25:45 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2] edk2-firmware: fix SOURCE_DATE_EPOCH
Date: Tue,  1 Apr 2025 11:25:25 +0300
Message-ID: <20250401082525.94287-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 01 Apr 2025 08:25:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6425

edk2-firmware build scripts use printenv to print SOURCE_DATE_EPOCH
but that is not in HOSTTOOLS and thus fails with configurations
which use VirtualRealTimeClockLib. Change to using SOURCE_DATE_EPOCH
environment variable directly to fix builds. I think this is OE
specific build config change but filed a bug report upstream
https://github.com/tianocore/edk2/issues/10910
since the fallback mechanism is not working.

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
index 00000000..4b4e04ae
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
+Upstream-Status: Inappropriate [OE specific build config fix, though filed=
 as https://github.com/tianocore/edk2/issues/10910]
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


