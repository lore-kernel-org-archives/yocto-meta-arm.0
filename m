Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6892FC433FE
	for <webhook@archiver.kernel.org>; Thu, 25 Nov 2021 17:34:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.14884.1637861643755333279
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 25 Nov 2021 09:34:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5644A113E
	for <meta-arm@lists.yoctoproject.org>; Thu, 25 Nov 2021 09:34:03 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 022933F73B
	for <meta-arm@lists.yoctoproject.org>; Thu, 25 Nov 2021 09:34:02 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm/optee-test: change DEPENDS to optee-os-tadevkit
Date: Thu, 25 Nov 2021 17:33:59 +0000
Message-Id: <20211125173400.1285847-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125173400.1285847-1-ross.burton@arm.com>
References: <20211125173400.1285847-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 25 Nov 2021 17:34:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2457

Now that the TA devkit has been split out of optee-os, the build
dependencies of optee-test need to be updated too.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-security/optee/optee-test.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-arm/re=
cipes-security/optee/optee-test.inc
index b5dfff42..94cf46ff 100644
--- a/meta-arm/recipes-security/optee/optee-test.inc
+++ b/meta-arm/recipes-security/optee/optee-test.inc
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://${S}/LICENSE.md;md5=3Ddaa2bc=
ccc666345ab8940aab1315a4fa"
 inherit python3native ptest
 require optee.inc
=20
-DEPENDS =3D "optee-client optee-os python3-pycryptodome-native"
+DEPENDS =3D "optee-client optee-os-tadevkit python3-pycryptodome-native"
=20
 SRC_URI =3D "git://github.com/OP-TEE/optee_test.git;branch=3Dmaster;prot=
ocol=3Dhttps \
            file://run-ptest \
--=20
2.25.1


