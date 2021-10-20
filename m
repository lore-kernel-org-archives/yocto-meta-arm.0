Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B2EC4332F
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 15:25:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9627.1634743553697827926
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 20 Oct 2021 08:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1439CED1
	for <meta-arm@lists.yoctoproject.org>; Wed, 20 Oct 2021 08:25:53 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF1333F73D
	for <meta-arm@lists.yoctoproject.org>; Wed, 20 Oct 2021 08:25:52 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][honister 3/3] arm/trusted-firmware-m: setting the toolchain
 file path in PACKAGECONFIG
Date: Wed, 20 Oct 2021 16:25:47 +0100
Message-Id: <20211020152547.415568-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020152547.415568-1-ross.burton@arm.com>
References: <20211020152547.415568-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 20 Oct 2021 15:25:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2288

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Toolchain files toolchain_GNUARM.cmake and toolchain_ARMCLANG.cmake are
located at trusted-firmware-m source directory.

This commit sets that.

Change-Id: If9c26f65b0c8111a6ff1f1a7d56610563efd501b
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../trusted-firmware-m/trusted-firmware-m_1.3.0.bb            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1=
.3.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.3.=
0.bb
index de007c10..fa23191f 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.3.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.3.0.bb
@@ -69,8 +69,8 @@ python() {
=20
 PACKAGECONFIG ??=3D "cc-gnuarm"
 # What compiler to use
-PACKAGECONFIG[cc-gnuarm] =3D "-DTFM_TOOLCHAIN_FILE=3Dtoolchain_GNUARM.cm=
ake,,gcc-arm-none-eabi-native"
-PACKAGECONFIG[cc-armclang] =3D "-DTFM_TOOLCHAIN_FILE=3Dtoolchain_ARMCLAN=
G.cmake,,armcompiler-native"
+PACKAGECONFIG[cc-gnuarm] =3D "-DTFM_TOOLCHAIN_FILE=3D${S}/toolchain_GNUA=
RM.cmake,,gcc-arm-none-eabi-native"
+PACKAGECONFIG[cc-armclang] =3D "-DTFM_TOOLCHAIN_FILE=3D${S}/toolchain_AR=
MCLANG.cmake,,armcompiler-native"
 # Whether to integrate the test suite
 PACKAGECONFIG[test-secure] =3D "-DTEST_S=3DON,-DTEST_S=3DOFF"
 PACKAGECONFIG[test-nonsecure] =3D "-DTEST_NS=3DON,-DTEST_NS=3DOFF"
--=20
2.25.1


