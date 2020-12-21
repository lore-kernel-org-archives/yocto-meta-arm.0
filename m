Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.1410.1608580991033372336
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Dec 2020 12:03:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 720871FB
	for <meta-arm@lists.yoctoproject.org>; Mon, 21 Dec 2020 12:03:09 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1913C3F6CF
	for <meta-arm@lists.yoctoproject.org>; Mon, 21 Dec 2020 12:03:08 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] meta-arm/edk2-firmware: remove unused 202008 version
Date: Mon, 21 Dec 2020 20:03:07 +0000
Message-Id: <20201221200307.2898455-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Now that SGI575 has upgraded, this can be removed.

Change-Id: Ib8bdd9430b66a4b83524b21ad2a300a048c218eb
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware_202008.bb | 4 ----
 1 file changed, 4 deletions(-)
 delete mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202008.bb

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202008.bb b/meta-arm=
/recipes-bsp/uefi/edk2-firmware_202008.bb
deleted file mode 100644
index 60363d8..0000000
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_202008.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-SRCREV_edk2           ?=3D "06dc822d045c2bb42e497487935485302486e151"
-SRCREV_edk2-platforms ?=3D "7aab81a35aef7b295e73d7d6dfd528cc812790ed"
-
-require edk2-firmware.inc
--=20
2.25.1

