Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 548FDC433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 09:44:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.23157.1656582232232394411
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Jun 2022 02:43:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: adam.johnston@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA5621042;
	Thu, 30 Jun 2022 02:43:51 -0700 (PDT)
Received: from e114993.cambridge.arm.com (e114993.cambridge.arm.com
 [10.1.194.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C597E3F5A1;
	Thu, 30 Jun 2022 02:43:50 -0700 (PDT)
From: adam.johnston@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Adam Johnston <adam.johnston@arm.com>
Subject: [PATCH 0/4] arm-bsp/n1sdp: N1SDP Trusted Boot
Date: Thu, 30 Jun 2022 10:43:29 +0100
Message-Id: <20220630094333.3738129-1-adam.johnston@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 30 Jun 2022 09:44:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3542

From: Adam Johnston <adam.johnston@arm.com>

After recent TF-A 2.7 update in meta-arm, the N1SDP cannot boot.
The workaround was to pin TF-A to 2.6 for the N1SDP.

This patch:
- reverts the previous workaround
- re-configures the N1SDP for trusted boot

Changes based on N1SDP-2022.02.04 arm-reference-solutions release:
- arm-bsp/trusted-firmware-a: N1SDP build is configured for trusted boot
- arm-bsp/scp-firmware: N1SDP source is updated on the N1SDP to master at=
 3e4c34ceccc1c960eb3a4adaa922f2a0c6b36be3
- arm-bsp/scp-firmware: BL1 replaces BL31 in scp_fw.bin for N1SDP
- arm-bsp/sdcard-image-n1sdp: fip.bin replaces uefi.bin

arm-bsp/scp-firmware should be updated to next SCP firmware release when =
available

Adam Johnston (4):
  arm-bsp/n1sdp: revert "fix boot due to TF-A 2.7 update"
  arm-bsp/trusted-firmware-a: N1SDP trusted boot
  arm-bsp/scp-firmware: N1SDP trusted boot
  arm-bsp/sdcard-image-n1sdp: N1SDP trusted boot

 meta-arm-bsp/conf/machine/n1sdp.conf          |  2 -
 .../images/sdcard-image-n1sdp_0.1.bb          |  9 ++++-
 .../scp-firmware/scp-firmware-n1sdp.inc       |  6 ++-
 .../files/n1sdp/bl_size.patch                 | 40 +++++++++++++++++++
 .../trusted-firmware-a-n1sdp.inc              | 21 ++++++++--
 .../trusted-firmware-a_2.6.bbappend           |  8 ----
 .../trusted-firmware-a_2.6.bb                 | 12 ------
 7 files changed, 70 insertions(+), 28 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1s=
dp/bl_size.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-f=
irmware-a_2.6.bbappend
 delete mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a_2.6.bb

--=20
2.25.1


