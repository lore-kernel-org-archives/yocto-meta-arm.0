Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF09C4332F
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 15:41:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.38528.1634571661663446416
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 Oct 2021 08:41:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01E632F
	for <meta-arm@lists.yoctoproject.org>; Mon, 18 Oct 2021 08:41:01 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A1B833F694
	for <meta-arm@lists.yoctoproject.org>; Mon, 18 Oct 2021 08:41:00 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/6] arm-bsp/fvp-common: set TEST_TARGET to OEFVPTarget
Date: Mon, 18 Oct 2021 16:40:54 +0100
Message-Id: <20211018154056.1552230-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211018154056.1552230-1-ross.burton@arm.com>
References: <20211018154056.1552230-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 18 Oct 2021 15:41:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2277

Set TEST_TARGET so that all FVP machines use the new FVP target out of
the box, instead of attempting to use qemu.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-common.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm-bsp/conf/machine/fvp-common.inc b/meta-arm-bsp/conf=
/machine/fvp-common.inc
index 2579d94a..9adb4309 100644
--- a/meta-arm-bsp/conf/machine/fvp-common.inc
+++ b/meta-arm-bsp/conf/machine/fvp-common.inc
@@ -25,3 +25,5 @@ EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a u-b=
oot"
 # initialise) and install the pre-generated keys.
 PACKAGECONFIG:remove:pn-openssh =3D "rng-tools"
 MACHINE_EXTRA_RRECOMMENDS +=3D "ssh-pregen-hostkeys"
+
+TEST_TARGET =3D "OEFVPTarget"
--=20
2.25.1


