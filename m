Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 216F8C433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 16:16:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10137.1646151368030953910
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Mar 2022 08:16:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACAF81042
	for <meta-arm@lists.yoctoproject.org>; Tue,  1 Mar 2022 08:16:07 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5761F3F70D
	for <meta-arm@lists.yoctoproject.org>; Tue,  1 Mar 2022 08:16:07 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/fvp: check that FVP binaries are present
Date: Tue,  1 Mar 2022 16:16:04 +0000
Message-Id: <20220301161604.1959493-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 01 Mar 2022 16:16:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3083

If any of the path computation goes wrong (for example, the compiler
changed so FVP_ARCH needs updating) for the real FVP binaries then
bindir contains broken link called FVP_*.

Solve this by checking that the directory contains FVP binaries and
error out if not.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-devtools/fvp/fvp-common.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-common.inc b/meta-arm/reci=
pes-devtools/fvp/fvp-common.inc
index e9978c16..9667892b 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-common.inc
+++ b/meta-arm/recipes-devtools/fvp/fvp-common.inc
@@ -20,7 +20,11 @@ FVPDIR =3D "${libdir}/fvp/${BPN}"
=20
 # Used in do_install to create symlinks in $bindir to $FVPDIR
 fvp_link_binaries() {
-    for FVP in ${D}${FVPDIR}/models/${FVP_ARCH}/FVP_*; do
+    DIR=3D"${D}${FVPDIR}/models/${FVP_ARCH}"
+
+    stat $DIR/FVP_* >/dev/null 2>&1 || bbfatal Cannot find FVP binaries =
in $DIR
+
+    for FVP in $DIR/FVP_*; do
         ln -rs $FVP ${D}${bindir}/$(basename $FVP)
     done
     # But not the .so files too
--=20
2.25.1


