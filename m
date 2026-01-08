Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68841D1D493
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 20:18:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15943.1767903500903899853
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 08 Jan 2026 12:18:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB4FE1682;
	Thu,  8 Jan 2026 12:18:13 -0800 (PST)
Received: from LXKV206JHX.arm.com (unknown [10.57.48.86])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE7823F5A1;
	Thu,  8 Jan 2026 12:18:19 -0800 (PST)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: [PATCH whinlatter 1/2] corstone1000: Pin layers SHA for whinlatter release
Date: Thu,  8 Jan 2026 20:18:11 +0000
Message-ID: <20260108201812.37201-2-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260108201812.37201-1-hugues.kambampiana@arm.com>
References: <20260108201812.37201-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 08 Jan 2026 20:18:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6825

Pinned layers in corstone1000-base.yml and corstone1000-a320.yml.

Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
---
 kas/corstone1000-a320.yml | 2 ++
 kas/corstone1000-base.yml | 7 +++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/kas/corstone1000-a320.yml b/kas/corstone1000-a320.yml
index 8a7739af..ef5f47e4 100644
--- a/kas/corstone1000-a320.yml
+++ b/kas/corstone1000-a320.yml
@@ -12,6 +12,8 @@ repos:
   meta-ethos:
     url: https://gitlab.arm.com/iot/meta-ethos.git
     branch: whinlatter
+    commit: aa2504a32f62d29caa17391d10c530576d27212e
   meta-sca:
     url: https://github.com/priv-kweihmann/meta-sca.git
     branch: master
+    commit: e68f1a9d17553a2a1b5b20962749f90482112a3f
diff --git a/kas/corstone1000-base.yml b/kas/corstone1000-base.yml
index 4438bcb8..7614d7bb 100644
--- a/kas/corstone1000-base.yml
+++ b/kas/corstone1000-base.yml
@@ -10,16 +10,19 @@ defaults:
 repos:
   bitbake:
     url: https://git.openembedded.org/bitbake
+    commit: 0dde1a3ff852be057be40d17f233ecca19e7b389
     layers:
       bitbake: disabled
=20
   core:
     url: https://git.openembedded.org/openembedded-core
+    commit: 4bd920ad7d7279020ea6e561d0584ae70f33f751
     layers:
       meta:
=20
   meta-yocto:
     url: https://git.yoctoproject.org/meta-yocto
+    commit: b3b659263566c4d2f2813190e72d93f8598a4c47
     layers:
       meta-poky:
=20
@@ -31,7 +34,7 @@ repos:
=20
   meta-openembedded:
     url: https://git.openembedded.org/meta-openembedded
-    # commit: 461d85a1831318747af5abe86da193bcde3fd9b4
+    commit: fc0152e434307b98e1d16251f92ed81ac617c1db
     layers:
       meta-oe:
       meta-python:
@@ -39,7 +42,7 @@ repos:
=20
   meta-secure-core:
     url: https://github.com/wind-river/meta-secure-core.git
-    # commit: 59d7e90542947c342098863b9998693ac79352b0
+    commit: 63209fb1500cee88d5d4d74669bce4b613c03ff7
     layers:
       meta-secure-core-common:
       meta-signing-key:

