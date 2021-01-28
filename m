Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.6174.1611828423424983792
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 Jan 2021 02:07:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: nathan.dunne@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E61B1042;
	Thu, 28 Jan 2021 02:07:03 -0800 (PST)
Received: from e120809.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 784F93F766;
	Thu, 28 Jan 2021 02:07:02 -0800 (PST)
From: "Nathan Dunne" <Nathan.Dunne@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Nathan Dunne <Nathan.Dunne@arm.com>
Subject: [PATCH 4/4] arm-autonomy/xen-devictree: Update dom0_mem default inline with best practices
Date: Thu, 28 Jan 2021 10:06:40 +0000
Message-Id: <20210128100640.31866-4-nathan.dunne@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210128100640.31866-1-nathan.dunne@arm.com>
References: <20210128100640.31866-1-nathan.dunne@arm.com>

From: Nathan Dunne <Nathan.Dunne@arm.com>

Updated default value for XEN_DEVICETREE_DOM0_MEM from "1024M" to
"1024M,max:1024" to match best practice for dom0_mem command line
argument. Documentation also updated to refer to new default value

Issue-Id: SCM-2037
Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
Change-Id: Ifa7e78bf22b024cb7fe4b782f628860ff44860ad
---
 meta-arm-autonomy/documentation/xen-devicetree.md          | 7 ++++---
 .../recipes-extended/xen-devicetree/xen-devicetree.bb      | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-arm-autonomy/documentation/xen-devicetree.md b/meta-arm-autonomy/documentation/xen-devicetree.md
index 0d4466a..0b3f41b 100644
--- a/meta-arm-autonomy/documentation/xen-devicetree.md
+++ b/meta-arm-autonomy/documentation/xen-devicetree.md
@@ -70,9 +70,10 @@ The following parameters are available:
   This variable is only used if XEN_DEVICETREE_XEN_BOOTARGS has a value
   containing "dom0_mem=${XEN_DEVICETREE_DOM0_MEM}" as the memory assigned to
   dom0 is defined using Xen boot arguments.
-  This variable is set by default to "1024M", and cannot be empty.
-  The value can also be of the form "1024M,max:1024M", as documented here:
-  https://wiki.xenproject.org/wiki/Do%EF%BB%BFm0_Memory_%E2%80%94_Where_It_Has_Not_Gone
+  This variable is set by default to "1024M,max:1024", and cannot be empty.
+  The value can simply specify a size, e.g. "1024M", but best practice is to
+  also provide a max, documented here:
+  https://wiki.xenproject.org/wiki/Xen_Project_Best_Practices
 
 - XEN_DEVICETREE_DOM0_BOOTARGS: Boot arguments to pass to Dom0 Linux when
   booting it.
diff --git a/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb b/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
index c6a785f..29b8023 100644
--- a/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
+++ b/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
@@ -19,7 +19,7 @@ DESCRIPTION = "Add entries in DTB for Xen and Dom0"
 XEN_DEVICETREE_DEPEND_append = " virtual/kernel:do_deploy"
 XEN_DEVICETREE_DTBS ?= "${KERNEL_DEVICETREE}"
 XEN_DEVICETREE_XEN_BOOTARGS ?= "noreboot dom0_mem=${XEN_DEVICETREE_DOM0_MEM}"
-XEN_DEVICETREE_DOM0_MEM ?= "1024M"
+XEN_DEVICETREE_DOM0_MEM ?= "1024M,max:1024M"
 XEN_DEVICETREE_DOM0_BOOTARGS ?= "console=hvc0 earlycon=xen"
 XEN_DEVICETREE_DOM0_ADDR ?= "0x80080000"
 XEN_DEVICETREE_DOM0_SIZE ?= "0x01000000"
-- 
2.17.1

