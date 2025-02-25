Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 010DCC19778
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 15:18:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10385.1740496699751198105
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 25 Feb 2025 07:18:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A084A292B
	for <meta-arm@lists.yoctoproject.org>; Tue, 25 Feb 2025 07:18:35 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 450563F5A1
	for <meta-arm@lists.yoctoproject.org>; Tue, 25 Feb 2025 07:18:19 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 7/7] arm/boot-wrapper-aarch64: update to the latest
Date: Tue, 25 Feb 2025 10:18:17 -0500
Message-Id: <20250225151817.11875-7-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250225151817.11875-1-jon.mason@arm.com>
References: <20250225151817.11875-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 25 Feb 2025 15:18:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6391

Update to the latest commit.
Changes in gn between 5e3760073454c72f3458805a1b7a89ecf80353cb and ac6742=
520ded1da30d500f74e8affe86e27cabd5
	ac6742520ded aarch64: Start Xen on Armv8-R at EL2
	ba899d1d7227 aarch64: Implement PSCI for Armv8-R
	476a0b6451d7 aarch64: Enable Armv8-R EL2 boot
	0f00cf4cb8b2 Introduce --with-bw-arch for boot-wrapper compile arch
	aafb5958eb9d Boot CPUs sequentially
	d62de19c8661 Add printing functions
	1ab497ed6c38 Simplify spin logic
	1e576e54d0a4 Unify assembly setup paths
	19ffbec99cf5 aarch32: Always enter kernel via exception return
	e8e6f797bafa aarch32: Implement cpu_init_arch()
	8745a2cd8e0a aarch32: Refactor inital entry
	77c3316737fc aarch64: Always enter kernel via exception return
	308d25f908a8 aarch64: Implement cpu_init_arch()
	4dcb17f55300 aarch64: Remove redundant EL1 entry logic
	400f0a86dcc8 Revert "configure: allow the use of bare-metal toolchains"
	1fea854771f9 configure: allow the use of bare-metal toolchains
	784feb9b0753 Makefile: suppress RWX segment warnings
	e1d7651f3c2f Makefile: rework test-dtc-option
	cd7fe8a88e82 aarch64: Enable access into RCW[S]MASK_EL1 registers from E=
L2 and below
	1ac203146003 aarch64: Enable access into 128 bit system registers from E=
L2 and below
	b13b3bdcb2a1 aarch64: Enable access into SCTLR2_ELx registers from EL2 a=
nd below
	61b84b4a1c02 aarch64: Remove TSCXT bit set from SCTLR_EL2_RESET
	3bac221638c4 configure: make --with-kernel-dir optional

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../boot-wrapper-aarch64/boot-wrapper-aarch64_git.bb            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch=
64_git.bb b/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch6=
4_git.bb
index d0f7893d8cc8..8a37dd9e9492 100644
--- a/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_git.=
bb
+++ b/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_git.=
bb
@@ -4,7 +4,7 @@ LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dbb63326febfb5fb909226c8e7=
ebcef5c"
=20
 SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/mark/boot-wra=
pper-aarch64.git;branch=3Dmaster;protocol=3Dhttps"
-SRCREV =3D "5e3760073454c72f3458805a1b7a89ecf80353cb"
+SRCREV =3D "ac6742520ded1da30d500f74e8affe86e27cabd5"
=20
 # boot-wrapper doesn't make releases
 UPSTREAM_CHECK_COMMITS =3D "1"
--=20
2.39.5 (Apple Git-154)


