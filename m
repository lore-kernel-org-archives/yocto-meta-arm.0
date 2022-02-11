Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CDE7C433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 10:55:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.5822.1644576944280576456
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Feb 2022 02:55:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A914311D4
	for <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 02:55:43 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A2093F73B
	for <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 02:55:43 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm-bsp/corstone500: move to linux-yocto 5.4
Date: Fri, 11 Feb 2022 10:55:38 +0000
Message-Id: <20220211105539.2483533-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211105539.2483533-1-ross.burton@arm.com>
References: <20220211105539.2483533-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 10:55:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2978

Upgrade from 5.3.18 to to 5.4, a maintained stable release.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/corstone500.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/conf/machine/corstone500.conf b/meta-arm-bsp/co=
nf/machine/corstone500.conf
index 384a8dcf..44e93288 100644
--- a/meta-arm-bsp/conf/machine/corstone500.conf
+++ b/meta-arm-bsp/conf/machine/corstone500.conf
@@ -12,7 +12,7 @@ require conf/machine/include/arm/armv7a/tune-cortexa5.i=
nc
 # apply.
 #
 PREFERRED_PROVIDER_virtual/kernel:forcevariable =3D "linux-yocto"
-PREFERRED_VERSION_linux-yocto ?=3D "5.3%"
+PREFERRED_VERSION_linux-yocto ?=3D "5.4%"
=20
 EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a u-boot"
=20
--=20
2.25.1


