Return-Path: <drew.reed@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F812C48BC1
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 14:03:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.41642.1707919401779704973
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Feb 2024 06:03:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: drew.reed@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 780631FB;
	Wed, 14 Feb 2024 06:04:02 -0800 (PST)
Received: from C02DP1BVML7H.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 913593F5A1;
	Wed, 14 Feb 2024 06:03:20 -0800 (PST)
From: drew.reed@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Drew Reed <Drew.Reed@arm.com>
Subject: [PATCH 4/4] bsp: Rename corstone1000-image
Date: Wed, 14 Feb 2024 14:03:03 +0000
Message-ID: <20240214140303.38535-5-drew.reed@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214140303.38535-1-drew.reed@arm.com>
References: <20240214140303.38535-1-drew.reed@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 14 Feb 2024 14:03:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5383

From: Drew Reed <Drew.Reed@arm.com>

As we intend to build 2 Corstone-1000 disk images, one for the firmware
in flash and an external mass storage image the existing
corstone1000-image.bb file has been renamed to
corstone1000-flash-firmware-image.bb to make it clear what it's for.
The wks file for specifing the image layout has also been renamed to
make its purpose clearer.

Signed-off-by: Drew Reed <Drew.Reed@arm.com>
---
 ci/corstone1000-common.yml                                      | 2 +-
 meta-arm-bsp/conf/machine/include/corstone1000.inc              | 2 +-
 ...rstone1000-image.bb =3D> corstone1000-flash-firmware-image.bb} | 0
 ...corstone1000-flash-firmware-image-capsule-update-image.json} | 0
 ...mage.corstone1000.wks =3D> corstone1000-flash-firmware.wks.in} | 0
 5 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-arm-bsp/recipes-bsp/images/{corstone1000-image.bb =3D> corst=
one1000-flash-firmware-image.bb} (100%)
 rename meta-arm-bsp/recipes-bsp/images/files/{corstone1000-image-capsule=
-update-image.json =3D> corstone1000-flash-firmware-image-capsule-update-=
image.json} (100%)
 rename meta-arm-bsp/wic/{corstone1000-image.corstone1000.wks =3D> corsto=
ne1000-flash-firmware.wks.in} (100%)

diff --git a/ci/corstone1000-common.yml b/ci/corstone1000-common.yml
index 42cf4c95..5720b783 100644
--- a/ci/corstone1000-common.yml
+++ b/ci/corstone1000-common.yml
@@ -38,5 +38,5 @@ local_conf_header:
     IMAGE_INSTALL +=3D "packagegroup-ts-tests-psa"
=20
 target:
-  - corstone1000-image
+  - corstone1000-flash-firmware-image
   - perf
diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index 4d33b575..373dd04c 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -44,7 +44,7 @@ MACHINE_FEATURES +=3D "arm-ffa"
 # login terminal serial port settings
 SERIAL_CONSOLES ?=3D "115200;ttyAMA0"
=20
-WKS_FILE ?=3D "corstone1000-image.corstone1000.wks"
+WKS_FILE ?=3D "corstone1000-flash-firmware.wks.in"
=20
 # making sure EXTRA_IMAGEDEPENDS will be used while creating the image
 WKS_FILE_DEPENDS:append =3D " ${EXTRA_IMAGEDEPENDS}"
diff --git a/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb b/meta=
-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-image.bb
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb
rename to meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-ima=
ge.bb
diff --git a/meta-arm-bsp/recipes-bsp/images/files/corstone1000-image-cap=
sule-update-image.json b/meta-arm-bsp/recipes-bsp/images/files/corstone10=
00-flash-firmware-image-capsule-update-image.json
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/images/files/corstone1000-image-caps=
ule-update-image.json
rename to meta-arm-bsp/recipes-bsp/images/files/corstone1000-flash-firmwa=
re-image-capsule-update-image.json
diff --git a/meta-arm-bsp/wic/corstone1000-image.corstone1000.wks b/meta-=
arm-bsp/wic/corstone1000-flash-firmware.wks.in
similarity index 100%
rename from meta-arm-bsp/wic/corstone1000-image.corstone1000.wks
rename to meta-arm-bsp/wic/corstone1000-flash-firmware.wks.in
--=20
2.43.0


