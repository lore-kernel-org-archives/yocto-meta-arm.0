Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19495C43334
	for <webhook@archiver.kernel.org>; Thu, 16 Jun 2022 11:23:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.16746.1655378576142057636
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Jun 2022 04:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A45413D5;
	Thu, 16 Jun 2022 04:22:55 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C564A3F73B;
	Thu, 16 Jun 2022 04:22:54 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/3] arm-toolchain/androidclang: move to libexecdir
Date: Thu, 16 Jun 2022 12:22:51 +0100
Message-Id: <20220616112252.3326107-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220616112252.3326107-1-ross.burton@arm.com>
References: <20220616112252.3326107-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 16 Jun 2022 11:23:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3508

Binaries shouldn't be in datadir, and now the RPATHs are being cleared
we can put them in libexecdir.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../external-arm-toolchain/androidclang_r416183b.bb  | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/a=
ndroidclang_r416183b.bb b/meta-arm-toolchain/recipes-devtools/external-ar=
m-toolchain/androidclang_r416183b.bb
index c8640d76..963fd60e 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/androidc=
lang_r416183b.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/androidc=
lang_r416183b.bb
@@ -25,20 +25,18 @@ BB_STRICT_CHECKSUM =3D "ignore"
=20
 S =3D "${WORKDIR}/${ANDROID_CLANG_VERSION}"
=20
-FILES:${PN} =3D "${datadir} ${bindir}"
+FILES:${PN} =3D "${libexecdir} ${bindir}"
=20
 do_install() {
-    # We should really use ${libexecdir} here, but that as some files ha=
ve invalid RPATH
-    # this results in lots of warning. So using ${datadir} for now
-    install -d ${D}${datadir}/${ANDROID_CLANG_VERSION}/
+    install -d ${D}${libexecdir}/${ANDROID_CLANG_VERSION}/
=20
-    cp --no-preserve=3Downership -r ${S}/. ${D}${datadir}/${ANDROID_CLAN=
G_VERSION}/
+    cp --no-preserve=3Downership -r ${S}/. ${D}${libexecdir}/${ANDROID_C=
LANG_VERSION}/
     # Strip bad RPATHs in the embedded python3
-    chrpath -d ${D}${datadir}/${ANDROID_CLANG_VERSION}/python3/lib/pytho=
n*/lib-dynload/*.so
+    chrpath -d ${D}${libexecdir}/${ANDROID_CLANG_VERSION}/python3/lib/py=
thon*/lib-dynload/*.so
=20
     install -d ${D}${bindir}
     # Symlink all executables into bindir
-    for f in ${D}${datadir}/${ANDROID_CLANG_VERSION}/bin/*; do
+    for f in ${D}${libexecdir}/${ANDROID_CLANG_VERSION}/bin/*; do
         ln -rs $f ${D}${bindir}/$(basename $f)
     done
 }
--=20
2.25.1


