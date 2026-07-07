Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E535C43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 13:23:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.173207.1783430618195453737
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Jul 2026 06:23:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=fJqai/Ft;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16CA01692
	for <meta-arm@lists.yoctoproject.org>; Tue,  7 Jul 2026 06:23:33 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 534823F85F
	for <meta-arm@lists.yoctoproject.org>; Tue,  7 Jul 2026 06:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783430617; bh=WWJPmh64hEj6shiUm6tZI0HEHU61r3Sl/tKyy0NbCO4=;
	h=From:To:Subject:Date:From;
	b=fJqai/FtfiwpSbDWMkNWe/Y0HAt1qRVPmDeuuscAGBsn0fKmg4H3r/hy0oQf+mpEB
	 qXi+pVbqylzc9/QOyn2sdAAY3inKLOPXnlM55nfAhgZRRKS0wyhUrEJEm1Yykv3Q36
	 4MGFan9oD9wsDEPNbxxdNUPeM+SdAxqjSP29kME4=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp:  Lengthen Boot timeout for rdv2/rdn2
Date: Tue,  7 Jul 2026 09:23:36 -0400
Message-ID: <20260707132336.25824-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 07 Jul 2026 13:23:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7111

CI is seeing intermittent boot test timeout errors, where the FVP is
almost to shell but times out before getting there.  To get around this,
lengthen the timeout to allow for more opportunity to complete
successfully.

By default, the timeout is 600 seconds.  Increase this by 50% to 900.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/rdn2.conf | 5 +++++
 meta-arm-bsp/conf/machine/rdv2.conf | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/meta-arm-bsp/conf/machine/rdn2.conf b/meta-arm-bsp/conf/mach=
ine/rdn2.conf
index 2349f1b725c5..c9f3b26bb2e0 100644
--- a/meta-arm-bsp/conf/machine/rdn2.conf
+++ b/meta-arm-bsp/conf/machine/rdn2.conf
@@ -56,3 +56,8 @@ FVP_TERMINALS[css.scp.terminal_uart_scp] ?=3D "SCP Cons=
ole"
 FVP_TERMINALS[css.mcp.terminal_uart_mcp] ?=3D "MCP Console"
 FVP_TERMINALS[css.terminal_ns_uart_ap] ?=3D "NS Console"
 FVP_TERMINALS[css.terminal_s_uart_ap] ?=3D "S Console"
+
+# Seeing intermittent test timeout errors in CI where the boot is almost
+# complete.  Lengthen the timeout to allow for more opportunity to
+# complete successfully.
+TEST_FVP_LINUX_BOOT_TIMEOUT =3D "900"
diff --git a/meta-arm-bsp/conf/machine/rdv2.conf b/meta-arm-bsp/conf/mach=
ine/rdv2.conf
index bb83ffce1a20..b24c187a8664 100644
--- a/meta-arm-bsp/conf/machine/rdv2.conf
+++ b/meta-arm-bsp/conf/machine/rdv2.conf
@@ -58,3 +58,8 @@ FVP_TERMINALS[css.scp.terminal_uart_scp] ?=3D "SCP Cons=
ole"
 FVP_TERMINALS[css.mcp.terminal_uart_mcp] ?=3D "MCP Console"
 FVP_TERMINALS[css.terminal_ns_uart_ap] ?=3D "NS Console"
 FVP_TERMINALS[css.terminal_s_uart_ap] ?=3D "S Console"
+
+# Seeing intermittent test timeout errors in CI where the boot is almost
+# complete.  Lengthen the timeout to allow for more opportunity to
+# complete successfully.
+TEST_FVP_LINUX_BOOT_TIMEOUT =3D "900"
--=20
2.50.1 (Apple Git-155)


