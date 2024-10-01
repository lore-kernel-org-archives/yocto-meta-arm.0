Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF806CE7D0B
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 10:18:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.78123.1727777930473137776
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Oct 2024 03:18:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C603339
	for <meta-arm@lists.yoctoproject.org>; Tue,  1 Oct 2024 03:19:19 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 872A83F58B
	for <meta-arm@lists.yoctoproject.org>; Tue,  1 Oct 2024 03:18:49 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][master] arm-base/linux-yocto: revert interim 6.10 patch for fvp-base
Date: Tue,  1 Oct 2024 11:18:44 +0100
Message-Id: <20241001101844.505373-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 01 Oct 2024 10:18:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6153

oe-core master now has 6.10.11 which incorporates this patch, so we don't
need to carry it anymore.

This reverts commit 60fd47edd0f4757c11554848d717283f06c8c846.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...gso-csum-offset-check-in-virtio_net_.patch | 59 -------------------
 .../linux/linux-arm-platforms.inc             |  1 -
 2 files changed, 60 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/fvp-base/0001=
-net-tighten-bad-gso-csum-offset-check-in-virtio_net_.patch

diff --git a/meta-arm-bsp/recipes-kernel/linux/files/fvp-base/0001-net-ti=
ghten-bad-gso-csum-offset-check-in-virtio_net_.patch b/meta-arm-bsp/recip=
es-kernel/linux/files/fvp-base/0001-net-tighten-bad-gso-csum-offset-check=
-in-virtio_net_.patch
deleted file mode 100644
index 9985d579..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/fvp-base/0001-net-tighten-b=
ad-gso-csum-offset-check-in-virtio_net_.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 6513eb3d3191574b58859ef2d6dc26c0277c6f81 Mon Sep 17 00:00:00 2001
-From: Willem de Bruijn <willemb@google.com>
-Date: Tue, 10 Sep 2024 17:35:35 -0400
-Subject: [PATCH] net: tighten bad gso csum offset check in virtio_net_hd=
r
-
-The referenced commit drops bad input, but has false positives.
-Tighten the check to avoid these.
-
-The check detects illegal checksum offload requests, which produce
-csum_start/csum_off beyond end of packet after segmentation.
-
-But it is based on two incorrect assumptions:
-
-1. virtio_net_hdr_to_skb with VIRTIO_NET_HDR_GSO_TCP[46] implies GSO.
-True in callers that inject into the tx path, such as tap.
-But false in callers that inject into rx, like virtio-net.
-Here, the flags indicate GRO, and CHECKSUM_UNNECESSARY or
-CHECKSUM_NONE without VIRTIO_NET_HDR_F_NEEDS_CSUM is normal.
-
-2. TSO requires checksum offload, i.e., ip_summed =3D=3D CHECKSUM_PARTIA=
L.
-False, as tcp[46]_gso_segment will fix up csum_start and offset for
-all other ip_summed by calling __tcp_v4_send_check.
-
-Because of 2, we can limit the scope of the fix to virtio_net_hdr
-that do try to set these fields, with a bogus value.
-
-Link: https://lore.kernel.org/netdev/20240909094527.GA3048202@port70.net=
/
-Fixes: 89add40066f9 ("net: drop bad gso csum_start and offset in virtio_=
net_hdr")
-Signed-off-by: Willem de Bruijn <willemb@google.com>
-Acked-by: Jason Wang <jasowang@redhat.com>
-Acked-by: Michael S. Tsirkin <mst@redhat.com>
-Cc: stable@vger.kernel.org
-Link: https://patch.msgid.link/20240910213553.839926-1-willemdebruijn.ke=
rnel@gmail.com
-Signed-off-by: Jakub Kicinski <kuba@kernel.org>
-
-Upstream-Status: Backport
-Signed-off-by: Jon Mason <jon.mason@arm.com>
-
----
- include/linux/virtio_net.h | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/include/linux/virtio_net.h b/include/linux/virtio_net.h
-index 6c395a2600e8..276ca543ef44 100644
---- a/include/linux/virtio_net.h
-+++ b/include/linux/virtio_net.h
-@@ -173,7 +173,8 @@ static inline int virtio_net_hdr_to_skb(struct sk_bu=
ff *skb,
- 			break;
- 		case SKB_GSO_TCPV4:
- 		case SKB_GSO_TCPV6:
--			if (skb->csum_offset !=3D offsetof(struct tcphdr, check))
-+			if (skb->ip_summed =3D=3D CHECKSUM_PARTIAL &&
-+			    skb->csum_offset !=3D offsetof(struct tcphdr, check))
- 				return -EINVAL;
- 			break;
- 		}
---=20
-2.39.2
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index ac7bcf7a..01803ba2 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -65,7 +65,6 @@ KMACHINE:fvp-base =3D "fvp"
 FILESEXTRAPATHS:prepend:fvp-base :=3D "${ARMBSPFILESPATHS}:${ARMFILESPAT=
HS}"
 SRC_URI:append:fvp-base =3D " \
     file://0001-arm64-dts-fvp-Enable-virtio-rng-support.patch \
-    file://0001-net-tighten-bad-gso-csum-offset-check-in-virtio_net_.pat=
ch \
     file://tee.cfg \
     ${@bb.utils.contains('MACHINE_FEATURES', 'ts-smm-gateway', \
                          'file://no-strict-devmem.cfg', '' , d)} \
--=20
2.34.1


