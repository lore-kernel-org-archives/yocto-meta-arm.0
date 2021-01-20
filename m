Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.29625.1611157181513542028
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 20 Jan 2021 07:39:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4A9C31B;
	Wed, 20 Jan 2021 07:39:30 -0800 (PST)
Received: from e125920.arm.com (unknown [10.57.42.111])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C0EEE3F68F;
	Wed, 20 Jan 2021 07:39:29 -0800 (PST)
From: peter.hoyes@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH] arm-autonomy/linux-arm-autonomy: Add explicit dependency on bridge.cfg
Date: Wed, 20 Jan 2021 15:39:38 +0000
Message-Id: <20210120153938.2353135-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Peter Hoyes <Peter.Hoyes@arm.com>

xenguest-network depends on CONFIG_BRIDGE_NETFILTER, but the default
value changed to 'n' in Linux 5.6
(http://git.yoctoproject.org/cgit.cgi/linux-yocto/commit/?id=3D98bda63e20=
daab95bdc084ce00459a4f622a0505).
Include bridge.cfg to define CONFIG_BRIDGE_NETFILTER manually for Xen
host builds.

Issue-Id: SCM-2057
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: Id920d14f87a95214ee722007de923fd27b61afb3
---
 .../features/arm-autonomy/xen-host-iptables.scc                  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/fe=
atures/arm-autonomy/xen-host-iptables.scc b/meta-arm-autonomy/recipes-ker=
nel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host-iptables.scc
index 8f8ba45..0820064 100644
--- a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/=
arm-autonomy/xen-host-iptables.scc
+++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/=
arm-autonomy/xen-host-iptables.scc
@@ -5,5 +5,6 @@
 define KFEATURE_DESCRIPTION "Enable netfilter + conn tracking + extras"
 define KFEATURE_COMPATIBILITY all
=20
+include cfg/net/bridge.scc
 include features/netfilter/netfilter.scc
 kconf non-hardware netfilter-extra.cfg
--=20
2.25.1

