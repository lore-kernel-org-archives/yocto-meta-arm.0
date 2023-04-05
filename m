Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E95FC761A6
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 23:22:31 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.146036.1680736950315397693
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Apr 2023 16:22:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4AB3240AC9
	for <meta-arm@lists.yoctoproject.org>; Wed,  5 Apr 2023 23:22:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Kt1hwVNa-m2 for <meta-arm@lists.yoctoproject.org>;
	Wed,  5 Apr 2023 23:22:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2F67D40C5D
	for <meta-arm@lists.yoctoproject.org>; Wed,  5 Apr 2023 23:22:29 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id C6AC61637FC;
	Wed,  5 Apr 2023 19:21:50 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH 4/5] optee-test: add 3.20.0 version
Date: Wed,  5 Apr 2023 23:22:17 +0000
Message-Id: <20230405232218.1563477-4-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230405232218.1563477-1-denis@denix.org>
References: <20230405232218.1563477-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 05 Apr 2023 23:22:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4553

https://github.com/OP-TEE/optee_test/releases/tag/3.20.0

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta-arm/recipes-security/optee/optee-test_3.20.0.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-arm/recipes-security/optee/optee-test_3.20.0.bb

diff --git a/meta-arm/recipes-security/optee/optee-test_3.20.0.bb b/meta-=
arm/recipes-security/optee/optee-test_3.20.0.bb
new file mode 100644
index 00000000..95452b6a
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-test_3.20.0.bb
@@ -0,0 +1,10 @@
+require optee-test.inc
+
+SRC_URI:append =3D " \
+    file://musl-workaround.patch \
+   "
+SRCREV =3D "5db8ab4c733d5b2f4afac3e9aef0a26634c4b444"
+
+EXTRA_OEMAKE:append:libc-musl =3D " OPTEE_OPENSSL_EXPORT=3D${STAGING_INC=
DIR}"
+DEPENDS:append:libc-musl =3D " openssl"
+CFLAGS:append:libc-musl =3D " -Wno-error=3Ddeprecated-declarations"
--=20
2.25.1


