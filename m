Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E34CEACF8
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 18:39:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.89494.1727807946990249771
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Oct 2024 11:39:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0C9BDA7
	for <meta-arm@lists.yoctoproject.org>; Tue,  1 Oct 2024 11:39:35 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 369DF3F58B
	for <meta-arm@lists.yoctoproject.org>; Tue,  1 Oct 2024 11:39:06 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/5] arm/arm-ffa-user: update to 5.0.2
Date: Tue,  1 Oct 2024 14:39:01 -0400
Message-Id: <20241001183903.13457-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241001183903.13457-1-jon.mason@arm.com>
References: <20241001183903.13457-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 01 Oct 2024 18:39:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6158

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../{arm-ffa-user_5.0.1.bb =3D> arm-ffa-user_5.0.2.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-arm/recipes-kernel/arm-ffa-user/{arm-ffa-user_5.0.1.bb =3D> =
arm-ffa-user_5.0.2.bb} (94%)

diff --git a/meta-arm/recipes-kernel/arm-ffa-user/arm-ffa-user_5.0.1.bb b=
/meta-arm/recipes-kernel/arm-ffa-user/arm-ffa-user_5.0.2.bb
similarity index 94%
rename from meta-arm/recipes-kernel/arm-ffa-user/arm-ffa-user_5.0.1.bb
rename to meta-arm/recipes-kernel/arm-ffa-user/arm-ffa-user_5.0.2.bb
index 726a65bb9adc..741a410ba614 100644
--- a/meta-arm/recipes-kernel/arm-ffa-user/arm-ffa-user_5.0.1.bb
+++ b/meta-arm/recipes-kernel/arm-ffa-user/arm-ffa-user_5.0.2.bb
@@ -11,8 +11,8 @@ SRC_URI =3D "git://gitlab.arm.com/linux-arm/linux-trust=
ed-services;protocol=3Dhttps;
           "
 S =3D "${WORKDIR}/git"
=20
-# Tag debugfs-v5.0.1
-SRCREV =3D "18e3be71f65a405dfb5d97603ae71b3c11759861"
+# Tag debugfs-v5.0.2
+SRCREV =3D "885af0d1c3bf11aba12320d5484429160a9b9f26"
=20
 COMPATIBLE_HOST =3D "(arm|aarch64).*-linux"
 KERNEL_MODULE_AUTOLOAD +=3D "arm-ffa-user"
--=20
2.39.5 (Apple Git-154)


