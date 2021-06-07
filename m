Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.32799.1623051155927135186
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Jun 2021 00:32:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugo.lhostis@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3387E31B;
	Mon,  7 Jun 2021 00:32:34 -0700 (PDT)
Received: from e126543.arm.com (unknown [10.57.35.186])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 62F183F719;
	Mon,  7 Jun 2021 00:32:33 -0700 (PDT)
From: "Hugo L'Hostis" <hugo.lhostis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-autonomy/xenguest-manager: fix xenguest initscript stop sequence
Date: Mon,  7 Jun 2021 08:32:14 +0100
Message-Id: <20210607073214.10247-1-hugo.lhostis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This patch fixes an issue where xenguest initscript stop sequence was not
properly identifying the running guests.

Issue-Id: SCM-2772
Signed-off-by: Hugo L'Hostis <hugo.lhostis@arm.com>
Change-Id: I3ad88e00f48fab07f99936a10c0d1deb7459e83b
---
 meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-i=
nit b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
index 5862cb9..115b2d6 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
@@ -66,7 +66,7 @@ case "$1" in
   stop)
         echo "Stopping xenguest"
         # update guest list
-        guestlist=3D$(xenguest-manager status | grep Running | cut -d ":=
" -f1)
+        guestlist=3D$(xenguest-manager status | grep Running | cut -d " =
" -f1)
         for f in ${guestlist}; do
             xenguest-manager shutdown "${f}" --kill
         done
--=20
2.25.1

