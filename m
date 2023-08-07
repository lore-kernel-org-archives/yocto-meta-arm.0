Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C64FDC00528
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 15:16:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.37167.1691421393066384140
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Aug 2023 08:16:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A1DDB106F
	for <meta-arm@lists.yoctoproject.org>; Mon,  7 Aug 2023 08:17:15 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A27303F59C
	for <meta-arm@lists.yoctoproject.org>; Mon,  7 Aug 2023 08:16:32 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/6] arm-bsp/tc1: remove trusted-firmware-m target
Date: Mon,  7 Aug 2023 10:16:19 -0500
Message-Id: <20230807151620.3597527-5-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230807151620.3597527-1-jon.mason@arm.com>
References: <20230807151620.3597527-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 07 Aug 2023 15:16:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4936

We aren't testing it and it's not compiling cleanly in v1.8,
let's just drop it for now.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/tc1.yml                                                     | 1 -
 .../trusted-firmware-m/trusted-firmware-m_1.7.%.bbappend       | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/ci/tc1.yml b/ci/tc1.yml
index 66c5ab99..77d67d2f 100644
--- a/ci/tc1.yml
+++ b/ci/tc1.yml
@@ -9,4 +9,3 @@ machine: tc1
=20
 target:
   - core-image-minimal
-  - trusted-firmware-m
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m_1.7.%.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-f=
irmware-m_1.7.%.bbappend
index a558cfee..ec0e483b 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.7.=
%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.7.=
%.bbappend
@@ -4,6 +4,3 @@ MACHINE_TFM_REQUIRE ?=3D ""
 MACHINE_TFM_REQUIRE:corstone1000 =3D "trusted-firmware-m-1.7.0-corstone1=
000.inc"
=20
 require ${MACHINE_TFM_REQUIRE}
-
-COMPATIBLE_MACHINE:tc =3D "(tc1)"
-TFM_PLATFORM:tc =3D "arm/rss/tc"
--=20
2.30.2


