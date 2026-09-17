Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22592C982D0
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 11:20:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36697.1789644056008373870
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Sep 2026 04:20:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=MbNAfBtj;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F30E51476;
	Thu, 17 Sep 2026 04:20:51 -0700 (PDT)
Received: from e142474.cambridge.arm.com (e142474.arm.com [10.2.203.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC4CA3F7B4;
	Thu, 17 Sep 2026 04:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789644055; bh=4oOCh+IBdPNgtyw5UPMVFD/sOdV46KadXOEDe8LnZ1o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MbNAfBtjQ13PvNspUa/JHJ8cmhoK7Z2x2cDaL2omIcz4uRpIn7AQdaZO/iOtJ98i3
	 mP5Y4pM1mtstWUbmEV1RXn36SxsJ9BOB/7aF62CUFKGmqvHWh5J/sL8N0grwC42xa5
	 rfYmTK5bgR+KONozVa9CcpTBDDekw6ocYb4uL8b4=
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>,
	Alex Chapman <alex.chapman@arm.com>
Subject: [PATCH 2/2] arm-bsp/u-boot: Remove u-boot recipe u-boot_2025.10.bb
Date: Thu, 17 Sep 2026 12:20:32 +0100
Message-ID: <20260917112040.3877076-3-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917112040.3877076-1-harsimransingh.tungal@arm.com>
References: <20260917112040.3877076-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 17 Sep 2026 11:20:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7169

Remove the u-boot recipe u-boot_2025.10.bb as new u-boot version
2026.07 is available in core.

Signed-off-by: Alex Chapman <alex.chapman@arm.com>
Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2025.10.bb | 12 ------------
 1 file changed, 12 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2025.10.bb

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2025.10.bb b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_2025.10.bb
deleted file mode 100644
index e9a7e52a..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2025.10.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require recipes-bsp/u-boot/u-boot-common.inc
-require recipes-bsp/u-boot/u-boot.inc
-
-DEPENDS +=3D "bc-native dtc-native gnutls-native python3-pyelftools-nati=
ve"
-
-SRCREV =3D "e50b1e8715011def8aff1588081a2649a2c6cd47"
-SRC_URI =3D "git://source.denx.de/u-boot/u-boot.git;protocol=3Dhttps;bra=
nch=3Dmaster"
-
-# u-boot/lib/rsa/rsa-sign.c uses the OpenSSL engine API, but this has be=
en removed
-# from OpenSSL 4.  Upstream u-boot has been fixed but we can enable the =
stub engine
-# API in OpenSSL until this recipe is removed.
-BUILD_CFLAGS +=3D "-DOPENSSL_ENGINE_STUBS"

