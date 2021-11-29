Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2524BC433EF
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 14:23:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.61700.1638195816412358393
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Nov 2021 06:23:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F37201042
	for <meta-arm@lists.yoctoproject.org>; Mon, 29 Nov 2021 06:23:35 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C8DF3F766
	for <meta-arm@lists.yoctoproject.org>; Mon, 29 Nov 2021 06:23:35 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/4] arm/edk2-firmware: don't PROVIDE virtual/uefi-firmware
Date: Mon, 29 Nov 2021 14:23:30 +0000
Message-Id: <20211129142330.4018944-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129142330.4018944-1-ross.burton@arm.com>
References: <20211129142330.4018944-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Nov 2021 14:23:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2474

Interchangable firmware isn't really a workable concept, so there's no
real need to have a virtual name.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware.inc | 2 --
 meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb   | 2 --
 2 files changed, 4 deletions(-)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recip=
es-bsp/uefi/edk2-firmware.inc
index 2f6f42c0..66e0cc3e 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
@@ -4,8 +4,6 @@ HOMEPAGE =3D "https://github.com/tianocore/edk2"
=20
 LICENSE =3D "BSD-2-Clause-Patent"
=20
-PROVIDES +=3D "virtual/uefi-firmware"
-
 # EDK2
 LIC_FILES_CHKSUM =3D "file://License.txt;md5=3D2b415520383f7964e96700ae1=
2b4570a"
 # EDK2 Platforms
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb b/meta-arm/recipes=
-bsp/uefi/sbsa-acs_3.0.bb
index 11c4c51e..95995759 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb
@@ -1,7 +1,5 @@
 require recipes-bsp/uefi/edk2-firmware_202108.bb
=20
-PROVIDES:remove =3D "virtual/uefi-firmware"
-
 LICENSE +=3D "& Apache-2.0"
 LIC_FILES_CHKSUM +=3D "file://ShellPkg/Application/sbsa-acs/LICENSE.md;m=
d5=3D2a944942e1496af1886903d274dedb13"
=20
--=20
2.25.1


