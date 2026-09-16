Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D8FC982CC
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 16:09:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18780.1789574964024869625
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 16 Sep 2026 09:09:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Y8F1SEeM;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 038DB1516
	for <meta-arm@lists.yoctoproject.org>; Wed, 16 Sep 2026 09:09:20 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 68B093F7B4
	for <meta-arm@lists.yoctoproject.org>; Wed, 16 Sep 2026 09:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789574963; bh=1JPYHE2x3TyFeWUNQxcWeyGBJYUI9JE98G8pfysFZ3I=;
	h=From:To:Subject:Date:From;
	b=Y8F1SEeMg4whujSOQmmJaqrRd/v/TpdwgfhMSxpUZ9+A+nJl+S5k2X9Fe6CgD2XW5
	 hznonp9abdbRlS6+Ys3PfAQO5jw/mUhC0o/aoBCunRw0LgFXeQpLzZSmxKKqvrA343
	 nKv53ll81s1MvavZFzYxr2UJxgn4gOh0HATyqSK0=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp: ignore benign parselogs error on rdn2 and rdv2
Date: Wed, 16 Sep 2026 12:09:22 -0400
Message-ID: <20260916160922.30776-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 16 Sep 2026 16:09:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7166

The latest kernel produces the following ACPI message on rdn2 and
rdv2:

ACPI: PNP0A08:03: _OSC: platform retains control of PCIe features (AE_ERR=
OR)

This message is benign, but causes the parselogs test in testimage to
fail. Add it to the list of ignored errors for both platforms.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-rdn2.txt | 1 +
 meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-rdv2.txt | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-rdn2.t=
xt b/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-rdn2.txt
index 7b55e8ea61f0..ec4af8505aa3 100644
--- a/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-rdn2.txt
+++ b/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-rdn2.txt
@@ -1,2 +1,3 @@
 arch_timer: Failed to initialize memory-mapped timer.
 PCI: OF: of_root node is NULL, cannot create PCI host bridge node
+_OSC: platform retains control of PCIe features (AE_ERROR)
diff --git a/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-rdv2.t=
xt b/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-rdv2.txt
index 7b55e8ea61f0..ec4af8505aa3 100644
--- a/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-rdv2.txt
+++ b/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-rdv2.txt
@@ -1,2 +1,3 @@
 arch_timer: Failed to initialize memory-mapped timer.
 PCI: OF: of_root node is NULL, cannot create PCI host bridge node
+_OSC: platform retains control of PCIe features (AE_ERROR)
--=20
2.50.1 (Apple Git-155)


