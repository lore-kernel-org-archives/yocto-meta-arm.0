Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.2753.1614806859784903727
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 03 Mar 2021 13:27:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6729D6E
	for <meta-arm@lists.yoctoproject.org>; Wed,  3 Mar 2021 13:27:37 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 911113F7D7
	for <meta-arm@lists.yoctoproject.org>; Wed,  3 Mar 2021 13:27:37 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] kas: update meta-clang to use the gatesgarth branch
Date: Wed,  3 Mar 2021 21:27:34 +0000
Message-Id: <20210303212734.758924-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210303212734.758924-1-ross.burton@arm.com>
References: <20210303212734.758924-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

When the CI was written there wasn't a gatesgarth branch, but there is no=
w
and it is needed as master meta-clang doesn't work with gatesgarth oe-cor=
e.

Change-Id: Ief06b6c5be11dd7fc77520f5601b662bdca52891
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 kas/clang.yml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kas/clang.yml b/kas/clang.yml
index 3c18c7a..1d71c15 100644
--- a/kas/clang.yml
+++ b/kas/clang.yml
@@ -4,8 +4,7 @@ header:
 repos:
   meta-clang:
     url: https://github.com/kraj/meta-clang
-    # This doesn't (yet) have a gatesgarth branch
-    refspec: master
+    refspec: gatesgarth
=20
 local_conf_header:
   clang: |
--=20
2.25.1

