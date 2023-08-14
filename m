Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 059CFC41513
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 17:50:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.114518.1692035449493652869
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 14 Aug 2023 10:50:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A7801477
	for <meta-arm@lists.yoctoproject.org>; Mon, 14 Aug 2023 10:51:31 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 19ED53F762
	for <meta-arm@lists.yoctoproject.org>; Mon, 14 Aug 2023 10:50:49 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH mickledore 3/3] arm/recipes-kernel: Add preempt-rt support for generic-arm64
Date: Mon, 14 Aug 2023 12:50:42 -0500
Message-Id: <20230814175042.3629846-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230814175042.3629846-1-jon.mason@arm.com>
References: <20230814175042.3629846-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 14 Aug 2023 17:50:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4958

From: Robbie Cao <robbie.cao@arm.com>

Add kernel configuration necessary to build an image with preempt-rt
support for generic-arm64.

And tweak kernel configuration for preempt-rt kernel.

Signed-off-by: Robbie Cao <robbie.cao@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
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
2.30.2


