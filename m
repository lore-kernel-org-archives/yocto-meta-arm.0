Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84834C00A8F
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 13:52:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.148342.1698155562185429388
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 06:52:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDE5FC15;
	Tue, 24 Oct 2023 06:53:22 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 352533F762;
	Tue, 24 Oct 2023 06:52:41 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/4] kas/corstone1000: don't limit the FVP use to x86-64
Date: Tue, 24 Oct 2023 14:52:34 +0100
Message-Id: <20231024135236.3510412-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231024135236.3510412-1-ross.burton@arm.com>
References: <20231024135236.3510412-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 24 Oct 2023 13:52:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5163

From: Ross Burton <ross.burton@arm.com>

Now that the FVP supports both aarch64 and x86-64, this inherit doesn't
need to be conditional.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 kas/corstone1000-fvp.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kas/corstone1000-fvp.yml b/kas/corstone1000-fvp.yml
index 7d23a53a..b3e21cd4 100644
--- a/kas/corstone1000-fvp.yml
+++ b/kas/corstone1000-fvp.yml
@@ -10,7 +10,7 @@ local_conf_header:
     fvp-config: |
         # Remove Dropbear SSH as it will not fit into the corstone1000 i=
mage.
         IMAGE_FEATURES:remove =3D " ssh-server-dropbear"
-        INHERIT =3D " ${@bb.utils.contains('BUILD_ARCH', 'x86_64', 'fvpb=
oot', '', d)}"
+        INHERIT +=3D "fvpboot"
=20
 target:
   - corstone1000-image
--=20
2.34.1


