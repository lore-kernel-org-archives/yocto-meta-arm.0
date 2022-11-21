Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C6DBC4332F
	for <webhook@archiver.kernel.org>; Mon, 21 Nov 2022 15:44:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.41982.1669045439149969758
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Nov 2022 07:43:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2CC95150C;
	Mon, 21 Nov 2022 07:44:05 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 89FD83F73B;
	Mon, 21 Nov 2022 07:43:58 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: =?UTF-8?q?Adri=C3=A1n=20Herrera=20Arcila?= <adrian.herrera@arm.com>
Subject: [PATCH 6/7] atp: fix machine overrides in recipes
Date: Mon, 21 Nov 2022 10:43:51 -0500
Message-Id: <20221121154352.5061-6-jon.mason@arm.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4148

From: Adri=C3=A1n Herrera Arcila <adrian.herrera@arm.com>

Ensure meta-atp recipes are only performed if a compatible machine is
selected.

Signed-off-by: Adri=C3=A1n Herrera Arcila <adrian.herrera@arm.com>
---
 meta-atp/recipes-devtools/gem5/gem5-aarch64-dtb.bbappend | 8 +++++---
 meta-atp/recipes-kernel/atp/atp-module_3.1.bb            | 1 +
 meta-atp/recipes-kernel/atp/atp-test_3.1.bb              | 1 +
 meta-atp/recipes-kernel/atp/atp-uapi_3.1.bb              | 1 +
 meta-atp/recipes-kernel/linux/linux-yocto_%.bbappend     | 4 ++--
 5 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta-atp/recipes-devtools/gem5/gem5-aarch64-dtb.bbappend b/m=
eta-atp/recipes-devtools/gem5/gem5-aarch64-dtb.bbappend
index 2b55b892..c96f2cdc 100644
--- a/meta-atp/recipes-devtools/gem5/gem5-aarch64-dtb.bbappend
+++ b/meta-atp/recipes-devtools/gem5/gem5-aarch64-dtb.bbappend
@@ -1,3 +1,5 @@
-# Export datadir paths for baremetal_atp.py script
-export GEM5_DATADIR =3D "${STAGING_DATADIR_NATIVE}/gem5"
-export ATP_DATADIR =3D "${STAGING_DATADIR_NATIVE}/gem5"
+do_compile:prepend:gem5-atp-arm64() {
+    # Export datadir paths for baremetal_atp.py script
+    export GEM5_DATADIR=3D"${STAGING_DATADIR_NATIVE}/gem5"
+    export ATP_DATADIR=3D"${STAGING_DATADIR_NATIVE}/gem5"
+}
diff --git a/meta-atp/recipes-kernel/atp/atp-module_3.1.bb b/meta-atp/rec=
ipes-kernel/atp/atp-module_3.1.bb
index 0bf4949b..9b54e1c8 100644
--- a/meta-atp/recipes-kernel/atp/atp-module_3.1.bb
+++ b/meta-atp/recipes-kernel/atp/atp-module_3.1.bb
@@ -1,3 +1,4 @@
+COMPATIBLE_MACHINE =3D "gem5-atp-arm64"
 require recipes-devtools/atp/atp-source_3.1.inc
 inherit module
=20
diff --git a/meta-atp/recipes-kernel/atp/atp-test_3.1.bb b/meta-atp/recip=
es-kernel/atp/atp-test_3.1.bb
index e98e13cd..3c88e08d 100644
--- a/meta-atp/recipes-kernel/atp/atp-test_3.1.bb
+++ b/meta-atp/recipes-kernel/atp/atp-test_3.1.bb
@@ -1,3 +1,4 @@
+COMPATIBLE_MACHINE =3D "gem5-atp-arm64"
 require recipes-devtools/atp/atp-source_3.1.inc
=20
 SUMMARY =3D "End-to-end tests evaluating ATP kernel modules service corr=
ectness"
diff --git a/meta-atp/recipes-kernel/atp/atp-uapi_3.1.bb b/meta-atp/recip=
es-kernel/atp/atp-uapi_3.1.bb
index 140105f8..a8b14796 100644
--- a/meta-atp/recipes-kernel/atp/atp-uapi_3.1.bb
+++ b/meta-atp/recipes-kernel/atp/atp-uapi_3.1.bb
@@ -1,3 +1,4 @@
+COMPATIBLE_MACHINE =3D "gem5-atp-arm64"
 require recipes-devtools/atp/atp-source_3.1.inc
=20
 SUMMARY =3D "User API for accessing services from ATP kernel modules"
diff --git a/meta-atp/recipes-kernel/linux/linux-yocto_%.bbappend b/meta-=
atp/recipes-kernel/linux/linux-yocto_%.bbappend
index f59f8d44..8cb86a97 100644
--- a/meta-atp/recipes-kernel/linux/linux-yocto_%.bbappend
+++ b/meta-atp/recipes-kernel/linux/linux-yocto_%.bbappend
@@ -1,2 +1,2 @@
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
-SRC_URI +=3D "file://no_ftrace.cfg file://smmuv3.cfg"
+FILESEXTRAPATHS:prepend:gem5-atp-arm64 :=3D "${THISDIR}/files:"
+SRC_URI:append:gem5-atp-arm64 =3D " file://no_ftrace.cfg file://smmuv3.c=
fg"
--=20
2.17.1


