Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A379C7618D
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 23:22:31 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.145891.1680736950313100474
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Apr 2023 16:22:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 422EA40C93
	for <meta-arm@lists.yoctoproject.org>; Wed,  5 Apr 2023 23:22:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6e1d-VEU4pqD for <meta-arm@lists.yoctoproject.org>;
	Wed,  5 Apr 2023 23:22:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2CB3F40AC9
	for <meta-arm@lists.yoctoproject.org>; Wed,  5 Apr 2023 23:22:29 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id BAC721637FB;
	Wed,  5 Apr 2023 19:21:50 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH 3/5] optee-client: add 3.20.0 version
Date: Wed,  5 Apr 2023 23:22:16 +0000
Message-Id: <20230405232218.1563477-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230405232218.1563477-1-denis@denix.org>
References: <20230405232218.1563477-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 05 Apr 2023 23:22:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4552

New version now uses and looks for pkgconfig and uuid during do_configure=
.

https://github.com/OP-TEE/optee_client/releases/tag/3.20.0

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta-arm/recipes-security/optee/optee-client_3.20.0.bb | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 meta-arm/recipes-security/optee/optee-client_3.20.0.b=
b

diff --git a/meta-arm/recipes-security/optee/optee-client_3.20.0.bb b/met=
a-arm/recipes-security/optee/optee-client_3.20.0.bb
new file mode 100644
index 00000000..1e69136e
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-client_3.20.0.bb
@@ -0,0 +1,7 @@
+require optee-client.inc
+
+SRCREV =3D "dd2d39b49975d2ada7870fe2b7f5a84d0d3860dc"
+
+inherit pkgconfig
+DEPENDS +=3D "util-linux"
+EXTRA_OEMAKE +=3D "PKG_CONFIG=3Dpkg-config"
--=20
2.25.1


