Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 679D5EB64DD
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 18:33:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1949.1691087631156538637
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Aug 2023 11:33:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 043E3113E;
	Thu,  3 Aug 2023 11:34:33 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 73CB53F793;
	Thu,  3 Aug 2023 11:33:49 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/5] arm-toolchain/arm-binary-toolchain: install to a versioned directory
Date: Thu,  3 Aug 2023 19:33:44 +0100
Message-Id: <20230803183347.3414946-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230803183347.3414946-1-ross.burton@arm.com>
References: <20230803183347.3414946-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 03 Aug 2023 18:33:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4930

From: Ross Burton <ross.burton@arm.com>

So that it's obvious which version of GCC is being used, install the
files into a versioned directory under $libexecdir.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../external-arm-toolchain/arm-binary-toolchain.inc         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/a=
rm-binary-toolchain.inc b/meta-arm-toolchain/recipes-devtools/external-ar=
m-toolchain/arm-binary-toolchain.inc
index 44adfc8b..0e039a5b 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-bina=
ry-toolchain.inc
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-bina=
ry-toolchain.inc
@@ -5,11 +5,11 @@ FILES:${PN} =3D "${libexecdir} ${bindir}"
 BINNAME =3D "${@d.getVar("BPN").strip("gcc-")}"
=20
 do_install() {
-    install -d ${D}${bindir} ${D}${libexecdir}/${BPN}/
-    cp -r ${S}/. ${D}${libexecdir}/${BPN}
+    install -d ${D}${bindir} ${D}${libexecdir}/${BP}/
+    cp -r ${S}/. ${D}${libexecdir}/${BP}
=20
     # Symlink all executables into bindir
-    for f in ${D}${libexecdir}/${BPN}/bin/*; do
+    for f in ${D}${libexecdir}/${BP}/bin/*; do
         ln -rs $f ${D}${bindir}/$(basename $f)
     done
 }
--=20
2.34.1


