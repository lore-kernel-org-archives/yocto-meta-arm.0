Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.22334.1611828421686289150
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 Jan 2021 02:07:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: nathan.dunne@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7EAA1042;
	Thu, 28 Jan 2021 02:07:00 -0800 (PST)
Received: from e120809.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C7773F766;
	Thu, 28 Jan 2021 02:07:00 -0800 (PST)
From: "Nathan Dunne" <Nathan.Dunne@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Nathan Dunne <Nathan.Dunne@arm.com>
Subject: [PATCH 1/4] arm-autonomy/xen-devicetree: Lower log level for incorrect kernel size
Date: Thu, 28 Jan 2021 10:06:37 +0000
Message-Id: <20210128100640.31866-1-nathan.dunne@arm.com>
X-Mailer: git-send-email 2.17.1

From: Nathan Dunne <Nathan.Dunne@arm.com>

Reduced the level at which messages relating to overriding the user provided
value for XEN_DEVICETREE_DOM0_SIZE when it is too small are logged at from
'warn' to 'note'

Issue-Id: SCM-2037
Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
Change-Id: I1436dac2c347d40c897291220fe30a95a57f2fa1
---
 .../recipes-extended/xen-devicetree/xen-devicetree.bb         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb b/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
index 0369b96..13afb7a 100644
--- a/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
+++ b/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
@@ -91,11 +91,11 @@ python calc_xen_dtb_dom0_size() {
     size_defined = int(d.getVar('XEN_DEVICETREE_DOM0_SIZE'), 16)
 
     if size_required > size_defined:
-        bb.warn ("Wrong kernel size setting inside xen dtb!\n"\
+        bb.note ("Wrong kernel size setting inside xen dtb!\n"\
                  "Required:\t%(req)d (%(req)#010X)\n"\
                  "Requested:\t%(def)d (%(def)#010X)"\
                  % {"req": size_required, "def": size_defined})
-        bb.warn ("Overriding XEN_DEVICETREE_DOM0_SIZE with "\
+        bb.note ("Overriding XEN_DEVICETREE_DOM0_SIZE with "\
                  "%(req)d (%(req)#010X)" % {"req": size_required})
         d.setVar('XEN_DEVICETREE_DOM0_SIZE', hex(size_required))
 }
-- 
2.17.1

