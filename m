Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 643B5C04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 15:57:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.21484.1658937417044423471
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Jul 2022 08:56:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: adam.johnston@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC368113E;
	Wed, 27 Jul 2022 08:56:56 -0700 (PDT)
Received: from e114993.cambridge.arm.com (e114993.cambridge.arm.com
 [10.1.194.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 896003F73B;
	Wed, 27 Jul 2022 08:56:55 -0700 (PDT)
From: adam.johnston@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Adam Johnston <adam.johnston@arm.com>
Subject: [PATCH kirkstone 0/5] arm-bsp/trusted-firmware-a: N1SDP trusted boot
Date: Wed, 27 Jul 2022 16:56:38 +0100
Message-Id: <20220727155643.2786523-1-adam.johnston@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 27 Jul 2022 15:57:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3597

From: Adam Johnston <adam.johnston@arm.com>

This patch re-configures the N1SDP for trusted boot, using the changes
published by the Silicon Solutions team in N1SDP-2022.02.04 and up-stream=
ed
to trusted-firmware-a and scp-firmware.

arm-bsp/trusted-firmware-a: For N1SDP only, upgraded to 2.7.0 and configu=
red
for trusted boot

arm-bsp/scp-firmware: For N1SDP only, source is updated to master at
3e4c34ceccc1c960eb3a4adaa922f2a0c6b36be3

arm-bsp/scp-firmware: BL1 replaces BL31 in scp_fw.bin for N1SDP

arm-bsp/sdcard-image-n1sdp: fip.bin replaces uefi.bin. Now depends on
trusted-firmware-a rather than edk2-firmware

arm-bsp/edk2-firmware: Add support for NT_FW_CONFIG DTB to N1SDP. Note: T=
his
patch contains CRLF line endings which must be preserved.

arm-bsp/scp-firmware should be updated to next SCP firmware release (2.11=
.0?)
when available

Adam Johnston (5):
  arm-bsp/trusted-firmware-a: N1SDP trusted boot
  arm-bsp/scp-firmware: N1SDP trusted boot
  arm-bsp/sdcard-image-n1sdp: N1SDP trusted boot
  arm-bsp/edk2-firmware: Add NT_FW_CONFIG to N1SDP to fix aborts when
    accessing virtual memory
  arm-bsp/sdcard-image-n1sdp: Fix N1SDP dependencies

 meta-arm-bsp/conf/machine/n1sdp.conf          |   2 +
 .../images/sdcard-image-n1sdp_0.1.bb          |  11 +-
 .../scp-firmware/scp-firmware-n1sdp.inc       |   6 +-
 .../scp-firmware/scp-firmware_2.10.%.bbappend |   7 +
 .../scp-firmware/scp-firmware_2.9.%.bbappend  |   1 -
 .../files/n1sdp/bl_size.patch                 |  40 ++
 .../trusted-firmware-a-n1sdp.inc              |  27 +-
 .../trusted-firmware-a_2.6.bbappend           |   1 -
 .../trusted-firmware-a_2.7.bbappend           |   6 +
 .../recipes-bsp/uefi/edk2-firmware-n1sdp.inc  |   6 +
 .../edk2-platforms/add-nt-fw-config.patch     | 474 ++++++++++++++++++
 .../trusted-firmware-a_2.7.bb                 |  15 +
 12 files changed, 587 insertions(+), 9 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.=
10.%.bbappend
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1s=
dp/bl_size.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-f=
irmware-a_2.7.bbappend
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/ad=
d-nt-fw-config.patch
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a_2.7.bb

--=20
2.17.1


