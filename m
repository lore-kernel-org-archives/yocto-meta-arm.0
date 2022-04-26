Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F1BC433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 12:14:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.5335.1650975288613062554
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 05:14:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B911323A;
	Tue, 26 Apr 2022 05:14:47 -0700 (PDT)
Received: from e125920.arm.com (unknown [10.57.95.219])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E35363F774;
	Tue, 26 Apr 2022 05:14:46 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH] kas/fvp-baser-aemv8r64: Install ssh-pregen-hostkeys
Date: Tue, 26 Apr 2022 13:14:43 +0100
Message-Id: <20220426121443.3093156-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 26 Apr 2022 12:14:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3300

From: Peter Hoyes <Peter.Hoyes@arm.com>

We already install ssh-server-openssh with the default Kas config for
the fvp-baser-aemv8r64, so install ssh-pregen-hostkeys too to improve
boot time.

Issue-Id: SCM-4304
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I08962585efb88ea56d8ff7b5a34c4a1beda2e3e3
---
 kas/fvp-baser-aemv8r64-bsp.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kas/fvp-baser-aemv8r64-bsp.yml b/kas/fvp-baser-aemv8r64-bsp.=
yml
index 0958c9b..dd175d0 100644
--- a/kas/fvp-baser-aemv8r64-bsp.yml
+++ b/kas/fvp-baser-aemv8r64-bsp.yml
@@ -33,6 +33,7 @@ local_conf_header:
     PACKAGE_CLASSES =3D "package_ipk"
     PACKAGECONFIG:remove:pn-qemu-system-native =3D "gtk+ sdl"
     EXTRA_IMAGE_FEATURES:append =3D " debug-tweaks ssh-server-openssh"
+    CORE_IMAGE_EXTRA_INSTALL:append =3D " ssh-pregen-hostkeys"
     LICENSE_FLAGS_ACCEPTED:append =3D " ${@oe.utils.vartrue('FVP_BASE_R_=
ARM_EULA_ACCEPT', 'Arm-FVP-EULA', '', d)}"
     IMAGE_CLASSES:append =3D " testimage"
=20
--=20
2.25.1


