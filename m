Return-Path: <tomasagustin.gonzalezorlando@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB85FEB64D7
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 15:57:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12165.1687795016177766532
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Jun 2023 08:56:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: tomasagustin.gonzalezorlando@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9F7C2F4;
	Mon, 26 Jun 2023 08:57:39 -0700 (PDT)
Received: from e126979.cambridge.arm.com (e126979.cambridge.arm.com [10.1.38.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 36A0F3F663;
	Mon, 26 Jun 2023 08:56:54 -0700 (PDT)
From: tomasagustin.gonzalezorlando@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	jon.mason@arm.com,
	abdellatif.elkhlifi@arm.com
Cc: nd@arm.com
Subject: [PATCH v2 mickledore 3/4] arm-bsp/documentation: corstone1000: Update change log
Date: Mon, 26 Jun 2023 16:56:30 +0100
Message-Id: <20230626155631.53157-4-tomasagustin.gonzalezorlando@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626155631.53157-1-tomasagustin.gonzalezorlando@arm.com>
References: <20230626155631.53157-1-tomasagustin.gonzalezorlando@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 26 Jun 2023 15:57:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4843

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../documentation/corstone1000/change-log.rst | 74 ++++++++++++++++++-
 1 file changed, 70 insertions(+), 4 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/change-log.rst b/met=
a-arm-bsp/documentation/corstone1000/change-log.rst
index 64e82aac..32d65292 100644
--- a/meta-arm-bsp/documentation/corstone1000/change-log.rst
+++ b/meta-arm-bsp/documentation/corstone1000/change-log.rst
@@ -1,5 +1,5 @@
 ..
- # Copyright (c) 2022, Arm Limited.
+ # Copyright (c) 2022-2023, Arm Limited.
  #
  # SPDX-License-Identifier: MIT
=20
@@ -10,6 +10,72 @@ Change Log
 This document contains a summary of the new features, changes and
 fixes in each release of Corstone-1000 software stack.
=20
+***************
+Version 2023.06
+***************
+
+Changes
+=3D=3D=3D=3D=3D=3D=3D
+
+- GPT support (in TF-M, TF-A, U-boot)
+- Use TF-M BL1 code as the ROM code instead of MCUboot (the next stage b=
ootloader BL2 remains to be MCUboot)
+- Secure Enclave uses CC312 OTP as the provisioning backend in FVP and F=
PGA
+- NVMXIP block storage support in U-Boot
+- Upgrading the SW stack recipes
+- Upgrades for the U-Boot FF-A driver and MM communication
+
+Corstone-1000 components versions
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
++-------------------------------------------+---------------------------=
-----------------+
+| arm-ffa-tee                               | 1.1.2-r0                  =
                 |
++-------------------------------------------+---------------------------=
-----------------+
+| arm-ffa-user                              | 5.0.1-r0                  =
                 |
++-------------------------------------------+---------------------------=
-----------------+
+| corstone1000-external-sys-tests           | 1.0+gitAUTOINC+2945cd92f7-=
r0               |
++-------------------------------------------+---------------------------=
-----------------+
+| external-system                           | 0.1.0+gitAUTOINC+8c9dca74b=
1-r0             |
++-------------------------------------------+---------------------------=
-----------------+
+| linux-yocto                               | 6.1.25+gitAUTOINC+36901b5b=
29_581dc1aa2f-r0 |
++-------------------------------------------+---------------------------=
-----------------+
+| u-boot                                    | 2023.01-r0                =
                 |
++-------------------------------------------+---------------------------=
-----------------+
+| optee-client                              | 3.18.0-r0                 =
                 |
++-------------------------------------------+---------------------------=
-----------------+
+| optee-os                                  | 3.20.0-r0                 =
                 |
++-------------------------------------------+---------------------------=
-----------------+
+| trusted-firmware-a                        | 2.8.0-r0                  =
                 |
++-------------------------------------------+---------------------------=
-----------------+
+| trusted-firmware-m                        | 1.7.0-r0                  =
                 |
++-------------------------------------------+---------------------------=
-----------------+
+| ts-newlib                                 | 4.1.0-r0                  =
                 |
++-------------------------------------------+---------------------------=
-----------------+
+| ts-psa-{crypto, iat, its. ps}-api-test    | 38cb53a4d9                =
                 |
++-------------------------------------------+---------------------------=
-----------------+
+| ts-sp-{se-proxy, smm-gateway}             | 08b3d39471                =
                 |
++-------------------------------------------+---------------------------=
-----------------+
+
+Yocto distribution components versions
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
++-------------------------------------------+---------------------------=
-----+
+| meta-arm                                  | mickledore                =
     |
++-------------------------------------------+---------------------------=
-----+
+| poky                                      | mickledore                =
     |
++-------------------------------------------+---------------------------=
-----+
+| meta-openembedded                         | mickledore                =
     |
++-------------------------------------------+---------------------------=
-----+
+| busybox                                   | 1.36.0-r0                 =
     |
++-------------------------------------------+---------------------------=
-----+
+| musl                                      | 1.2.3+gitAUTOINC+7d756e1c0=
4-r0 |
++-------------------------------------------+---------------------------=
-----+
+| gcc-arm-none-eabi-native                  | 11.2-2022.02              =
     |
++-------------------------------------------+---------------------------=
-----+
+| gcc-cross-aarch64                         | 12.2.rel1-r0              =
     |
++-------------------------------------------+---------------------------=
-----+
+| openssl                                   | 3.1.0-r0                  =
     |
++-------------------------------------------+---------------------------=
-----+
+
 ******************
 Version 2022.11.23
 ******************
@@ -25,7 +91,7 @@ Changes
 - Upgrades for the U-Boot FF-A driver and MM communication
=20
 Corstone-1000 components versions
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 +-------------------------------------------+------------+
 | arm-ffa-tee                               | 1.1.1      |
@@ -56,7 +122,7 @@ Corstone-1000 components versions
 +-------------------------------------------+------------+
=20
 Yocto distribution components versions
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 +-------------------------------------------+---------------------+
 | meta-arm                                  | langdale            |
@@ -161,4 +227,4 @@ Changes
=20
 --------------
=20
-*Copyright (c) 2022, Arm Limited. All rights reserved.*
+*Copyright (c) 2022-2023, Arm Limited. All rights reserved.*
--=20
2.25.1


