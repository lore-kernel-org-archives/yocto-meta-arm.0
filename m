Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD62BC61DF4
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 12:55:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.134828.1700830535027635285
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 24 Nov 2023 04:55:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 188A21FB;
	Fri, 24 Nov 2023 04:56:21 -0800 (PST)
Received: from e130802.arm.com (unknown [10.57.83.243])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE2903F6C4;
	Fri, 24 Nov 2023 04:55:33 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH v2 2/4] arm-bsp/documentation: corstone1000: update the change log
Date: Fri, 24 Nov 2023 12:55:11 +0000
Message-Id: <20231124125513.358963-2-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231124125513.358963-1-abdellatif.elkhlifi@arm.com>
References: <20231124125513.358963-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 24 Nov 2023 12:55:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5272

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

align the change log with the upcoming CORSTONE1000-2023.11 release

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../documentation/corstone1000/change-log.rst | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/meta-arm-bsp/documentation/corstone1000/change-log.rst b/met=
a-arm-bsp/documentation/corstone1000/change-log.rst
index 32d65292..173823b6 100644
--- a/meta-arm-bsp/documentation/corstone1000/change-log.rst
+++ b/meta-arm-bsp/documentation/corstone1000/change-log.rst
@@ -10,6 +10,77 @@ Change Log
 This document contains a summary of the new features, changes and
 fixes in each release of Corstone-1000 software stack.
=20
+***************
+Version 2023.11
+***************
+
+Changes
+=3D=3D=3D=3D=3D=3D=3D
+
+- Making Corstone-1000  SystemReady IR 2.0 certifiable
+- Allow booting Debian & OpenSUSE on FVP
+- Add support for two MMC cards for the FVP
+- Add signed capsule update support
+- Enable on-disk capsule update
+- Add the feature of purging specific DT nodes in U-Boot before Linux
+- Add Ethernet over VirtIO support in U-Boot
+- Add support for unaligned MMC card images
+- Reducing the out-of-tree patches by upstreaming them to the correspond=
ing open-source projects
+- SW components upgrades
+- Bug fixes
+
+Corstone-1000 components versions
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
++-------------------------------------------+---------------------------=
--------------------------+
+| arm-ffa-tee                               |                   1.1.2-r0=
                          |
++-------------------------------------------+---------------------------=
--------------------------+
+| linux-yocto                               |                   6.5.7   =
                          |
++-------------------------------------------+---------------------------=
--------------------------+
+| u-boot                                    |                   2023.07 =
                          |
++-------------------------------------------+---------------------------=
--------------------------+
+| external-system                           |    0.1.0+gitAUTOINC+8c9dca=
74b1-r0                   |
++-------------------------------------------+---------------------------=
--------------------------+
+| optee-client                              |                   3.22.0  =
                          |
++-------------------------------------------+---------------------------=
--------------------------+
+| optee-os                                  |                   3.22.0  =
                          |
++-------------------------------------------+---------------------------=
--------------------------+
+| trusted-firmware-a                        |                   2.9.0   =
                          |
++-------------------------------------------+---------------------------=
--------------------------+
+| trusted-firmware-m                        |                   1.8.1   =
                          |
++-------------------------------------------+---------------------------=
--------------------------+
+| libts                                     |                       08b3=
d39471                    |
++-------------------------------------------+---------------------------=
--------------------------+
+| ts-newlib                                 |                   4.1.0   =
                          |
++-------------------------------------------+---------------------------=
--------------------------+
+| ts-psa-{crypto, iat, its. ps}-api-test    |                   38cb53a4=
d9                        |
++-------------------------------------------+---------------------------=
--------------------------+
+| ts-sp-{se-proxy, smm-gateway}             |                   08b3d394=
71                        |
++-------------------------------------------+---------------------------=
--------------------------+
+
+Yocto distribution components versions
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
++-------------------------------------------+---------------------------=
---+
+| meta-arm                                  | nanbield                  =
   |
++-------------------------------------------+---------------------------=
---+
+| poky                                      | nanbield                  =
   |
++-------------------------------------------+---------------------------=
---+
+| meta-openembedded                         | nanbield                  =
   |
++-------------------------------------------+---------------------------=
---+
+| meta-secure-core                          | nanbield                  =
   |
++-------------------------------------------+---------------------------=
---+
+| busybox                                   |                   1.36.1  =
   |
++-------------------------------------------+---------------------------=
---+
+| musl                                      |                   1.2.4   =
   |
++-------------------------------------------+---------------------------=
---+
+| gcc-arm-none-eabi                         |          11.2-2022.02     =
   |
++-------------------------------------------+---------------------------=
---+
+| gcc-cross-aarch64                         |                   13.2.0  =
   |
++-------------------------------------------+---------------------------=
---+
+| openssl                                   |                   3.1.3   =
   |
++-------------------------------------------+---------------------------=
---+
+
 ***************
 Version 2023.06
 ***************
--=20
2.25.1


