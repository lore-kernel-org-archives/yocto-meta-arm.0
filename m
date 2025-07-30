Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0312C87FCC
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 11:54:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.33480.1753876442826469574
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 30 Jul 2025 04:54:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D76E2573;
	Wed, 30 Jul 2025 04:53:54 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.25.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A900F3F66E;
	Wed, 30 Jul 2025 04:54:01 -0700 (PDT)
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Ali Can Ozaslan <ali.oezaslan@arm.com>
Subject: [PATCH 12/13] arm/edk2-basetools-native: WORKDIR fix
Date: Wed, 30 Jul 2025 12:53:26 +0100
Message-Id: <20250730115327.3671160-13-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250730115327.3671160-1-harsimransingh.tungal@arm.com>
References: <20250730115327.3671160-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 30 Jul 2025 11:54:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6649

From: Ali Can Ozaslan <ali.oezaslan@arm.com>

Upstream has removed the need to explicitly set S =3D "${WORKDIR}/git",
and now defaults to S =3D "${UNPACKDIR}". As a result, directly referenci=
ng
${WORKDIR}/git will fail when the source is unpacked elsewhere.

Update do_install() to use ${S}/BaseTools instead of the hardcoded path.

This issue was previously unnoticed as EDK2 tools (e.g. GenerateCapsule)
were not being used in the build path at the time of the earlier refactor
(commit eea74860).

Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
---
 meta-arm/recipes-bsp/uefi/edk2-basetools-native_202502.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202502.bb b/=
meta-arm/recipes-bsp/uefi/edk2-basetools-native_202502.bb
index e9e48217..0c08fce7 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202502.bb
+++ b/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202502.bb
@@ -20,5 +20,5 @@ RDEPENDS:${PN} +=3D "python3-core"
=20
 do_install () {
     mkdir -p ${D}${bindir}/edk2-BaseTools
-    cp -r ${WORKDIR}/git/BaseTools/* ${D}${bindir}/edk2-BaseTools/
+    cp -r ${S}/BaseTools/* ${D}${bindir}/edk2-BaseTools/
 }

