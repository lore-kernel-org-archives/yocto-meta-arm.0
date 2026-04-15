Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B0FEF433C4
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 21:10:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5766.1776287423082781373
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 15 Apr 2026 14:10:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=dSqSlSdF;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2D912BCC
	for <meta-arm@lists.yoctoproject.org>; Wed, 15 Apr 2026 14:10:16 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 136CC3F7B4
	for <meta-arm@lists.yoctoproject.org>; Wed, 15 Apr 2026 14:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776287422; bh=S1Ouecr1KyTolZsD4LXr2MpiLTTuyrmoqf+WSvqS688=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dSqSlSdFDtxwopxbB1d/QdBqV4i6FzabyNJJ2S30eea/tGiEvAXPJYS0qVBamFncB
	 zEGDJd4In2eNDRjwNqC801LAzovfG3JmIx/GcIvpukQvM2g+jq9XkIxQU29n+K4zYm
	 CmMlsHj1lFDhT85K4jjTXVAuz/qmmzh7TZilW79A=
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] CI: remove meta-virtualization references
Date: Wed, 15 Apr 2026 22:10:17 +0100
Message-ID: <20260415211017.2408020-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260415211017.2408020-1-ross.burton@arm.com>
References: <20260415211017.2408020-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 15 Apr 2026 21:10:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7015

Now that Xen has been removed, clean up the remaining references to
the meta-virtualization layer.

This was done as a separate commit to make reverting easier in the
future in case we need to add back meta-virtualization for some other
builds.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml             |  2 +-
 ci/meta-virtualization.yml | 10 ----------
 ci/update-repos            |  1 -
 3 files changed, 1 insertion(+), 12 deletions(-)
 delete mode 100644 ci/meta-virtualization.yml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 1e492cd4f4..e40ae84d2d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -106,7 +106,7 @@ update-repos:
         echo Using existing lockfile.yml
       else
         # Be sure that this is the complete list of layers being fetched
-        kas dump --lock --update ci/qemuarm64.yml:ci/meta-openembedded.y=
ml:ci/clang.yml:ci/meta-virtualization.yml | tee lockfile.yml
+        kas dump --lock --update ci/qemuarm64.yml:ci/meta-openembedded.y=
ml:ci/clang.yml | tee lockfile.yml
       fi
       exit $exit_code
   artifacts:
diff --git a/ci/meta-virtualization.yml b/ci/meta-virtualization.yml
deleted file mode 100644
index c0ba70ba8e..0000000000
--- a/ci/meta-virtualization.yml
+++ /dev/null
@@ -1,10 +0,0 @@
-# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
-
-header:
-  version: 14
-  includes:
-    - ci/meta-openembedded.yml
-
-repos:
-  meta-virtualization:
-    url: https://git.yoctoproject.org/meta-virtualization
diff --git a/ci/update-repos b/ci/update-repos
index e70ed0d963..8e4c1686a1 100755
--- a/ci/update-repos
+++ b/ci/update-repos
@@ -22,7 +22,6 @@ def repo_shortname(url):
 repositories =3D (
     "https://git.yoctoproject.org/poky",
     "https://git.openembedded.org/meta-openembedded",
-    "https://git.yoctoproject.org/meta-virtualization",
 )
=20
 if __name__ =3D=3D "__main__":
--=20
2.43.0


