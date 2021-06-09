Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.4932.1623226187155848696
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Jun 2021 01:09:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugo.lhostis@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6518111FB;
	Wed,  9 Jun 2021 01:09:45 -0700 (PDT)
Received: from e126543.arm.com (unknown [10.57.1.94])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A63E93F719;
	Wed,  9 Jun 2021 01:09:44 -0700 (PDT)
From: "Hugo L'Hostis" <hugo.lhostis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-autonomy/xenguest-network: add "none" network type to xenguests
Date: Wed,  9 Jun 2021 09:09:28 +0100
Message-Id: <20210609080928.9518-1-hugo.lhostis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This patch adds a new "none" network type that can be set for xenguests
using XENGUEST_IMAGE_NETWORK_TYPE in their configuration.

Issue-Id: SCM-2338
Signed-off-by: Hugo L'Hostis <hugo.lhostis@arm.com>
Change-Id: If4f6de282b0048e5c68d293a3db5b56cd5adce66
---
 .../recipes-extended/xenguest/files/network-bridge.sh.in       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/network-br=
idge.sh.in b/meta-arm-autonomy/recipes-extended/xenguest/files/network-br=
idge.sh.in
index e697f7e..10bbe36 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh=
.in
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh=
.in
@@ -17,6 +17,9 @@ case "${XENGUEST_NETWORK_TYPE:=3D}" in
         echo "vif =3D ['script=3Dvif-bridge,bridge=3D${BRIDGE_NAME}']" >=
> "${guestcfgfile:?}"
         log info "Network type is bridge: ${BRIDGE_NAME}"
         ;;
+    none)
+        log info "Network type is none"
+        ;;
     *)
         log error "XENGUEST_NETWORK_TYPE=3D$XENGUEST_NETWORK_TYPE invali=
d"
         ;;
--=20
2.25.1

