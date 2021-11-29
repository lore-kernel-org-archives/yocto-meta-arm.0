Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 558A8C433F5
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 14:24:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.61058.1638195879239174205
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Nov 2021 06:24:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3C45113E
	for <meta-arm@lists.yoctoproject.org>; Mon, 29 Nov 2021 06:24:38 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FA4F3F766
	for <meta-arm@lists.yoctoproject.org>; Mon, 29 Nov 2021 06:24:38 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm/hafnium: enable qemuarm64
Date: Mon, 29 Nov 2021 14:24:32 +0000
Message-Id: <20211129142433.4019092-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129142433.4019092-1-ross.burton@arm.com>
References: <20211129142433.4019092-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Nov 2021 14:24:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2476

Hafnium can do a qemu/aarch64 build, so enable that for future testing
purposes.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/hafnium/hafnium_2.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.6.bb b/meta-arm/recip=
es-bsp/hafnium/hafnium_2.6.bb
index b9dc63bc..0452272e 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.6.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.6.bb
@@ -18,12 +18,14 @@ S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build"
=20
 COMPATIBLE_MACHINE ?=3D "invalid"
+COMPATIBLE_MACHINE:qemuarm64 =3D "qemuarm64"
=20
 # Default build 'reference'
 HAFNIUM_PROJECT ?=3D "reference"
=20
 # Platform must be set for each machine
 HAFNIUM_PLATFORM ?=3D "invalid"
+HAFNIUM_PLATFORM:qemuarm64 =3D "qemu_aarch64"
=20
 # do_deploy will install everything listed in this variable. It is set b=
y
 # default to hafnium
--=20
2.25.1


