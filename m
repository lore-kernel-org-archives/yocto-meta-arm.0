Return-Path: <robbie.cao@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 832C7C04A6A
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 03:58:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.54407.1691467108621230817
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Aug 2023 20:58:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: robbie.cao@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B85C0D75;
	Mon,  7 Aug 2023 20:59:10 -0700 (PDT)
Received: from a015972.shanghai.arm.com (a015972.shanghai.arm.com [10.169.188.143])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 613B73F59C;
	Mon,  7 Aug 2023 20:58:26 -0700 (PDT)
From: Robbie Cao <robbie.cao@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: robbie.cao@arm.com,
	diego.sueiro@arm.com,
	peter.hoyes@arm.com
Subject: [PATCH] arm/recipes-kernel: Add preempt-rt support for generic-arm64
Date: Tue,  8 Aug 2023 11:57:52 +0800
Message-Id: <20230808035752.1894696-1-robbie.cao@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 08 Aug 2023 03:58:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4941

Add kernel configuration necessary to build an image with preempt-rt
support for generic-arm64.

And tweak kernel configuration for preempt-rt kernel.

Signed-off-by: Robbie Cao <robbie.cao@arm.com>
---
 .../generic-arm64-preempt-rt-tweaks.cfg                    | 4 ++++
 .../files/generic-arm64-kmeta/generic-arm64-preempt-rt.scc | 7 +++++++
 2 files changed, 11 insertions(+)
 create mode 100644 meta-arm/recipes-kernel/linux/files/generic-arm64-kme=
ta/generic-arm64-preempt-rt-tweaks.cfg
 create mode 100644 meta-arm/recipes-kernel/linux/files/generic-arm64-kme=
ta/generic-arm64-preempt-rt.scc

diff --git a/meta-arm/recipes-kernel/linux/files/generic-arm64-kmeta/gene=
ric-arm64-preempt-rt-tweaks.cfg b/meta-arm/recipes-kernel/linux/files/gen=
eric-arm64-kmeta/generic-arm64-preempt-rt-tweaks.cfg
new file mode 100644
index 00000000..84e0dd71
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/files/generic-arm64-kmeta/generic-arm=
64-preempt-rt-tweaks.cfg
@@ -0,0 +1,4 @@
+# These configurations have a dependency on !PREEMPT_RT. Set them to `n`=
 to
+# avoid complain when do_kernel_configcheck.
+CONFIG_LEDS_TRIGGER_CPU=3Dn
+CONFIG_TRANSPARENT_HUGEPAGE=3Dn
diff --git a/meta-arm/recipes-kernel/linux/files/generic-arm64-kmeta/gene=
ric-arm64-preempt-rt.scc b/meta-arm/recipes-kernel/linux/files/generic-ar=
m64-kmeta/generic-arm64-preempt-rt.scc
new file mode 100644
index 00000000..ae97c2e2
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/files/generic-arm64-kmeta/generic-arm=
64-preempt-rt.scc
@@ -0,0 +1,7 @@
+define KMACHINE generic-arm64
+define KTYPE preempt-rt
+define KARCH arm64
+
+kconf hardware generic-arm64-preempt-rt-tweaks.cfg
+include ktypes/preempt-rt/preempt-rt.scc
+include features/bluetooth/bluetooth.scc
--=20
2.25.1


