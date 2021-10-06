Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D1E2C433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 15:38:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.13996.1633534702786308801
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 06 Oct 2021 08:38:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A960113E
	for <meta-arm@lists.yoctoproject.org>; Wed,  6 Oct 2021 08:38:22 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 127B93F66F
	for <meta-arm@lists.yoctoproject.org>; Wed,  6 Oct 2021 08:38:21 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/4] arm/gn: map the platform identifiers
Date: Wed,  6 Oct 2021 16:38:17 +0100
Message-Id: <20211006153818.3948831-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006153818.3948831-1-ross.burton@arm.com>
References: <20211006153818.3948831-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 06 Oct 2021 15:38:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2260

GN uses its own platform identifiers, so map from our GNU-style names to
the names it expects.

Change-Id: I361536c43f2a9cc5c6dc0a9ad4138433399781d2
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-devtools/gn/gn_git.bb | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta-arm/recipes-devtools/gn/gn_git.bb b/meta-arm/recipes-de=
vtools/gn/gn_git.bb
index 93c3dc01..522a7efe 100644
--- a/meta-arm/recipes-devtools/gn/gn_git.bb
+++ b/meta-arm/recipes-devtools/gn/gn_git.bb
@@ -11,17 +11,25 @@ PV =3D "0+git${SRCPV}"
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build"
=20
-# TODO: os map like meson. mingw32 -> mingw
-
 # Currently fails to build with clang, eg:
 # https://errors.yoctoproject.org/Errors/Details/610602/
 # https://errors.yoctoproject.org/Errors/Details/610486/
 TOOLCHAIN =3D "gcc"
=20
+# Map from our _OS strings to the GN's platform values.
+def gn_platform(variable, d):
+    os =3D d.getVar(variable)
+    if "linux" in os:
+        return "linux"
+    elif "mingw" in os:
+        return "mingw"
+    else:
+        return os
+
 do_configure[cleandirs] +=3D "${B}"
 do_configure() {
     python3 ${S}/build/gen.py \
-        --platform=3D${TARGET_OS} \
+        --platform=3D${@gn_platform("TARGET_OS", d)} \
         --out-path=3D${B} \
         --no-strip
 }
--=20
2.25.1


