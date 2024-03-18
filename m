Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 158CAC54E58
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 13:37:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.44490.1710769054430735932
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 Mar 2024 06:37:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE77DDA7
	for <meta-arm@lists.yoctoproject.org>; Mon, 18 Mar 2024 06:38:08 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8AE0A3F23F
	for <meta-arm@lists.yoctoproject.org>; Mon, 18 Mar 2024 06:37:33 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] Add SECURITY.md
Date: Mon, 18 Mar 2024 13:37:30 +0000
Message-Id: <20240318133730.3207078-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 18 Mar 2024 13:37:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5448

From: Ross Burton <ross.burton@arm.com>

---
 SECURITY.md | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 SECURITY.md

diff --git a/SECURITY.md b/SECURITY.md
new file mode 100644
index 00000000..0fa6cbcd
--- /dev/null
+++ b/SECURITY.md
@@ -0,0 +1,37 @@
+# Reporting vulnerabilities
+
+Arm takes security issues seriously and welcomes feedback from researche=
rs and
+the security community in order to improve the security of its products =
and
+services. We operate a coordinated disclosure policy for disclosing
+vulnerabilities and other security issues.
+
+Security issues can be complex and one single timescale doesn't fit all
+circumstances. We will make best endeavours to inform you when we expect
+security notifications and fixes to be available and facilitate coordina=
ted
+disclosure when notifications and patches/mitigations are available.
+
+
+## How to Report a Potential Vulnerability?
+
+If you would like to report a public issue (for example, one with a rele=
ased CVE
+number), please contact the meta-arm mailing list at
+meta-arm@lists.yoctoproject.org and arm-security@arm.com.
+
+If you are dealing with a not-yet released or urgent issue, please send =
a mail
+to the maintainers (see README.md) and arm-security@arm.com, including a=
s much
+detail as possible.  Encrypted emails using PGP are welcome.
+
+For more information, please visit https://developer.arm.com/support/arm=
-security-updates/report-security-vulnerabilities.
+
+
+## Branches maintained with security fixes
+
+meta-arm follows the Yocto release model, so see
+[https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS Stable releas=
e and
+LTS] for detailed info regarding the policies and maintenance of stable
+branches.
+
+The [https://wiki.yoctoproject.org/wiki/Releases Release page] contains =
a list of all
+releases of the Yocto Project. Versions in grey are no longer actively m=
aintained with
+security patches, but well-tested patches may still be accepted for them=
 for
+significant issues.
--=20
2.34.1


