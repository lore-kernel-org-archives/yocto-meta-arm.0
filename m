Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE147C27C79
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 15:05:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12069.1718118326094252707
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 Jun 2024 08:05:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 596F1106F
	for <meta-arm@lists.yoctoproject.org>; Tue, 11 Jun 2024 08:05:50 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 798683F64C
	for <meta-arm@lists.yoctoproject.org>; Tue, 11 Jun 2024 08:05:25 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 6/6] arm/test-pacbti: Use UNPACKDIR
Date: Tue, 11 Jun 2024 15:05:19 +0000
Message-Id: <20240611150519.1940896-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240611150519.1940896-1-ross.burton@arm.com>
References: <20240611150519.1940896-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 11 Jun 2024 15:05:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5800

From: Ryan Eatmon <reatmon@ti.com>

Fix parsing recipes error:

  Parsing recipes...
  ERROR: meta-arm/recipes-test/pacbti/test-pacbti.bb: Using S =3D ${WORKD=
IR} is no longer supported
  ERROR: Parsing halted due to errors, see error messages above

There was a change in oe-core [1] and was further discussed here [2].

[1]  https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster&id=
=3D32cba1cc916ad530c5e6630a927e74ca6f06289b
[2] https://lists.openembedded.org/g/openembedded-architecture/message/20=
07

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arm/recipes-test/pacbti/test-pacbti.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-test/pacbti/test-pacbti.bb b/meta-arm/recip=
es-test/pacbti/test-pacbti.bb
index 331c5854..b0ce1988 100644
--- a/meta-arm/recipes-test/pacbti/test-pacbti.bb
+++ b/meta-arm/recipes-test/pacbti/test-pacbti.bb
@@ -4,7 +4,8 @@ LIC_FILES_CHKSUM =3D "file://pacbti.c;beginline=3D2;endli=
ne=3D2;md5=3D6ec41034e04432ee37
=20
 SRC_URI =3D "file://pacbti.c"
=20
-S =3D "${WORKDIR}"
+S =3D "${WORKDIR}/sources"
+UNPACKDIR =3D "${S}"
=20
 do_compile() {
     # Compile with -zforce-bti with fatal warnings, so the link fails if=
 PAC/BTI
--=20
2.34.1


