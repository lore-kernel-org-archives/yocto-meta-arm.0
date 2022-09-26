Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F38DC32771
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 10:32:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.26878.1664188348010242686
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Sep 2022 03:32:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: adam.johnston@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6D5D1063;
	Mon, 26 Sep 2022 03:32:33 -0700 (PDT)
Received: from e114993.cambridge.arm.com (e114993.cambridge.arm.com
 [10.1.194.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 89CEC3F73B;
	Mon, 26 Sep 2022 03:32:26 -0700 (PDT)
From: adam.johnston@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Adam Johnston <adam.johnston@arm.com>
Subject: [PATCH 0/3] arm-bsp/n1sdp: Update EDK2 and TF-A for N1SDP
Date: Mon, 26 Sep 2022 11:32:00 +0100
Message-Id: <20220926103203.1196752-1-adam.johnston@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 26 Sep 2022 10:32:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3831

From: Adam Johnston <adam.johnston@arm.com>

Updates edk2, edk2-platforms to align with N1SDP-2022.06.22 release.
Updates trusted-firmware-a version to align with the N1SDP refresh.
Changes in trusted-firmware and edk2-platforms are co-dependent so have
been submitted together.

Note: The EDK2 patches contain CRLF line endings which must be preserved

Adam Johnston (3):
  arm-bsp/edk2-firmware: Update edk2/edk2-platforms versions for N1SDP
  arm-bsp/edk2-firmware: Add edk2-platforms patches for N1SDP
  arm-bsp/trusted-firmware-a: Update TF-A version for N1SDP

 .../trusted-firmware-a-n1sdp.inc              |  3 +-
 .../recipes-bsp/uefi/edk2-firmware-n1sdp.inc  |  9 ++-
 ...p-Add-support-to-parse-NT_FW_CONFIG.patch} | 23 ++++---
 ...orm-ARM-N1Sdp-Fix-RemoteDdrSize-cast.patch | 48 +++++++++++++
 ...dp-Modify-the-IRQ-ID-of-Debug-UART-a.patch | 67 +++++++++++++++++++
 5 files changed, 137 insertions(+), 13 deletions(-)
 rename meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/{add-nt-fw-con=
fig.patch =3D> 0001-Platform-ARM-N1sdp-Add-support-to-parse-NT_FW_CONFIG.=
patch} (95%)
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/00=
02-Platform-ARM-N1Sdp-Fix-RemoteDdrSize-cast.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/00=
03-Platform-ARM-N1Sdp-Modify-the-IRQ-ID-of-Debug-UART-a.patch

--=20
2.37.3


