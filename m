Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C34DC433F5
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 15:38:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.13994.1633534702027694780
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 06 Oct 2021 08:38:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D3816D
	for <meta-arm@lists.yoctoproject.org>; Wed,  6 Oct 2021 08:38:21 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ECC583F66F
	for <meta-arm@lists.yoctoproject.org>; Wed,  6 Oct 2021 08:38:20 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/4] arm/gn: don't build with clang
Date: Wed,  6 Oct 2021 16:38:15 +0100
Message-Id: <20211006153818.3948831-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 06 Oct 2021 15:38:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2258

It appears that GN doesn't like to be built with Clang, so disable that
for now.

Change-Id: I01d1d2bf0d646d0841c5f291f07de80837a9a998
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-devtools/gn/gn_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arm/recipes-devtools/gn/gn_git.bb b/meta-arm/recipes-de=
vtools/gn/gn_git.bb
index 5962b2d5..d20428b7 100644
--- a/meta-arm/recipes-devtools/gn/gn_git.bb
+++ b/meta-arm/recipes-devtools/gn/gn_git.bb
@@ -13,6 +13,11 @@ B =3D "${WORKDIR}/build"
=20
 # TODO: os map like meson. mingw32 -> mingw
=20
+# Currently fails to build with clang, eg:
+# https://errors.yoctoproject.org/Errors/Details/610602/
+# https://errors.yoctoproject.org/Errors/Details/610486/
+TOOLCHAIN =3D "gcc"
+
 do_configure[cleandirs] +=3D "${B}"
 do_configure() {
     python3 ${S}/build/gen.py \
--=20
2.25.1


