Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A15AC433F5
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 18:20:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.863.1638901202630082570
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Dec 2021 10:20:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 067FF13A1
	for <meta-arm@lists.yoctoproject.org>; Tue,  7 Dec 2021 10:20:01 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A60F53F73B
	for <meta-arm@lists.yoctoproject.org>; Tue,  7 Dec 2021 10:20:00 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/5] arm/trusted-firmware-a: move SRCREV_FORMAT to common
 include
Date: Tue,  7 Dec 2021 18:19:53 +0000
Message-Id: <20211207181956.900131-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207181956.900131-1-ross.burton@arm.com>
References: <20211207181956.900131-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 07 Dec 2021 18:20:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2557

Instead of every versioned recipe setting this, move it to the common
include.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc | 2 ++
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.5.bb   | 3 ---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 40c9e9e3..b1a75229 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -9,6 +9,8 @@ SRC_URI =3D "git://git.trustedfirmware.org/TF-A/trusted-f=
irmware-a.git;protocol=3Dht
            file://ssl.patch"
 UPSTREAM_CHECK_GITTAGREGEX =3D "^v(?P<pver>\d+(\.\d+)+)$"
=20
+SRCREV_FORMAT =3D "tfa"
+
 COMPATIBLE_MACHINE ?=3D "invalid"
=20
 # Platform must be set for each machine
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.5.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.5.bb
index 15e689a8..15c4e5df 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.5.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.5.bb
@@ -1,8 +1,5 @@
 require trusted-firmware-a.inc
=20
-# Use TF-A for version
-SRCREV_FORMAT =3D "tfa"
-
 # TF-A v2.5
 SRCREV_tfa =3D "1e13c500a0351ac4b55d09a63f7008e2438550f8"
=20
--=20
2.25.1


