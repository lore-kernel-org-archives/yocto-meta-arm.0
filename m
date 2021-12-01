Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E17C433FE
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 14:57:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.93223.1638370654720522720
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Dec 2021 06:57:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E548143B
	for <meta-arm@lists.yoctoproject.org>; Wed,  1 Dec 2021 06:57:33 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC7663F766
	for <meta-arm@lists.yoctoproject.org>; Wed,  1 Dec 2021 06:57:32 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/7] arm/edk2-firmware: set invalid platform names for better
 errors
Date: Wed,  1 Dec 2021 14:57:23 +0000
Message-Id: <20211201145729.4138705-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 01 Dec 2021 14:57:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2502

Set the default platform name/descriptor to 'unset' so that build.sh fail=
s
with obvious errors, instead of generic argument parsing failures.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recip=
es-bsp/uefi/edk2-firmware.inc
index 66e0cc3e..f38ee9ca 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
@@ -23,9 +23,9 @@ SRCREV_FORMAT         =3D "edk2_edk2-platforms"
 UPSTREAM_CHECK_GITTAGREGEX =3D "^edk2-stable(?P<pver>\d+)$"
=20
 EDK2_BUILD_RELEASE =3D ""
-EDK2_PLATFORM      =3D ""
+EDK2_PLATFORM      =3D "unset"
 # build --platform
-EDK2_PLATFORM_DSC  =3D ""
+EDK2_PLATFORM_DSC  =3D "unset"
 EDK2_BIN_NAME      =3D ""
 # build --arch
 EDK2_ARCH          =3D ""
--=20
2.25.1


