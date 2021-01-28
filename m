Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.22486.1611828422111499053
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 Jan 2021 02:07:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: nathan.dunne@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7ECD7106F;
	Thu, 28 Jan 2021 02:07:01 -0800 (PST)
Received: from e120809.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E890D3F766;
	Thu, 28 Jan 2021 02:07:00 -0800 (PST)
From: "Nathan Dunne" <Nathan.Dunne@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Nathan Dunne <Nathan.Dunne@arm.com>
Subject: [PATCH 2/4] arm-autonomy/xen-devicetree: Allow hex or decimal Dom0 Size
Date: Thu, 28 Jan 2021 10:06:38 +0000
Message-Id: <20210128100640.31866-2-nathan.dunne@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210128100640.31866-1-nathan.dunne@arm.com>
References: <20210128100640.31866-1-nathan.dunne@arm.com>

From: Nathan Dunne <Nathan.Dunne@arm.com>

Check whether XEN_DEVICETREE_DOM0_SIZE begins '0x' and cast from hex
or decimal accordingly, rather than assuming hex.

Issue-Id: SCM-2037
Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
Change-Id: I3a1c7c7ae6711b3d645cdb66bcd9c2c27196b054
---
 .../recipes-extended/xen-devicetree/xen-devicetree.bb       | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb b/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
index 13afb7a..398385a 100644
--- a/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
+++ b/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
@@ -88,7 +88,11 @@ python calc_xen_dtb_dom0_size() {
     bb.note('size in bytes: %d' % size)
     # Ceil to MiB
     size_required = ceil(size / (2 ** 20)) * (2 ** 20)
-    size_defined = int(d.getVar('XEN_DEVICETREE_DOM0_SIZE'), 16)
+    xen_devicetree_dom0_size = d.getVar('XEN_DEVICETREE_DOM0_SIZE')
+    if xen_devicetree_dom0_size[:2] == "0x":
+        size_defined = int(xen_devicetree_dom0_size, 16)
+    else:
+        size_defined = int(xen_devicetree_dom0_size)
 
     if size_required > size_defined:
         bb.note ("Wrong kernel size setting inside xen dtb!\n"\
-- 
2.17.1

