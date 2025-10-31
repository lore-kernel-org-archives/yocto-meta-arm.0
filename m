Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D735CCF9FE
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 14:21:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.16824.1761920516380741883
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 31 Oct 2025 07:21:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A7191595
	for <meta-arm@lists.yoctoproject.org>; Fri, 31 Oct 2025 07:21:48 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 90CCD3F673
	for <meta-arm@lists.yoctoproject.org>; Fri, 31 Oct 2025 07:21:55 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/trusted-services: use SHA, not tag name
Date: Fri, 31 Oct 2025 14:21:53 +0000
Message-ID: <20251031142153.2226419-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 31 Oct 2025 14:21:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6748

It turns out that the base SRCREV for trusted-services is a tag name,
which meant it was hitting the network on every build. Use the SHA
instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-security/trusted-services/trusted-services-src.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/trusted-services/trusted-services-=
src.inc b/meta-arm/recipes-security/trusted-services/trusted-services-src=
.inc
index 210086fe31..4d10f6ea24 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
@@ -13,7 +13,8 @@ SRC_URI:append =3D "\
     file://0005-cpputest-fix-cmake-4.0-compatibility.patch \
 "
=20
-SRCREV_trusted-services =3D "v1.2.0"
+# v1.2.0
+SRCREV_trusted-services =3D "0d55b4c7a8e53958271feb7341e928853b7914cf"
 LIC_FILES_CHKSUM =3D "file://${S}/license.rst;md5=3Dea160bac7f690a069c60=
8516b17997f4"
=20
 S =3D "${UNPACKDIR}/trusted-services"
--=20
2.43.0


