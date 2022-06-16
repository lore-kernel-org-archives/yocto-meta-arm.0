Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17EDDC433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Jun 2022 11:23:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.16620.1655378575321199760
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Jun 2022 04:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC9F112FC;
	Thu, 16 Jun 2022 04:22:54 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23DBA3F73B;
	Thu, 16 Jun 2022 04:22:54 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/3] arm-toolchain/androidclang: strip meaningless RPATHS
Date: Thu, 16 Jun 2022 12:22:50 +0100
Message-Id: <20220616112252.3326107-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 16 Jun 2022 11:23:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3507

As per [1], target builds of androidclang produce useless-rpath errors.

/usr/share/clang-r416183b/python3/lib/python3.9/lib-dynload/_posixsubproc=
ess.cpython-39-x86_64-linux-gnu.so
contains probably-redundant RPATH /../lib [useless-rpaths]

Those RPATHs are of no use, so we can remove them entirely.

[1] https://errors.yoctoproject.org/Errors/Details/640604/

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../external-arm-toolchain/androidclang_r416183b.bb           | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/a=
ndroidclang_r416183b.bb b/meta-arm-toolchain/recipes-devtools/external-ar=
m-toolchain/androidclang_r416183b.bb
index 82133886..c8640d76 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/androidc=
lang_r416183b.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/androidc=
lang_r416183b.bb
@@ -33,6 +33,8 @@ do_install() {
     install -d ${D}${datadir}/${ANDROID_CLANG_VERSION}/
=20
     cp --no-preserve=3Downership -r ${S}/. ${D}${datadir}/${ANDROID_CLAN=
G_VERSION}/
+    # Strip bad RPATHs in the embedded python3
+    chrpath -d ${D}${datadir}/${ANDROID_CLANG_VERSION}/python3/lib/pytho=
n*/lib-dynload/*.so
=20
     install -d ${D}${bindir}
     # Symlink all executables into bindir
@@ -43,7 +45,7 @@ do_install() {
=20
 INHIBIT_DEFAULT_DEPS =3D "1"
=20
-INSANE_SKIP:${PN} =3D "already-stripped libdir staticdev file-rdeps arch=
 dev-so useless-rpaths"
+INSANE_SKIP:${PN} =3D "already-stripped libdir staticdev file-rdeps arch=
 dev-so"
=20
 INHIBIT_SYSROOT_STRIP =3D "1"
 INHIBIT_PACKAGE_STRIP =3D "1"
--=20
2.25.1


