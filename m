Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E883DC4332F
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 18:31:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.750.1648751482077540218
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 31 Mar 2022 11:31:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CAD70139F
	for <meta-arm@lists.yoctoproject.org>; Thu, 31 Mar 2022 11:31:22 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7CEEC3F718
	for <meta-arm@lists.yoctoproject.org>; Thu, 31 Mar 2022 11:31:22 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/7] CI: clean up assignments in base.yml
Date: Thu, 31 Mar 2022 19:31:15 +0100
Message-Id: <20220331183117.22389-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331183117.22389-1-ross.burton@arm.com>
References: <20220331183117.22389-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 31 Mar 2022 18:31:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3221

Split the base local.conf configuration into base (absolutely needed)
and setup (typical configuration). This is needed as oe-selftest needs a
minimal configuration to execute in, for example doesn't inherit
rm_work.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/base.yml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/ci/base.yml b/ci/base.yml
index 9a59de79..eb5637d4 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -28,15 +28,15 @@ local_conf_header:
   base: |
     BB_SERVER_TIMEOUT =3D "60"
     CONF_VERSION =3D "2"
-    PACKAGE_CLASSES =3D "package_ipk"
+    BB_NUMBER_THREADS =3D "16"
+    PARALLEL_MAKE =3D "-j16"
     LICENSE_FLAGS_ACCEPTED +=3D "armcompiler Arm-FVP-EULA"
+  setup: |
+    PACKAGE_CLASSES =3D "package_ipk"
     PACKAGECONFIG:remove:pn-qemu-system-native =3D "gtk+ sdl"
     EXTRA_IMAGE_FEATURES:append =3D " debug-tweaks"
-    BB_NUMBER_THREADS =3D "16"
-    PARALLEL_MAKE =3D "-j16"
-    INHERIT +=3D "rm_work"
     PACKAGECONFIG:append:pn-perf =3D " coresight"
-  noptest: |
+    INHERIT +=3D "rm_work"
     DISTRO_FEATURES:remove =3D "ptest"
   kvm: |
     QEMU_USE_KVM =3D ""
--=20
2.25.1


