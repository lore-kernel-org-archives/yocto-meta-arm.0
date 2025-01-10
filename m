Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87DF1E7719C
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 15:26:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.21252.1736522797638017849
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 10 Jan 2025 07:26:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7354C1F91
	for <meta-arm@lists.yoctoproject.org>; Fri, 10 Jan 2025 07:27:05 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 102983F59E
	for <meta-arm@lists.yoctoproject.org>; Fri, 10 Jan 2025 07:26:37 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm/trusted-firmware-a: bump fip and tests to 2.12
Date: Fri, 10 Jan 2025 10:26:35 -0500
Message-Id: <20250110152635.99735-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250110152635.99735-1-jon.mason@arm.com>
References: <20250110152635.99735-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 10 Jan 2025 15:26:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6315

Bump fip and tf-a tests to use the 2.12 sources

Note: change to license is for CoT device tree python application (which
is Apache licensed).

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../{fiptool-native_2.11.0.bb =3D> fiptool-native_2.12.0.bb}  | 6 +++---
 .../{tf-a-tests_2.11.0.bb =3D> tf-a-tests_2.12.0.bb}          | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{fiptool-native_2.11.0.bb=
 =3D> fiptool-native_2.12.0.bb} (85%)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{tf-a-tests_2.11.0.bb =3D=
> tf-a-tests_2.12.0.bb} (96%)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.11.=
0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.12.0.bb
similarity index 85%
rename from meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.11.0=
.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.12.0.b=
b
index 47e783a892c8..e7fbb8b499ef 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.11.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.12.0.bb
@@ -7,10 +7,10 @@ LICENSE =3D "BSD-3-Clause"
=20
 SRC_URI_TRUSTED_FIRMWARE_A ?=3D "git://git.trustedfirmware.org/TF-A/trus=
ted-firmware-a.git;protocol=3Dhttps"
 SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A};destsuffix=3Dfiptool-${PV};br=
anch=3D${SRCBRANCH}"
-LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3Db5fbfdeb6855162dded3=
1fadcd5d4dc5"
+LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D83b7626b8c7a37263c6a=
58af8d19bee1"
=20
-# Use fiptool from TF-A v2.11.0
-SRCREV =3D "f2735ebccf5173f74c0458736ec526276106097e"
+# Use fiptool from TF-A v2.12.0
+SRCREV =3D "4ec2948fe3f65dba2f19e691e702f7de2949179c"
 SRCBRANCH =3D "master"
=20
 DEPENDS +=3D "openssl-native"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.11.0.bb=
 b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.12.0.bb
similarity index 96%
rename from meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.11.0.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.12.0.bb
index 02f03f3b00cf..c3f0c7fa4c2c 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.11.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.12.0.bb
@@ -11,7 +11,7 @@ SRC_URI_TRUSTED_FIRMWARE_A_TESTS ?=3D "git://git.truste=
dfirmware.org/TF-A/tf-a-tes
 SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A_TESTS};branch=3D${SRCBRANCH} \
           "
 SRCBRANCH =3D "master"
-SRCREV =3D "fd053b75cde9c2aa1a5b979a2b544890510d4f52"
+SRCREV =3D "6a113621a9efdc143e9270b1789046cd7d9cdfb1"
=20
 DEPENDS +=3D "optee-os"
=20
--=20
2.39.5 (Apple Git-154)


