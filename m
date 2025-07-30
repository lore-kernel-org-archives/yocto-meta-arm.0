Return-Path: <csaba.szilagyi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30844C87FCC
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 07:47:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.29980.1753861656826694295
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 30 Jul 2025 00:47:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: csaba.szilagyi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B4E71BC0;
	Wed, 30 Jul 2025 00:47:28 -0700 (PDT)
Received: from ubuntu-build.budapest.arm.com (GM0ZH93R.arm.com [10.45.26.24])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 054973F673;
	Wed, 30 Jul 2025 00:47:35 -0700 (PDT)
From: =?UTF-8?q?Csaba=20Szil=C3=A1gyi?= <csaba.szilagyi@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: =?UTF-8?q?Csaba=20Szil=C3=A1gyi?= <csaba.szilagyi@arm.com>
Subject: [PATCH 4/6] arm/hafnium: Remove deprecated patch for third_party/linux submodule
Date: Wed, 30 Jul 2025 07:45:49 +0000
Message-ID: <20250730074551.1388-5-csaba.szilagyi@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730074551.1388-1-csaba.szilagyi@arm.com>
References: <20250730074551.1388-1-csaba.szilagyi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 30 Jul 2025 07:47:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6631

third_party/linux submodule has been removed from hafnium in the
following commit:
ddeedafa - chore: drop the third_party/linux submodule

Relevant patch can not be applied anymore. Patch is removed
from the recipe.

Signed-off-by: Csaba Szil=C3=A1gyi <csaba.szilagyi@arm.com>
---
 ...ig-native-to-find-the-libssl-headers.patch | 26 -------------------
 .../recipes-bsp/hafnium/hafnium_2.12.0.bb     |  1 -
 2 files changed, 27 deletions(-)
 delete mode 100644 meta-arm/recipes-bsp/hafnium/hafnium/0001-Use-pkg-con=
fig-native-to-find-the-libssl-headers.patch

diff --git a/meta-arm/recipes-bsp/hafnium/hafnium/0001-Use-pkg-config-nat=
ive-to-find-the-libssl-headers.patch b/meta-arm/recipes-bsp/hafnium/hafni=
um/0001-Use-pkg-config-native-to-find-the-libssl-headers.patch
deleted file mode 100644
index cfb534d4..00000000
--- a/meta-arm/recipes-bsp/hafnium/hafnium/0001-Use-pkg-config-native-to-=
find-the-libssl-headers.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 1c1e7ca2874feaa3e447dce578487d42c226ef46 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Sat, 17 Jul 2021 14:38:02 -0500
-Subject: [PATCH] Use pkg-config-native to find the libssl headers.
-
-Upstream-Status: Inappropriate
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- scripts/Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/scripts/Makefile b/scripts/Makefile
-index 9adb6d247818..5fe371c7d7f5 100644
---- a/scripts/Makefile
-+++ b/scripts/Makefile
-@@ -3,8 +3,8 @@
- # scripts contains sources for various helper programs used throughout
- # the kernel for the build process.
-=20
--CRYPTO_LIBS =3D $(shell pkg-config --libs libcrypto 2> /dev/null || ech=
o -lcrypto)
--CRYPTO_CFLAGS =3D $(shell pkg-config --cflags libcrypto 2> /dev/null)
-+CRYPTO_LIBS =3D $(shell pkg-config-native --libs libcrypto 2> /dev/null=
 || echo -lcrypto)
-+CRYPTO_CFLAGS =3D $(shell pkg-config-native --cflags libcrypto 2> /dev/=
null)
-=20
- hostprogs-always-$(CONFIG_BUILD_BIN2C)			+=3D bin2c
- hostprogs-always-$(CONFIG_KALLSYMS)			+=3D kallsyms
diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.12.0.bb b/meta-arm/re=
cipes-bsp/hafnium/hafnium_2.12.0.bb
index 693e81f2..3db20eeb 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.12.0.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.12.0.bb
@@ -14,7 +14,6 @@ inherit deploy python3native pkgconfig ${CLANGNATIVE}
=20
 SRC_URI =3D "gitsm://git.trustedfirmware.org/hafnium/hafnium.git;protoco=
l=3Dhttps;branch=3Dmaster \
            file://0001-arm-hafnium-fix-kernel-tool-linking.patch  \
-           file://0001-Use-pkg-config-native-to-find-the-libssl-headers.=
patch;patchdir=3Dthird_party/linux \
           "
 SRCREV =3D "2cf2ca7c4b81ab18e9cd363d9a5c8288e2a94fda"
 B =3D "${WORKDIR}/build"

