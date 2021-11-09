Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F29C433F5
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 14:44:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.12979.1636469085181851443
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Nov 2021 06:44:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 575772B
	for <meta-arm@lists.yoctoproject.org>; Tue,  9 Nov 2021 06:44:44 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E14053F800
	for <meta-arm@lists.yoctoproject.org>; Tue,  9 Nov 2021 06:44:43 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/4] arm/trusted-firmware-a: ensure native cert_create has
 -rpath
Date: Tue,  9 Nov 2021 14:44:38 +0000
Message-Id: <20211109144441.24512-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 09 Nov 2021 14:44:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2347

Patch in BUILD_LDFLAGS into the cert_create Makefile so that the -rpath
arguments are passed to the native build, meaning it can find libssl
correctly.  This somewhat worked previously as the host libssl and
sysroot libssl matched, but now that OE has OpenSSL 3 that often isn't
the case.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 39b51566..243e641c 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -152,10 +152,11 @@ BUILD_DIR .=3D "${@'/${TFA_BOARD}' if d.getVar('TFA=
_BOARD') else ''}"
 BUILD_DIR .=3D "/${@'debug' if d.getVar("TFA_DEBUG") =3D=3D '1' else 're=
lease'}"
=20
 do_compile() {
-    # This is still needed to have the native fiptool executing properly=
 by
+    # This is still needed to have the native tools executing properly b=
y
     # setting the RPATH
     sed -i '/^LDLIBS/ s,$, \$\{BUILD_LDFLAGS},' ${S}/tools/fiptool/Makef=
ile
     sed -i '/^INCLUDE_PATHS/ s,$, \$\{BUILD_CFLAGS},' ${S}/tools/fiptool=
/Makefile
+    sed -i '/^LIB/ s,$, \$\{BUILD_LDFLAGS},' ${S}/tools/cert_create/Make=
file
=20
     # Currently there are races if you build all the targets at once in =
parallel
     for T in ${TFA_BUILD_TARGET}; do
--=20
2.25.1


