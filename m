Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A44F2EB105B
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 14:19:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41185.1773152388853450419
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 Mar 2026 07:19:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4127616A3
	for <meta-arm@lists.yoctoproject.org>; Tue, 10 Mar 2026 07:19:42 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1FAED3F7BD
	for <meta-arm@lists.yoctoproject.org>; Tue, 10 Mar 2026 07:19:48 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/fvp-corstone-1000-a320: trim Python install instead of using INSANE_SKIP
Date: Tue, 10 Mar 2026 14:19:43 +0000
Message-ID: <20260310141943.1590585-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310141943.1590585-1-ross.burton@arm.com>
References: <20260310141943.1590585-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 10 Mar 2026 14:19:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6945

The INSANE_SKIPs were not sufficient because the chrpath code used in
nativesdk builds still warns, so instead of hiding the warnings fix them
instead: remove the pointless RPATHs in the embedded Python libaries,
and delete the static libraries.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-devtools/fvp/fvp-corstone1000-a320.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-corstone1000-a320.bb b/met=
a-arm/recipes-devtools/fvp/fvp-corstone1000-a320.bb
index f3093d7173..c266abc4f1 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-corstone1000-a320.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-corstone1000-a320.bb
@@ -19,6 +19,10 @@ LIC_FILES_CHKSUM =3D "\
     file://license_terms/third_party_licenses/third_party_licenses.txt;m=
d5=3Da5ce56e117d0ab63791fbb7c35ec2211 \
 "
=20
+do_install:append() {
+    # This FVP embeds a Python runtime, so clean up RPATHs and remove po=
intless static libraries
+    chrpath --delete ${D}${FVPDIR}/python/lib/python*/lib-dynload/*.so
+    find ${D}${FVPDIR}/python/ -name *.a -delete
+}
+
 COMPATIBLE_HOST =3D "(aarch64|x86_64).*-linux"
-INSANE_SKIP:${PN} +=3D "staticdev rpaths useless-rpaths"
-INSANE_SKIP:nativesdk-${PN} +=3D "staticdev rpaths useless-rpaths"
--=20
2.43.0


