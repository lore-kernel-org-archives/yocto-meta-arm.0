Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52CB5C6FD1C
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 15:17:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11518.1678807067233728772
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Mar 2023 08:17:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93EC6150C
	for <meta-arm@lists.yoctoproject.org>; Tue, 14 Mar 2023 08:18:30 -0700 (PDT)
Received: from jdm-VirtualBox.lan044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CB0623F67D
	for <meta-arm@lists.yoctoproject.org>; Tue, 14 Mar 2023 08:17:46 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm-bsp/fvp-base: Add edk2 build testing
Date: Tue, 14 Mar 2023 11:17:42 -0400
Message-Id: <20230314151742.501440-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230314151742.501440-1-jon.mason@arm.com>
References: <20230314151742.501440-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Mar 2023 15:17:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4490

The infrastructure for edk2 and fvp-base is already present, but not
being used.  Make the changes to get it compiling cleanly, and add it to
CI.

Note: testing is not passing because edk2 isn't booting an image

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml                                                  | 1 +
 meta-arm-bsp/conf/machine/include/fvp-common.inc                | 2 +-
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp.inc   | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 50e1ac11..9c52b106 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -103,6 +103,7 @@ fvp-base:
   parallel:
     matrix:
       - TESTING: testimage
+      - FIRMWARE: edk2
=20
 fvp-baser-aemv8r64:
   extends: .build
diff --git a/meta-arm-bsp/conf/machine/include/fvp-common.inc b/meta-arm-=
bsp/conf/machine/include/fvp-common.inc
index b6fc74da..233c734f 100644
--- a/meta-arm-bsp/conf/machine/include/fvp-common.inc
+++ b/meta-arm-bsp/conf/machine/include/fvp-common.inc
@@ -16,7 +16,7 @@ PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
=20
 KERNEL_DEVICETREE =3D "arm/fvp-base-revc.dtb"
=20
-EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a u-boot"
+EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a"
=20
 # As this is a virtual target that will not be used in the real world th=
ere is
 # no need for real SSH keys.
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-fvp.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-fvp.inc
index 43340cdc..ca96b448 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp.=
inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp.=
inc
@@ -8,5 +8,5 @@ COMPATIBLE_MACHINE =3D "fvp-base"
 TFA_PLATFORM =3D "fvp"
 TFA_DEBUG =3D "1"
 TFA_MBEDTLS =3D "1"
-TFA_UBOOT =3D "1"
+TFA_UBOOT ?=3D "1"
 TFA_BUILD_TARGET =3D "bl1 bl2 bl31 dtbs fip"
--=20
2.25.1


