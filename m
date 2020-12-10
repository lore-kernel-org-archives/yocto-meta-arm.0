Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.13449.1607608648252590891
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 10 Dec 2020 05:57:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFD1631B
	for <meta-arm@lists.yoctoproject.org>; Thu, 10 Dec 2020 05:57:27 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8F50D3F718
	for <meta-arm@lists.yoctoproject.org>; Thu, 10 Dec 2020 05:57:27 -0800 (PST)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm-bsp: Fix Juno kernel config warnings
Date: Thu, 10 Dec 2020 08:57:20 -0500
Message-Id: <20201210135721.29575-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201210135721.29575-1-jon.mason@arm.com>
References: <20201210135721.29575-1-jon.mason@arm.com>

Juno kernel compilation is displaying warnings due to missing
dependencies.  Add the missing dependencies and the warnings go away.

Change-Id: I78471cdfa826c8a528d13f344fb88c1baa55d3b1
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../arm-platforms-kmeta/bsp/arm-platforms/juno/juno-pci.cfg      | 1 +
 .../arm-platforms-kmeta/bsp/arm-platforms/juno/juno-sound.cfg    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/juno/juno-pci.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/juno/juno-pci.cfg
index 295d190..c36ab4e 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/juno/juno-pci.cfg
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/juno/juno-pci.cfg
@@ -1,5 +1,6 @@
 CONFIG_PCI=y
 CONFIG_PCI_MSI=y
+CONFIG_PCI_IOV=y
 CONFIG_PCI_REALLOC_ENABLE_AUTO=y
 CONFIG_PCI_PRI=y
 CONFIG_PCI_PASID=y
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/juno/juno-sound.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/juno/juno-sound.cfg
index 399c77d..d3419ef 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/juno/juno-sound.cfg
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/juno/juno-sound.cfg
@@ -2,6 +2,7 @@ CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_SEQUENCER=y
 CONFIG_SND_SEQ_DUMMY=y
+CONFIG_SND_OSSEMUL=y
 CONFIG_SND_MIXER_OSS=y
 CONFIG_SND_PCM_OSS=y
 CONFIG_SND_SEQUENCER_OSS=y
-- 
2.17.1

