Return-Path: <amr.mohamed@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DABAC3DA7F
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 14:39:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.44605.1722436798418198252
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 31 Jul 2024 07:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: amr.mohamed@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5BC991007;
	Wed, 31 Jul 2024 07:40:23 -0700 (PDT)
Received: from e125330.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D28953F5A1;
	Wed, 31 Jul 2024 07:39:56 -0700 (PDT)
From: amr.mohamed@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Amr Mohamed <amr.mohamed@arm.com>,
	Jon Mason <jon.mason@arm.com>
Subject: [PATCH scarthgap 3/4] arm-systemready/oeqa: Add new test for Fedora unattended installation
Date: Wed, 31 Jul 2024 15:39:46 +0100
Message-Id: <20240731143947.2502491-3-amr.mohamed@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240731143947.2502491-1-amr.mohamed@arm.com>
References: <20240731143947.2502491-1-amr.mohamed@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 31 Jul 2024 14:39:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5938

From: Amr Mohamed <amr.mohamed@arm.com>

The oeqa test responds to the boot loader prompt error message and
waits till the distro installation is finished.

Signed-off-by: Amr Mohamed <amr.mohamed@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../arm_systemready_fedora_unattended.py      | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 meta-arm-systemready/lib/oeqa/runtime/cases/arm_syste=
mready_fedora_unattended.py

diff --git a/meta-arm-systemready/lib/oeqa/runtime/cases/arm_systemready_=
fedora_unattended.py b/meta-arm-systemready/lib/oeqa/runtime/cases/arm_sy=
stemready_fedora_unattended.py
new file mode 100644
index 00000000..f607fb12
--- /dev/null
+++ b/meta-arm-systemready/lib/oeqa/runtime/cases/arm_systemready_fedora_=
unattended.py
@@ -0,0 +1,39 @@
+from oeqa.runtime.case import OERuntimeTestCase
+
+
+class SystemReadyFedoraUnattendedTest(OERuntimeTestCase):
+    def setUp(self):
+        super().setUp()
+        self.console =3D self.target.DEFAULT_CONSOLE
+
+    def test_fedora_unattended(self):
+        # Turn on the FVP.
+        self.target.transition('on')
+
+        # Timeout value =3D elapsed time * 2; where elapsed time was col=
lected
+        # from the elapsed time in the log.do_testimage for each functio=
n after
+        # the build is finished on the development machine.
+        self.target.expect(self.console,
+                           '  Booting `Install Fedora 39\'',
+                           timeout=3D(2 * 60))
+        bb.plain('Installation status: Loading the installer, kernel and=
 initrd...')
+
+        self.target.expect(self.console,
+                           'Setting up the installation environment',
+                           timeout=3D(2 * 60 * 60))
+        bb.plain('Installation status: Setting up the installation envir=
onment...')
+
+        self.target.expect(self.console,
+                           'Installing the software',
+                           timeout=3D(30 * 60))
+        bb.plain('Installation status: Installing the software packages.=
..')
+
+        # Waiting to respond to the boot loader prompt error message.
+        self.target.expect(self.console,
+                           'Please respond \'yes\' or \'no\': ',
+                           timeout=3D(16 * 60 * 60))
+        self.target.sendline(self.console, 'yes')
+
+        # Waiting till the installation is finished.
+        self.target.expect(self.console, r'.*login: ', timeout=3D(5 * 60=
 * 60))
+        bb.plain('Installation status: Fedora installation finished succ=
essfully.')
--=20
2.25.1


