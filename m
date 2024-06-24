Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57F36C2BD09
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 14:16:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.141812.1719238559279563649
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Jun 2024 07:15:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6EAADA7
	for <meta-arm@lists.yoctoproject.org>; Mon, 24 Jun 2024 07:16:23 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A2BC13F73B
	for <meta-arm@lists.yoctoproject.org>; Mon, 24 Jun 2024 07:15:58 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-toolchain: fix for WORKDIR changes
Date: Mon, 24 Jun 2024 10:15:57 -0400
Message-Id: <20240624141557.34033-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Jun 2024 14:16:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5842

Fallout from the upstream WORKDIR changes.  do_copy_locale expects
SUPPORTED to be in WORKDIR, but recent changes have made it so that the
source/unpack location is no  longer WORKDIR and cannot be pointed to
be such.  So, do this copy manually here.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../external-arm-toolchain/external-arm-toolchain.bb      | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/e=
xternal-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-a=
rm-toolchain/external-arm-toolchain.bb
index 49ad74427010..1e8c1116e834 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external=
-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external=
-arm-toolchain.bb
@@ -56,8 +56,16 @@ PV =3D "${EAT_VER_MAIN}"
 BINV =3D "${EAT_VER_GCC}"
=20
 SRC_URI =3D "file://SUPPORTED"
+S =3D "${WORKDIR}/sources"
+UNPACKDIR =3D "${S}"
=20
 do_install() {
+        # do_copy_locale expects SUPPORTED to be in WORKDIR, but recent
+        # changes have made it so that the source/unpack location is no
+        # longer WORKDIR and cannot be pointed to be such.  So, do this
+        # copy manually here
+        install -m 0644 ${UNPACKDIR}/SUPPORTED ${WORKDIR}/SUPPORTED
+
 	# Add stubs for files OE-core expects
 	install -d ${S}/nscd/
 	touch  ${S}/nscd/nscd.init
--=20
2.39.3 (Apple Git-146)


