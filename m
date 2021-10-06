Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF34C433FE
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 15:38:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.13848.1633534702173677044
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 06 Oct 2021 08:38:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3976ED1
	for <meta-arm@lists.yoctoproject.org>; Wed,  6 Oct 2021 08:38:21 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F5A63F66F
	for <meta-arm@lists.yoctoproject.org>; Wed,  6 Oct 2021 08:38:21 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/4] arm/gn: remove nativesdk
Date: Wed,  6 Oct 2021 16:38:16 +0100
Message-Id: <20211006153818.3948831-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006153818.3948831-1-ross.burton@arm.com>
References: <20211006153818.3948831-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 06 Oct 2021 15:38:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2259

Building GN in a SDK environment isn't as trivial, as it needs to know
the target configuration it should inherit cross-canadian. Also, building
for mingw32 hosts breaks the build.

For now there's no immediate need for GN in nativesdk, so remove it.

Change-Id: I3b969639fa8ad7780c53ae2bc8a3f166773ee4b9
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-devtools/gn/gn_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-arm/recipes-devtools/gn/gn_git.bb b/meta-arm/recipes-de=
vtools/gn/gn_git.bb
index d20428b7..93c3dc01 100644
--- a/meta-arm/recipes-devtools/gn/gn_git.bb
+++ b/meta-arm/recipes-devtools/gn/gn_git.bb
@@ -22,7 +22,6 @@ do_configure[cleandirs] +=3D "${B}"
 do_configure() {
     python3 ${S}/build/gen.py \
         --platform=3D${TARGET_OS} \
-        --host=3D${HOST_OS} \
         --out-path=3D${B} \
         --no-strip
 }
@@ -36,4 +35,4 @@ do_install() {
     install ${B}/gn ${D}${bindir}
 }
=20
-BBCLASSEXTEND =3D "native nativesdk"
+BBCLASSEXTEND =3D "native"
--=20
2.25.1


