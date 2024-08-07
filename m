Return-Path: <mariam.elshakfy@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 399E6C52D6F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 20:44:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.44222.1723063434283703390
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 07 Aug 2024 13:43:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mariam.elshakfy@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62B85FEC;
	Wed,  7 Aug 2024 13:44:19 -0700 (PDT)
Received: from Ubuntu.arm.com (unknown [10.57.95.92])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1930A3F766;
	Wed,  7 Aug 2024 13:43:52 -0700 (PDT)
From: mariam.elshakfy@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Mariam Elshakfy <mariam.elshakfy@arm.com>
Subject: [PATCH] arm/trusted-services: Move ts-newlib compilation fix to meta-arm
Date: Wed,  7 Aug 2024 21:43:43 +0100
Message-Id: <20240807204343.4267-1-mariam.elshakfy@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 07 Aug 2024 20:44:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5957

From: Mariam Elshakfy <mariam.elshakfy@arm.com>

This change moves ts-newlib compilation fix from
meta-arm-bsp to meta-arm, as this compilation failure
is not specific to meta-arm-bsp platforms.

Signed-off-by: Mariam Elshakfy <mariam.elshakfy@arm.com>
---
 .../recipes-security/trusted-services/ts-newlib_%.bbappend     | 1 -
 meta-arm/recipes-security/trusted-services/ts-newlib_4.1.0.bb  | 3 +++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-newlib_%.b=
bappend b/meta-arm-bsp/recipes-security/trusted-services/ts-newlib_%.bbap=
pend
index e861426a..708f5986 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-newlib_%.bbappend
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-newlib_%.bbappend
@@ -4,6 +4,5 @@ COMPATIBLE_MACHINE:corstone1000 =3D "corstone1000"
 SRC_URI:append:corstone1000 =3D " \
   file://0001-newlib-memcpy-remove-optimized-version.patch;patchdir=3D..=
/newlib \
 "
-export NEWLIB_CFLAGS_TARGET =3D "-Wno-implicit-function-declaration -Wno=
-int-conversion"
=20
 COMPATIBLE_MACHINE:fvp-base =3D "fvp-base"
diff --git a/meta-arm/recipes-security/trusted-services/ts-newlib_4.1.0.b=
b b/meta-arm/recipes-security/trusted-services/ts-newlib_4.1.0.bb
index 669e87ae..866276b3 100644
--- a/meta-arm/recipes-security/trusted-services/ts-newlib_4.1.0.bb
+++ b/meta-arm/recipes-security/trusted-services/ts-newlib_4.1.0.bb
@@ -20,6 +20,9 @@ EXTRA_OECMAKE +=3D '-DNEWLIB_SOURCE_DIR=3D${WORKDIR}/gi=
t/newlib \
=20
 OECMAKE_SOURCEPATH =3D "${S}/deployments/newlib/${TS_ENV}/"
=20
+# Silence compilation errors from GCC 14.1 due to stricter code validati=
on
+export NEWLIB_CFLAGS_TARGET =3D "-Wno-implicit-function-declaration -Wno=
-int-conversion"
+
 # TS ships a patch that needs to be applied to newlib
 apply_ts_patch() {
     ( cd ${WORKDIR}/git/newlib;    git stash; git branch -f bf_am; git a=
m ${S}/external/newlib/*.patch; git reset bf_am )
--=20
2.34.1


