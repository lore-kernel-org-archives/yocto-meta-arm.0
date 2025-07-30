Return-Path: <csaba.szilagyi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56190C87FD4
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 07:47:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.29944.1753861656036684259
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 30 Jul 2025 00:47:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: csaba.szilagyi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 918BE1C25;
	Wed, 30 Jul 2025 00:47:27 -0700 (PDT)
Received: from ubuntu-build.budapest.arm.com (GM0ZH93R.arm.com [10.45.26.24])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 197B23F673;
	Wed, 30 Jul 2025 00:47:34 -0700 (PDT)
From: =?UTF-8?q?Csaba=20Szil=C3=A1gyi?= <csaba.szilagyi@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: =?UTF-8?q?Csaba=20Szil=C3=A1gyi?= <csaba.szilagyi@arm.com>
Subject: [PATCH 3/6] arm/hafnium: Select valid platform for hafnium and properly pass to make
Date: Wed, 30 Jul 2025 07:45:48 +0000
Message-ID: <20250730074551.1388-4-csaba.szilagyi@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730074551.1388-1-csaba.szilagyi@arm.com>
References: <20250730074551.1388-1-csaba.szilagyi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 30 Jul 2025 07:47:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6630

'qemu_aarch64' is not a valid hafnium platform. Supported platforms are:
* 'secure_rd_v3'
* 'secure_rd_v3_cfg1'
* 'secure_aem_v8a_fvp_vhe'
* 'aem_v8a_fvp_vhe'
* 'aem_v8a_fvp_vhe_ffa_v1_1'
* 'qemu_aarch64_vhe'
* 'secure_qemu_aarch64'
* 'rpi4'
* 'secure_tc'

Previusly selected 'qemu_aarch64' did not cause error because
it was NOT passed to make. It had no effect.

Within this commit, platform 'secure_qemu_aarch64' is selected
and passed to make.

Signed-off-by: Csaba Szil=C3=A1gyi <csaba.szilagyi@arm.com>
---
 meta-arm/recipes-bsp/hafnium/hafnium_2.12.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.12.0.bb b/meta-arm/re=
cipes-bsp/hafnium/hafnium_2.12.0.bb
index 9b84fa14..693e81f2 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.12.0.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.12.0.bb
@@ -27,7 +27,7 @@ HAFNIUM_PROJECT ?=3D "reference"
=20
 # Platform must be set for each machine
 HAFNIUM_PLATFORM ?=3D "invalid"
-HAFNIUM_PLATFORM:qemuarm64 =3D "qemu_aarch64"
+HAFNIUM_PLATFORM:qemuarm64 =3D "secure_qemu_aarch64"
=20
 # do_deploy will install everything listed in this variable. It is set b=
y
 # default to hafnium
@@ -38,6 +38,8 @@ EXTRA_OEMAKE +=3D "PROJECT=3D${HAFNIUM_PROJECT}"
=20
 EXTRA_OEMAKE +=3D "OUT_DIR=3D${B}"
=20
+EXTRA_OEMAKE +=3D "PLATFORM=3D${HAFNIUM_PLATFORM}"
+
 # Don't use prebuilt binaries for gn and ninja
 EXTRA_OEMAKE +=3D "GN=3D${STAGING_BINDIR_NATIVE}/gn NINJA=3D${STAGING_BI=
NDIR_NATIVE}/ninja"
=20

