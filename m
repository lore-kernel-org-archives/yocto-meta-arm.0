Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC70C433F5
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 15:25:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9678.1634743534372806203
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 20 Oct 2021 08:25:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 561491063
	for <meta-arm@lists.yoctoproject.org>; Wed, 20 Oct 2021 08:25:27 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F16E53F73D
	for <meta-arm@lists.yoctoproject.org>; Wed, 20 Oct 2021 08:25:26 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][master 2/5] arm/trusted-firmware-m: enabling PACKAGECONFIG
 when using CMake
Date: Wed, 20 Oct 2021 16:25:19 +0100
Message-Id: <20211020152522.415448-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020152522.415448-1-ross.burton@arm.com>
References: <20211020152522.415448-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 20 Oct 2021 15:25:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2285

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

In case of CMake, PACKAGECONFIG configs take effect when passing
PACKAGECONFIG_CONFARGS to the configure task.

Change-Id: I126ba089c9a5db8e895b8a9545e96ef9fa98ce0d
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.3.0.bb  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1=
.3.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.3.=
0.bb
index 7c850b01..de007c10 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.3.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.3.0.bb
@@ -101,7 +101,7 @@ do_patch[postfuncs] +=3D "apply_local_patches"
=20
 do_configure[cleandirs] =3D "${B}"
 do_configure() {
-    cmake -G"Unix Makefiles" -S ${S} -B ${B} ${EXTRA_OECMAKE}
+    cmake -G"Unix Makefiles" -S ${S} -B ${B} ${EXTRA_OECMAKE} ${PACKAGEC=
ONFIG_CONFARGS}
 }
=20
 # Invoke install here as there's no point in splitting compile from inst=
all: the
--=20
2.25.1


