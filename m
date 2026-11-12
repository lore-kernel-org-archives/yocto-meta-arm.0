Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.446.1794500791969967347
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 Nov 2026 08:26:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=AEYbn43R;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85D491516;
	Thu, 12 Nov 2026 08:26:28 -0800 (PST)
Received: from e142474.cambridge.arm.com (e142474.arm.com [10.2.203.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 207AD3F673;
	Thu, 12 Nov 2026 08:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794500791; bh=b5Yih3T8YRZuZxHoOma6jJx3zUaPE9CywCAlEr4nk0o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AEYbn43RJGTffLjUb/s4f1J5yvAZasO1c3LDdHKHjadq9MIgeJOHNxIpiT5ex4+3k
	 oh2nOIxHE6clg/SuUedv0a2y28agtXY3ObrYO41F98At+3jLUJEtCxWcOsjLOd4dFu
	 Aloho1VRXnRzUtJxFHGcqZZ2VsVGSbKk08EbXoNs=
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH blacksail 3/3] corstone1000: Pin layer SHAs for blacksail release
Date: Thu, 12 Nov 2026 16:25:41 +0000
Message-ID: <20261112162549.1127024-4-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112162549.1127024-1-harsimransingh.tungal@arm.com>
References: <20261112162549.1127024-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arm@lists.yoctoproject.org>; Thu, 12 Nov 2026 16:26:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7213
Content-Type: text/plain; charset="utf-8"

Pin the Corstone-1000 kas layer revisions for the Blacksail release.

Set the default repository branch to blacksail and pin bitbake,
openembedded-core, meta-yocto, meta-openembedded, and meta-secure-core.

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 kas/corstone1000-base.yml | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/kas/corstone1000-base.yml b/kas/corstone1000-base.yml
index 4438bcb8..43d2f743 100644
--- a/kas/corstone1000-base.yml
+++ b/kas/corstone1000-base.yml
@@ -5,21 +5,25 @@ distro: poky
=20
 defaults:
   repos:
-    branch: master
+    branch: blacksail
=20
 repos:
   bitbake:
     url: https://git.openembedded.org/bitbake
+    branch: "2.20"
+    commit: 634f8dede6b9d71b5a6691499fd05a8678b46eae
     layers:
       bitbake: disabled
=20
   core:
     url: https://git.openembedded.org/openembedded-core
+    commit: e182a0c4b91fd459c1f9dece0c7c23f7f9eaa7ab
     layers:
       meta:
=20
   meta-yocto:
     url: https://git.yoctoproject.org/meta-yocto
+    commit: d0119aa2eb77b985fcd33ac527d5c0287eb68e58
     layers:
       meta-poky:
=20
@@ -31,7 +35,7 @@ repos:
=20
   meta-openembedded:
     url: https://git.openembedded.org/meta-openembedded
-    # commit: 461d85a1831318747af5abe86da193bcde3fd9b4
+    commit: a9d69bc066bf9498397db27902c287dd666fdfd4
     layers:
       meta-oe:
       meta-python:
@@ -39,7 +43,8 @@ repos:
=20
   meta-secure-core:
     url: https://github.com/wind-river/meta-secure-core.git
-    # commit: 59d7e90542947c342098863b9998693ac79352b0
+    branch: master
+    commit: 56316bacdb3e79defca52ff016a406daa8034c67
     layers:
       meta-secure-core-common:
       meta-signing-key:
