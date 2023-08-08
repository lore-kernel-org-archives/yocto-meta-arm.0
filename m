Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C0BC04FDF
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 17:35:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.68202.1691516138027387756
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Aug 2023 10:35:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C16A5139F
	for <meta-arm@lists.yoctoproject.org>; Tue,  8 Aug 2023 10:36:19 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1E8F53F59C
	for <meta-arm@lists.yoctoproject.org>; Tue,  8 Aug 2023 10:35:37 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v2 2/6] arm/edk2: move 202211 recipe to meta-arm-bsp
Date: Tue,  8 Aug 2023 12:35:24 -0500
Message-Id: <20230808173528.3606903-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230808173528.3606903-1-jon.mason@arm.com>
References: <20230808173528.3606903-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 08 Aug 2023 17:35:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4943

202211 is only used in meta-arm-bsp, and all other users should be using
the latest version.  Move it there until n1sdp can be updated to the
latest.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-bsp/uefi/edk2-firmware_202211.bb                    | 2 +-
 meta-arm/recipes-bsp/uefi/edk2-firmware.inc                     | 1 -
 .../{edk2-firmware_%.bbappend =3D> edk2-firmware_2023%.bbappend}  | 0
 meta-arm/recipes-bsp/uefi/edk2-firmware_202302.bb               | 2 ++
 4 files changed, 3 insertions(+), 2 deletions(-)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-bsp/uefi/edk2-firmware_20221=
1.bb (76%)
 rename meta-arm/recipes-bsp/uefi/{edk2-firmware_%.bbappend =3D> edk2-fir=
mware_2023%.bbappend} (100%)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202211.bb b/meta-arm=
-bsp/recipes-bsp/uefi/edk2-firmware_202211.bb
similarity index 76%
rename from meta-arm/recipes-bsp/uefi/edk2-firmware_202211.bb
rename to meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202211.bb
index 386bed4b..378f5854 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_202211.bb
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202211.bb
@@ -1,4 +1,4 @@
 SRCREV_edk2           ?=3D "fff6d81270b57ee786ea18ad74f43149b9f03494"
 SRCREV_edk2-platforms ?=3D "982212662c71b6c734b7578526071d6b78da3bcc"
=20
-require edk2-firmware.inc
+require recipes-bsp/uefi/edk2-firmware.inc
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recip=
es-bsp/uefi/edk2-firmware.inc
index 4b9eda39..20eea36b 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
@@ -18,7 +18,6 @@ SRCBRANCH_edk2_platforms =3D "master"
 SRC_URI =3D "\
     ${SRC_URI_EDK2};branch=3D${SRCBRANCH_edk2_platforms};name=3Dedk2;des=
tsuffix=3Dedk2 \
     ${SRC_URI_EDK2_PLATFORMS};branch=3D${SRCBRANCH_edk2};name=3Dedk2-pla=
tforms;destsuffix=3Dedk2/edk2-platforms \
-    file://default.patch;patchdir=3Dedk2-platforms \
 "
=20
 SRCREV_FORMAT         =3D "edk2_edk2-platforms"
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend b/meta-ar=
m/recipes-bsp/uefi/edk2-firmware_2023%.bbappend
similarity index 100%
rename from meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
rename to meta-arm/recipes-bsp/uefi/edk2-firmware_2023%.bbappend
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202302.bb b/meta-arm=
/recipes-bsp/uefi/edk2-firmware_202302.bb
index fa26c3e3..02738d31 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_202302.bb
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_202302.bb
@@ -1,4 +1,6 @@
 SRCREV_edk2           ?=3D "f80f052277c88a67c55e107b550f504eeea947d3"
 SRCREV_edk2-platforms ?=3D "65e001a7f2abedf7799cfb36b057326c1540bd47"
=20
+SRC_URI:append =3D " file://default.patch;patchdir=3Dedk2-platforms"
+
 require edk2-firmware.inc
--=20
2.30.2


