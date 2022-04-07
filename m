Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A158C433F5
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.352.1649347746662634977
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 Apr 2022 09:09:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CAAF4139F
	for <meta-arm@lists.yoctoproject.org>; Thu,  7 Apr 2022 09:09:05 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E6413F73B
	for <meta-arm@lists.yoctoproject.org>; Thu,  7 Apr 2022 09:09:05 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm-bsp/scp-firmware: specify version for bbappend
Date: Thu,  7 Apr 2022 17:09:02 +0100
Message-Id: <20220407160903.3809656-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 07 Apr 2022 20:36:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3253

In preparation for SCP Firmware 2.10 being integrated, make this append
version-specific so that BSPs can select which SCP release they have
been tested with.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../{scp-firmware_%.bbappend =3D> scp-firmware_2.9.%.bbappend}      | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arm-bsp/recipes-bsp/scp-firmware/{scp-firmware_%.bbappend =3D=
> scp-firmware_2.9.%.bbappend} (100%)

diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappen=
d b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.9.%.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
rename to meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.9.%.bbappe=
nd
--=20
2.25.1


