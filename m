Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D936C433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Nov 2022 15:44:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.41979.1669045438638498215
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Nov 2022 07:43:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A74B11480;
	Mon, 21 Nov 2022 07:44:04 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 14A133F73B;
	Mon, 21 Nov 2022 07:43:58 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: =?UTF-8?q?Adri=C3=A1n=20Herrera=20Arcila?= <adrian.herrera@arm.com>
Subject: [PATCH 4/7] gem5: support for EXTRAS
Date: Mon, 21 Nov 2022 10:43:49 -0500
Message-Id: <20221121154352.5061-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221121154352.5061-1-jon.mason@arm.com>
References: <20221121154352.5061-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 21 Nov 2022 15:44:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4143

From: Adri=C3=A1n Herrera Arcila <adrian.herrera@arm.com>

External models can be added to gem5 through EXTRAS:
https://www.gem5.org/documentation/general_docs/building/EXTRAS

Added GEM5_EXTRAS to the gem5-native recipe to support it.

Signed-off-by: Adri=C3=A1n Herrera Arcila <adrian.herrera@arm.com>
---
 meta-gem5/recipes-devtools/gem5/gem5-native.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-gem5/recipes-devtools/gem5/gem5-native.inc b/meta-gem5/=
recipes-devtools/gem5/gem5-native.inc
index 91a554bb..0f794b3f 100644
--- a/meta-gem5/recipes-devtools/gem5/gem5-native.inc
+++ b/meta-gem5/recipes-devtools/gem5/gem5-native.inc
@@ -12,10 +12,15 @@ GEM5_BUILD_VARIANT ?=3D "opt"
 # What gem5 binary are we building
 GEM5_BUILD_CONFIGS ?=3D "build/X86/gem5.{GEM5_BUILD_VARIANT}"
=20
+# Extra directories with sources for gem5 build. Intended to be used fro=
m
+# machine configuration files, to add out-of-tree gem5 models of their
+# hardware components.
+GEM5_EXTRAS ?=3D ""
+
 # Scons build arguments
 GEM5_SCONS_ARGS ?=3D "CC=3D${BUILD_CC} CXX=3D${BUILD_CXX} \
     AS=3D${BUILD_AS} AR=3D${BUILD_AR} ${GEM5_BUILD_CONFIGS} \
-    PYTHON_CONFIG=3Dpython3-config"
+    PYTHON_CONFIG=3Dpython3-config EXTRAS=3D${GEM5_EXTRAS}"
=20
 # Default profile to run
 GEM5_RUN_PROFILE ?=3D "configs/example/fs.py"
--=20
2.17.1


