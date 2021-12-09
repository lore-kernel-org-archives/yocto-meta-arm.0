Return-Path: <hugo.lhostis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32159C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 09:35:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.9563.1639042503659635771
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 01:35:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugo.lhostis@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 140181474;
	Thu,  9 Dec 2021 01:35:03 -0800 (PST)
Received: from e126543.cambridge.arm.com (unknown [10.1.195.13])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 987323F73B;
	Thu,  9 Dec 2021 01:35:02 -0800 (PST)
From: Hugo L'Hostis <hugo.lhostis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] kas: Update include syntax to kas 2.6
Date: Thu,  9 Dec 2021 09:34:55 +0000
Message-Id: <20211209093455.8774-1-hugo.lhostis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 09 Dec 2021 09:35:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2573

Using a path relative to a kas yaml file to include another kas yaml
file won't be supported in the future. This patch also updates the
documentation for fvp-baser to set the minimal supported version of kas
to 2.6.

Signed-off-by: Hugo L'Hostis <hugo.lhostis@arm.com>
Change-Id: I757103c5433bca7af9ab024370cd1e994d59fe0e
---
 kas/fvp-baser-aemv8r64-rt-bsp.yml                | 2 +-
 meta-arm-bsp/documentation/fvp-baser-aemv8r64.md | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/kas/fvp-baser-aemv8r64-rt-bsp.yml b/kas/fvp-baser-aemv8r64-r=
t-bsp.yml
index 69335e3..19ee747 100644
--- a/kas/fvp-baser-aemv8r64-rt-bsp.yml
+++ b/kas/fvp-baser-aemv8r64-rt-bsp.yml
@@ -1,7 +1,7 @@
 header:
   version: 9
   includes:
-    - fvp-baser-aemv8r64-bsp.yml
+    - kas/fvp-baser-aemv8r64-bsp.yml
=20
 local_conf_header:
   base-rt: |
diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-=
bsp/documentation/fvp-baser-aemv8r64.md
index 0c801c0..fdf5038 100644
--- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
+++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
@@ -44,7 +44,8 @@ Ubuntu 20.04.
 Install the required packages for the build host:
 https://docs.yoctoproject.org/singleindex.html#required-packages-for-the=
-build-host
=20
-Install the kas setup tool for bitbake based projects:
+Kas is a setup tool for bitbake based projects. The minimal supported ve=
rsion
+is 2.6, install it like so:
=20
     pip3 install --user kas
=20
--=20
2.25.1


