Return-Path: <frazer.carsley@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE3DD31A33
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 09:25:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6513.1768382724266192838
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Jan 2026 01:25:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: frazer.carsley@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF042339;
	Wed, 14 Jan 2026 01:25:16 -0800 (PST)
Received: from e138143.cambridge.arm.com (e138143.arm.com [10.1.25.147])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF5413F694;
	Wed, 14 Jan 2026 01:25:22 -0800 (PST)
From: frazer.carsley@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Frazer Carsley <frazer.carsley@arm.com>
Subject: [PATCH 2/3] arm-bsp/docs:corstone1000: update paths
Date: Wed, 14 Jan 2026 09:24:51 +0000
Message-ID: <20260114092452.286544-3-frazer.carsley@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114092452.286544-1-frazer.carsley@arm.com>
References: <20260114092452.286544-1-frazer.carsley@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 14 Jan 2026 09:25:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6842

From: Frazer Carsley <frazer.carsley@arm.com>

The paths for these files has changed due to the change to the
trusted-firmware-m recipe now using the custom firmware.bbclass.

Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
---
 meta-arm-bsp/documentation/corstone1000/user-guide.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index 5f807f39..f4f4c794 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -988,7 +988,7 @@ Use the following commands to generate the `capsule_c=
onfig.json` file, which is
     build/tmp/work/corstone1000_${TARGET}-poky-linux-musl/corstone1000-f=
lash-firmware-image/1.0/sources/corstone1000-flash-firmware-image-1.0/dum=
my.bin \
     build/tmp/deploy/images/corstone1000-${TARGET}/trusted-firmware-m/bl=
2_signed.bin \
     build/tmp/deploy/images/corstone1000-${TARGET}/trusted-firmware-m/tf=
m_s_signed.bin \
-    build/tmp/deploy/images/corstone1000-${TARGET}/signed_fip-corstone10=
00.bin \
+    build/tmp/deploy/images/corstone1000-${TARGET}/signed_fip.bin \
     build/tmp/deploy/images/corstone1000-${TARGET}/Image.gz-initramfs-co=
rstone1000-${TARGET}.bin \
     build/tmp/work/corstone1000_${TARGET}-poky-linux-musl/corstone1000-f=
lash-firmware-image/1.0/sources/corstone1000-flash-firmware-image-1.0/dum=
my.bin \
     --update_image_indexes 5  1  2  3  4  6 \
@@ -1047,7 +1047,7 @@ Use the following commands to generate the `capsule=
_config.json` file, which is
     build/tmp/work/corstone1000_${TARGET}-poky-linux-musl/corstone1000-f=
lash-firmware-image/1.0/sources/corstone1000-flash-firmware-image-1.0/dum=
my.bin \
     build/tmp/deploy/images/corstone1000-${TARGET}/trusted-firmware-m/bl=
2_signed.bin \
     build/tmp/deploy/images/corstone1000-${TARGET}/trusted-firmware-m/tf=
m_s_signed.bin \
-    build/tmp/deploy/images/corstone1000-${TARGET}/signed_fip-corstone10=
00.bin \
+    build/tmp/deploy/images/corstone1000-${TARGET}/signed_fip.bin \
     build/tmp/deploy/images/corstone1000-${TARGET}/Image.gz-initramfs-co=
rstone1000-${TARGET}.bin \
     build/tmp/work/corstone1000_${TARGET}-poky-linux-musl/corstone1000-f=
lash-firmware-image/1.0/sources/corstone1000-flash-firmware-image-1.0/dum=
my.bin \
     --update_image_indexes 5  1  2  3  4  6 \

