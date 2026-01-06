Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 981BACE9D7D
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 16:59:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.94602.1767718761098155391
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 Jan 2026 08:59:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A62951595
	for <meta-arm@lists.yoctoproject.org>; Tue,  6 Jan 2026 08:59:13 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 241083F5A1
	for <meta-arm@lists.yoctoproject.org>; Tue,  6 Jan 2026 08:59:20 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] meta-arm-bsp/oeqa: ignore new PCI warnings
Date: Tue,  6 Jan 2026 16:59:15 +0000
Message-ID: <20260106165915.1001317-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106165915.1001317-1-ross.burton@arm.com>
References: <20260106165915.1001317-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 06 Jan 2026 16:59:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6818

The PCI subsystem with 6.18 is now warning on boot:

   PCI: OF: of_root node is NULL, cannot create PCI host bridge node

Until this can be root-caused, ignore it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../lib/oeqa/runtime/cases/parselogs-ignores-sbsa-ref.txt      | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-sbsa-r=
ef.txt b/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-sbsa-ref.t=
xt
index 42d1bbeed8..fab5cc6233 100644
--- a/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-sbsa-ref.txt
+++ b/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-sbsa-ref.txt
@@ -6,3 +6,6 @@ efifb: cannot reserve video memory at 0x80000000
=20
 # TODO: debug why this sometimes happens
 failed to find screen to remove
+
+# appears with upgrade to kernel 6.18
+PCI: OF: of_root node is NULL, cannot create PCI host bridge node
--=20
2.43.0


