Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E7EC433F5
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 14:57:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.92573.1638370654145864001
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Dec 2021 06:57:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6B13147A
	for <meta-arm@lists.yoctoproject.org>; Wed,  1 Dec 2021 06:57:33 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6056F3F766
	for <meta-arm@lists.yoctoproject.org>; Wed,  1 Dec 2021 06:57:33 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/7] arm/edk2-firmware: upgrade to 202111
Date: Wed,  1 Dec 2021 14:57:24 +0000
Message-Id: <20211201145729.4138705-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211201145729.4138705-1-ross.burton@arm.com>
References: <20211201145729.4138705-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 01 Dec 2021 14:57:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2501

Also update sbsa-acs to build against 202111.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware_202108.bb | 4 ----
 meta-arm/recipes-bsp/uefi/edk2-firmware_202111.bb | 4 ++++
 meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb         | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202108.bb
 create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202111.bb

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202108.bb b/meta-arm=
/recipes-bsp/uefi/edk2-firmware_202108.bb
deleted file mode 100644
index 58c0e4b7..00000000
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_202108.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-SRCREV_edk2           ?=3D "7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5"
-SRCREV_edk2-platforms ?=3D "64394fd2b48f403330feb8f7e954d1cca0822af5"
-
-require edk2-firmware.inc
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202111.bb b/meta-arm=
/recipes-bsp/uefi/edk2-firmware_202111.bb
new file mode 100644
index 00000000..bc027ef7
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_202111.bb
@@ -0,0 +1,4 @@
+SRCREV_edk2           ?=3D "bb1bba3d776733c41dbfa2d1dc0fe234819a79f2"
+SRCREV_edk2-platforms ?=3D "3e73df15730667c46a1e449cca872e7f8861007c"
+
+require edk2-firmware.inc
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb b/meta-arm/recipes=
-bsp/uefi/sbsa-acs_3.0.bb
index 95995759..2c269487 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb
@@ -1,4 +1,4 @@
-require recipes-bsp/uefi/edk2-firmware_202108.bb
+require recipes-bsp/uefi/edk2-firmware_202111.bb
=20
 LICENSE +=3D "& Apache-2.0"
 LIC_FILES_CHKSUM +=3D "file://ShellPkg/Application/sbsa-acs/LICENSE.md;m=
d5=3D2a944942e1496af1886903d274dedb13"
--=20
2.25.1


