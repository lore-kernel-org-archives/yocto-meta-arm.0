Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBCE6EB64DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 12:25:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6841.1689596710348491064
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Jul 2023 05:25:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38584C15
	for <meta-arm@lists.yoctoproject.org>; Mon, 17 Jul 2023 05:25:53 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C54A83F67D
	for <meta-arm@lists.yoctoproject.org>; Mon, 17 Jul 2023 05:25:09 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/optee-test: modify to use build openssl
Date: Sun, 16 Jul 2023 08:55:39 -0500
Message-Id: <20230716135540.3538990-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 17 Jul 2023 12:25:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4878

By default, optee-test is using an ancient version of openssl (1.2.0o)
in binary form, located in the optee-test build tree.   musl is already
working around this.  So, use those defaults for everyone.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-security/optee/optee-test_3.20.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm/recipes-security/optee/optee-test_3.20.0.bb b/meta-=
arm/recipes-security/optee/optee-test_3.20.0.bb
index 190c2f71..3c868e1d 100644
--- a/meta-arm/recipes-security/optee/optee-test_3.20.0.bb
+++ b/meta-arm/recipes-security/optee/optee-test_3.20.0.bb
@@ -7,6 +7,6 @@ SRC_URI +=3D " \
    "
 SRCREV =3D "5db8ab4c733d5b2f4afac3e9aef0a26634c4b444"
=20
-EXTRA_OEMAKE:append:libc-musl =3D " OPTEE_OPENSSL_EXPORT=3D${STAGING_INC=
DIR}"
-DEPENDS:append:libc-musl =3D " openssl"
-CFLAGS:append:libc-musl =3D " -Wno-error=3Ddeprecated-declarations"
+EXTRA_OEMAKE:append =3D " OPTEE_OPENSSL_EXPORT=3D${STAGING_INCDIR}"
+DEPENDS:append =3D " openssl"
+CFLAGS:append =3D " -Wno-error=3Ddeprecated-declarations"
--=20
2.30.2


