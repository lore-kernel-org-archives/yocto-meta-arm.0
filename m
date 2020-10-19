Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.9944.1603099641561382321
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 02:27:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: brett.warren@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 358A5101E
	for <meta-arm@lists.yoctoproject.org>; Mon, 19 Oct 2020 02:27:21 -0700 (PDT)
Received: from e125157.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9052C3F66E
	for <meta-arm@lists.yoctoproject.org>; Mon, 19 Oct 2020 02:27:20 -0700 (PDT)
From: "Brett Warren" <brett.warren@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v3 4/6] trusted-firmware-a: enable clang support
Date: Mon, 19 Oct 2020 10:27:10 +0100
Message-Id: <20201019092712.13467-4-brett.warren@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201019092712.13467-1-brett.warren@arm.com>
References: <20201019092712.13467-1-brett.warren@arm.com>

The CC and LD parameters are used to point make to the currently
used compiler and linkers.

This change enables TFA to be compiled successfully when
TOOLCHAIN=clang.

Change-Id: Ice465318b8c9b2b69c08fe4f48f6d36c610978f0
Signed-off-by: Brett Warren <brett.warren@arm.com>
---
 .../trusted-firmware-a/trusted-firmware-a.inc         | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 8b19d68..98085d0 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -78,6 +78,17 @@ do_configure[noexec] = "1"
 DEPENDS_append = " dtc-native openssl-native"
 DEPENDS_append_aarch64_qemuall ?= " optee-os"
 
+# CC and LD introduce arguments which conflict with those otherwise provided by
+# this recipe. The heads of these variables excluding those arguments
+# are therefore used instead.
+def remove_options_tail (in_string):
+    from itertools import takewhile
+    return ' '.join(takewhile(lambda x: not x.startswith('-'), in_string.split(' ')))
+
+EXTRA_OEMAKE += "LD=${@remove_options_tail(d.getVar('LD'))}"
+
+EXTRA_OEMAKE += "CC=${@remove_options_tail(d.getVar('CC'))}"
+
 EXTRA_OEMAKE += "V=1"
 
 # Add platform parameter
-- 
2.17.1

