Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E4DDC433F5
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 14:25:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.61585.1638195904790670088
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Nov 2021 06:25:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F3031042
	for <meta-arm@lists.yoctoproject.org>; Mon, 29 Nov 2021 06:25:04 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2ACE93F766
	for <meta-arm@lists.yoctoproject.org>; Mon, 29 Nov 2021 06:25:04 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/optee-spdevkit: fix non-corstone1000 builds
Date: Mon, 29 Nov 2021 14:25:01 +0000
Message-Id: <20211129142502.4019213-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Nov 2021 14:25:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2478

This recipe was setting a default SRCREV which doesn't contain the
Secure Partition devkit, as this is only in the psa-development branch
on the trustedfirmware.org mirror which is set by the corstone1000
bbappend.

Use this branch/revision by default, and set the PV correctly: this
branch is currently based on optee-os 3.10 not 3.14.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-security/optee/optee-spdevkit_git.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/optee/optee-spdevkit_git.bb b/meta=
-arm/recipes-security/optee/optee-spdevkit_git.bb
index a9c696d3..f23cfa7a 100644
--- a/meta-arm/recipes-security/optee/optee-spdevkit_git.bb
+++ b/meta-arm/recipes-security/optee/optee-spdevkit_git.bb
@@ -14,7 +14,10 @@ DEPENDS =3D "python3-pycryptodome-native python3-pycry=
ptodomex-native python3-pyel
=20
 DEPENDS:append:toolchain-clang =3D " compiler-rt"
=20
-SRC_URI =3D "git://github.com/OP-TEE/optee_os.git;branch=3Dmaster;protoc=
ol=3Dhttps"
+# spdevkit isn't yet merged to master
+SRC_URI =3D "git://git.trustedfirmware.org/OP-TEE/optee_os.git;protocol=3D=
https;branch=3Dpsa-development"
+SRCREV =3D "f9de2c9520ed97b89760cc4c99424aae440b63f4"
+PV =3D "3.10+git${SRCPV}"
=20
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build"
--=20
2.25.1


