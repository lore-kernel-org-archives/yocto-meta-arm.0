Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 592ABC36010
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 18:12:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.29776.1743012733725526986
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 26 Mar 2025 11:12:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E066C1424
	for <meta-arm@lists.yoctoproject.org>; Wed, 26 Mar 2025 11:12:18 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 04F483F58B
	for <meta-arm@lists.yoctoproject.org>; Wed, 26 Mar 2025 11:12:12 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/4] ci/update-repos: always pass the latest URL
Date: Wed, 26 Mar 2025 18:12:06 +0000
Message-ID: <20250326181206.1287342-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326181206.1287342-1-ross.burton@arm.com>
References: <20250326181206.1287342-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 26 Mar 2025 18:12:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6417

Instead of assuming that the repository was created with the latest URL,
fetch the repository explicitly when fetching.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/update-repos | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ci/update-repos b/ci/update-repos
index ef69ee45..c44246cc 100755
--- a/ci/update-repos
+++ b/ci/update-repos
@@ -44,7 +44,7 @@ if __name__ =3D=3D "__main__":
         if repodir.exists():
             try:
                 print("Updating %s..." % repo)
-                subprocess.run(["git", "-C", repodir, "-c", "gc.autoDeta=
ch=3Dfalse", "fetch"], check=3DTrue)
+                subprocess.run(["git", "-C", repodir, "-c", "gc.autoDeta=
ch=3Dfalse", "fetch", repo], check=3DTrue)
             except subprocess.CalledProcessError as e:
                 print(e)
                 failed =3D True
--=20
2.43.0


