Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66A69C433EF
	for <webhook@archiver.kernel.org>; Thu, 25 Nov 2021 17:34:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.14883.1637861643197998886
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 25 Nov 2021 09:34:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4A061042
	for <meta-arm@lists.yoctoproject.org>; Thu, 25 Nov 2021 09:34:02 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F30A3F73B
	for <meta-arm@lists.yoctoproject.org>; Thu, 25 Nov 2021 09:34:02 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm/optee-test: use precise BSD license
Date: Thu, 25 Nov 2021 17:33:58 +0000
Message-Id: <20211125173400.1285847-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 25 Nov 2021 17:34:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2456

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-security/optee/optee-test.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-arm/re=
cipes-security/optee/optee-test.inc
index 99656a14..b5dfff42 100644
--- a/meta-arm/recipes-security/optee/optee-test.inc
+++ b/meta-arm/recipes-security/optee/optee-test.inc
@@ -2,7 +2,7 @@ SUMMARY =3D "OP-TEE sanity testsuite"
 DESCRIPTION =3D "Open Portable Trusted Execution Environment - Test suit=
e"
 HOMEPAGE =3D "https://www.op-tee.org/"
=20
-LICENSE =3D "BSD & GPLv2"
+LICENSE =3D "BSD-2-Clause & GPLv2"
 LIC_FILES_CHKSUM =3D "file://${S}/LICENSE.md;md5=3Ddaa2bcccc666345ab8940=
aab1315a4fa"
=20
 inherit python3native ptest
--=20
2.25.1


