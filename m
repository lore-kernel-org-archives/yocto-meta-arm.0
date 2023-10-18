Return-Path: <mariam.elshakfy@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37258CDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 11:17:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.278699.1697627852299206655
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Oct 2023 04:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mariam.elshakfy@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 789681007;
	Wed, 18 Oct 2023 04:18:12 -0700 (PDT)
Received: from Ubuntu.cambridge.arm.com (PW04GXME.arm.com [10.1.29.34])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0D6063F762;
	Wed, 18 Oct 2023 04:17:30 -0700 (PDT)
From: mariam.elshakfy@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Mariam Elshakfy <mariam.elshakfy@arm.com>
Subject: [PATCH 0/2] arm-bsp/n1sdp: Enable OP-TEE Cache in N1SDP
Date: Wed, 18 Oct 2023 12:17:09 +0100
Message-Id: <20231018111711.4602-1-mariam.elshakfy@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 Oct 2023 11:17:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5140

From: Mariam Elshakfy <mariam.elshakfy@arm.com>

These patches enable N1SDP cache to improve performance,
change location of OP-TEE from DDR3 to DDR4, and reserve
the used region in UEFI (EDK2) to protect against
allocations by UEFI applications.

Mariam Elshakfy (2):
  arm-bsp/n1sdp: Move OP-TEE to DDR4
  arm-bsp/n1sdp: Enable OP-TEE cache in N1SDP

 .../0001-Reserve-OP-TEE-memory-from-nwd.patch |  7 +-
 .../0002-Modify-BL32-Location-to-DDR4.patch   | 30 +++++++++
 .../n1sdp/0003-Modify-SPMC-Base-to-DDR4.patch | 28 ++++++++
 .../trusted-firmware-a-n1sdp.inc              |  2 +
 .../recipes-bsp/uefi/edk2-firmware-n1sdp.inc  |  1 +
 ...1Sdp-Reserve-OP-TEE-Region-from-UEFI.patch | 65 +++++++++++++++++++
 ...lat-n1sdp-add-N1SDP-platform-support.patch |  4 +-
 ...ble-instruction-cache-and-data-cache.patch | 45 -------------
 ...atch =3D> 0003-Handle-logging-syscall.patch} |  0
 ...at-n1sdp-register-DRAM1-to-optee-os.patch} |  0
 ...-external-device-tree-base-and-size.patch} |  0
 .../recipes-security/optee/optee-os-n1sdp.inc |  7 +-
 12 files changed, 135 insertions(+), 54 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1s=
dp/0002-Modify-BL32-Location-to-DDR4.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1s=
dp/0003-Modify-SPMC-Base-to-DDR4.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0009-Platfo=
rm-ARM-N1Sdp-Reserve-OP-TEE-Region-from-UEFI.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/n1=
sdp/0003-HACK-disable-instruction-cache-and-data-cache.patch
 rename meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/{0004-Ha=
ndle-logging-syscall.patch =3D> 0003-Handle-logging-syscall.patch} (100%)
 rename meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/{0005-pl=
at-n1sdp-register-DRAM1-to-optee-os.patch =3D> 0004-plat-n1sdp-register-D=
RAM1-to-optee-os.patch} (100%)
 rename meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/{0006-pl=
at-n1sdp-add-external-device-tree-base-and-size.patch =3D> 0005-plat-n1sd=
p-add-external-device-tree-base-and-size.patch} (100%)

--=20
2.34.1


