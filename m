Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8F45C433F5
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 18:31:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.719.1648751484275227718
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 31 Mar 2022 11:31:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E354813D5
	for <meta-arm@lists.yoctoproject.org>; Thu, 31 Mar 2022 11:31:23 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 955873F718
	for <meta-arm@lists.yoctoproject.org>; Thu, 31 Mar 2022 11:31:23 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 7/7] arm/oeqa: add no-op runtime test
Date: Thu, 31 Mar 2022 19:31:17 +0100
Message-Id: <20220331183117.22389-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331183117.22389-1-ross.burton@arm.com>
References: <20220331183117.22389-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 31 Mar 2022 18:31:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3223

Machines which don't have working network stacks in a FVP can still run
a useful testimage, because it will validate that the machine will boot
to a login prompt on the console.

However, we can't set TEST_SUITES to "" because testimage assumes that
was a mistake, so add a no-op test case for use in these situations.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/lib/oeqa/runtime/cases/noop.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-arm/lib/oeqa/runtime/cases/noop.py

diff --git a/meta-arm/lib/oeqa/runtime/cases/noop.py b/meta-arm/lib/oeqa/=
runtime/cases/noop.py
new file mode 100644
index 00000000..b5fba7c5
--- /dev/null
+++ b/meta-arm/lib/oeqa/runtime/cases/noop.py
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: MIT
+
+from oeqa.runtime.case import OERuntimeTestCase
+
+class NoopTest(OERuntimeTestCase):
+    """
+    This is a test case which does nothing.  Useful when you want to use
+    testimage to verify that an image boots, but you don't have networki=
ng so
+    none of the existing test cases are suitable.
+    """
+    def test_no_op(self):
+        return
--=20
2.25.1


