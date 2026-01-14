Return-Path: <frazer.carsley@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B49D31A35
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 09:25:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6621.1768382725176241865
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Jan 2026 01:25:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: frazer.carsley@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 321FA1424;
	Wed, 14 Jan 2026 01:25:18 -0800 (PST)
Received: from e138143.cambridge.arm.com (e138143.arm.com [10.1.25.147])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1375D3F694;
	Wed, 14 Jan 2026 01:25:23 -0800 (PST)
From: frazer.carsley@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Frazer Carsley <frazer.carsley@arm.com>
Subject: [PATCH 3/3] arm-bsp/conf:corstone1000: update bl1.bin path
Date: Wed, 14 Jan 2026 09:24:52 +0000
Message-ID: <20260114092452.286544-4-frazer.carsley@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114092452.286544-1-frazer.carsley@arm.com>
References: <20260114092452.286544-1-frazer.carsley@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 14 Jan 2026 09:25:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6843

From: Frazer Carsley <frazer.carsley@arm.com>

The path changed when the trusted-firmware-m recipe began to inherit
firmware.bbclass.

Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
---
 meta-arm-bsp/conf/machine/corstone1000-fvp.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf b/meta-arm-b=
sp/conf/machine/corstone1000-fvp.conf
index 9fa2a63d..ecdb4e19 100644
--- a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
+++ b/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
@@ -32,7 +32,7 @@ FVP_CONSOLES[se] =3D "secenc_terminal"
 FASTSIM_DISABLE_TA =3D "0"
=20
 # FVP Parameters
-FVP_CONFIG[se.trustedBootROMloader.fname] ?=3D "bl1.bin"
+FVP_CONFIG[se.trustedBootROMloader.fname] ?=3D "trusted-firmware-m/bl1.b=
in"
 FVP_CONFIG[board.xnvm_size] ?=3D "64"
 FVP_CONFIG[se.trustedSRAM_config] ?=3D "6"
 FVP_CONFIG[se.BootROM_config] ?=3D "3"

