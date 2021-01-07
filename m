Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.6324.1610014265376038065
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 Jan 2021 02:11:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: nathan.dunne@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1498E1FB;
	Thu,  7 Jan 2021 02:11:05 -0800 (PST)
Received: from scm-wfh-server-natdun02.stack04.eu02.mi.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F9D43F719;
	Thu,  7 Jan 2021 02:11:04 -0800 (PST)
From: "Nathan Dunne" <Nathan.Dunne@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Nathan Dunne <Nathan.Dunne@arm.com>
Subject: [PATCH] arm-autonomy/xenguest-manager: Document VOLATILE_LOG_DIR in recipe
Date: Thu,  7 Jan 2021 10:10:54 +0000
Message-Id: <20210107101054.27399-1-nathan.dunne@arm.com>
X-Mailer: git-send-email 2.17.1

From: Nathan Dunne <Nathan.Dunne@arm.com>

Added a comment to the xenguest-manager recipe to inform the user that
the default state is a volatile log dir, and how to persist logs across
reboots.

Issue-Id: SCM-1860
Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
Change-Id: Ie0c92b05d11543a1524cbb7a53cd845bc63ecd3d
---
 .../recipes-extended/xenguest/xenguest-manager.bb      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
index 16a0700..ffb0fc3 100644
--- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
@@ -2,6 +2,16 @@
 #
 # xenguest-manager is a tool to control xen guest (e.g. create, start, stop)
 #
+# By default xenguest-manager logs to /var/log when in verbose mode, which is a
+# Volatile directory. To persist logs across reboots the following needs to be
+# added to either local.conf or distro.conf
+#
+#   VOLATILE_LOG_DIR="no"
+#
+# Read more here: https://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html#var-VOLATILE_LOG_DIR
+#
+# When this is enabled, logrotate will monitor the file to ensure it does not grow
+# excessively large. See files/logrotate-xenguest
 
 DESCRIPTION = "Xen Guest Manager"
 LICENSE = "MIT"
-- 
2.17.1

