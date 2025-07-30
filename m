Return-Path: <csaba.szilagyi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC14C87FC9
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 07:47:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.29945.1753861657698654484
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 30 Jul 2025 00:47:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: csaba.szilagyi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E9AA1C25;
	Wed, 30 Jul 2025 00:47:29 -0700 (PDT)
Received: from ubuntu-build.budapest.arm.com (GM0ZH93R.arm.com [10.45.26.24])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB2CE3F673;
	Wed, 30 Jul 2025 00:47:36 -0700 (PDT)
From: =?UTF-8?q?Csaba=20Szil=C3=A1gyi?= <csaba.szilagyi@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: =?UTF-8?q?Csaba=20Szil=C3=A1gyi?= <csaba.szilagyi@arm.com>
Subject: [PATCH 5/6] arm/hafnium: Restore patch on gn visibility
Date: Wed, 30 Jul 2025 07:45:50 +0000
Message-ID: <20250730074551.1388-6-csaba.szilagyi@arm.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6632

This patch has been dropped in the following commit:
f1fc5c53 - arm/hafnium: update to v2.12.0

Unfortunately the original issue is still present and the
patch is required for the successful build. Patch is
restored in this commit.

Signed-off-by: Csaba Szil=C3=A1gyi <csaba.szilagyi@arm.com>
---
 .../0001-work-around-visibility-issue.patch   | 29 +++++++++++++++++++
 .../recipes-bsp/hafnium/hafnium_2.12.0.bb     |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/hafnium/hafnium/0001-work-around=
-visibility-issue.patch

diff --git a/meta-arm/recipes-bsp/hafnium/hafnium/0001-work-around-visibi=
lity-issue.patch b/meta-arm/recipes-bsp/hafnium/hafnium/0001-work-around-=
visibility-issue.patch
new file mode 100644
index 00000000..dc0c35fe
--- /dev/null
+++ b/meta-arm/recipes-bsp/hafnium/hafnium/0001-work-around-visibility-is=
sue.patch
@@ -0,0 +1,29 @@
+From 745294ffa9bb9296eb4250f24dd0ae8115fadd7a Mon Sep 17 00:00:00 2001
+From: Jon Mason <jon.mason@arm.com>
+Date: Thu, 27 Oct 2022 20:10:09 +0000
+Subject: [PATCH] work around visibility issue
+
+gn commit 46b572ce4ceedfe57f4f84051bd7da624c98bf01 "fixed" the
+visibility field not applying to public configs.  This caused dtc to
+have issues due to libfdt and others not being specified.  Due to the
+number, it was cleaner to remove the visibility field (which defaults to
+everything being visible).
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+---
+ BUILD.gn | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/BUILD.gn b/BUILD.gn
+index f55560c540de..d60c3e37135b 100644
+--- a/BUILD.gn
++++ b/BUILD.gn
+@@ -5,7 +5,6 @@
+ # https://opensource.org/licenses/BSD-3-Clause.
+=20
+ config("libfdt_config") {
+-  visibility =3D [ ":gtest" ]
+   include_dirs =3D [
+     "libfdt",
+     "hafnium_inc",
diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.12.0.bb b/meta-arm/re=
cipes-bsp/hafnium/hafnium_2.12.0.bb
index 3db20eeb..42a02259 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.12.0.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.12.0.bb
@@ -14,6 +14,7 @@ inherit deploy python3native pkgconfig ${CLANGNATIVE}
=20
 SRC_URI =3D "gitsm://git.trustedfirmware.org/hafnium/hafnium.git;protoco=
l=3Dhttps;branch=3Dmaster \
            file://0001-arm-hafnium-fix-kernel-tool-linking.patch  \
+           file://0001-work-around-visibility-issue.patch;patchdir=3Dthi=
rd_party/dtc \
           "
 SRCREV =3D "2cf2ca7c4b81ab18e9cd363d9a5c8288e2a94fda"
 B =3D "${WORKDIR}/build"

