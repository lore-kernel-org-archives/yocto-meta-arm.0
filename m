Return-Path: <ali.oezaslan@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22CD1C54E64
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 11:19:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.13244.1711624749889869716
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 Mar 2024 04:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ali.oezaslan@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5321415A1;
	Thu, 28 Mar 2024 04:19:43 -0700 (PDT)
Received: from PW05BKJD.arm.com (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 07A963F7BD;
	Thu, 28 Mar 2024 04:19:08 -0700 (PDT)
From: ali.oezaslan@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Ali Can Ozaslan <ali.oezaslan@arm.com>
Subject: [PATCH 1/1] arm-bsp/trusted-firmware-a: n1sdp: update to 2.10
Date: Thu, 28 Mar 2024 11:18:41 +0000
Message-Id: <20240328111841.1960-2-ali.oezaslan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240328111841.1960-1-ali.oezaslan@arm.com>
References: <20240328111841.1960-1-ali.oezaslan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 28 Mar 2024 11:19:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5498

From: Ali Can Ozaslan <ali.oezaslan@arm.com>

This change upgrades the trusted-firmware-m version to 2.10
for n1sdp.

Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/mac=
hine/n1sdp.conf
index fa6d6f7f..662cf62c 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -27,7 +27,7 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "linux-firmware-r=
tl8168"
 # TF-A
 EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a"
 TFA_PLATFORM =3D "n1sdp"
-PREFERRED_VERSION_trusted-firmware-a ?=3D "2.9.%"
+PREFERRED_VERSION_trusted-firmware-a ?=3D "2.10.%"
 PREFERRED_VERSION_tf-a-tests ?=3D "2.10.%"
=20
 # SCP
--=20
2.34.1


