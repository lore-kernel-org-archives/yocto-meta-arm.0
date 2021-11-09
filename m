Return-Path: <luca.fancellu@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8CB0C433F5
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 16:35:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.14700.1636475720895410859
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Nov 2021 08:35:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: luca.fancellu@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AEC7ED1;
	Tue,  9 Nov 2021 08:35:14 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B44263F800;
	Tue,  9 Nov 2021 08:35:13 -0800 (PST)
From: Luca Fancellu <luca.fancellu@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: bertrand.marquis@arm.com,
	diego.sueiro@arm.com
Subject: [PATCH honister] arm-autonomy/xen-devicetree: change Xen dts and
 n1sdp dtsi
Date: Tue,  9 Nov 2021 16:35:06 +0000
Message-Id: <20211109163506.36513-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 09 Nov 2021 16:35:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2352

The current Xen dts produced by the layer is using an old
way to specify the dom0 kernel module that won't be supported
anymore in Xen 4.16 when booting through UEFI.

Change xen.dtsi.in to have the Dom0 kernel module as a
direct child of /chosen node.

For the n1sdp, Grub2 is responsible to create the Dom0
kernel node and properly setup the #address-cells and
the #size-cells properties, so modify the dynamic layer
dtsi for n1sdp to remove these node and properties from
the yocto generated dtb for Xen.

Issue-Id: SCM-3647
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Change-Id: I35236bbb3fe97e4237bc5c45fb521efdaa472ef1
---
 .../xen-devicetree/files/xen-n1sdp.dtsi             | 10 ++++++++++
 .../xen-devicetree/files/xen.dtsi.in                | 13 +++++--------
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/files/xen-n1sdp.dtsi b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/files/xen-n1sdp.dtsi
index e3c3294..f85def7 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/files/xen-n1sdp.dtsi
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/files/xen-n1sdp.dtsi
@@ -38,4 +38,14 @@
             /delete-property/ iommu-map;
         };
     };
+
+    /*
+     * Delete module node for Dom0, #size-cells and #address-cells because Grub2
+     * is responsible to create them
+     */
+    chosen {
+        /delete-property/ #size-cells;
+        /delete-property/ #address-cells;
+        /delete-node/ module@0;
+    };
 };
diff --git a/meta-arm-autonomy/recipes-extended/xen-devicetree/files/xen.dtsi.in b/meta-arm-autonomy/recipes-extended/xen-devicetree/files/xen.dtsi.in
index 42d12fa..c1352df 100644
--- a/meta-arm-autonomy/recipes-extended/xen-devicetree/files/xen.dtsi.in
+++ b/meta-arm-autonomy/recipes-extended/xen-devicetree/files/xen.dtsi.in
@@ -1,16 +1,13 @@
 / {
     chosen {
+        #size-cells = <0x00000001>;
+        #address-cells = <0x00000001>;
         xen,dom0-bootargs = "###XEN_DOM0_BOOTARGS###";
         xen,xen-bootargs = "###XEN_XEN_BOOTARGS###";
 
-        modules {
-            #size-cells = <0x00000001>;
-            #address-cells = <0x00000001>;
-
-            module@0 {
-                reg = <###XEN_DOM0_ADDR### ###XEN_DOM0_SIZE###>;
-                compatible = "multiboot,module";
-            };
+        module@0 {
+            reg = <###XEN_DOM0_ADDR### ###XEN_DOM0_SIZE###>;
+            compatible = "multiboot,module";
         };
     };
 };
-- 
2.17.1


