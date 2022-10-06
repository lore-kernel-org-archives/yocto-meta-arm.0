Return-Path: <rupinderjit.singh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE344C433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 10:03:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.4055.1665050601173340874
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 06 Oct 2022 03:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: rupinderjit.singh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01FA0169C;
	Thu,  6 Oct 2022 03:03:27 -0700 (PDT)
Received: from e123349.cambridge.arm.com (e123349.cambridge.arm.com
 [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 516D13F792;
	Thu,  6 Oct 2022 03:03:20 -0700 (PDT)
From: Rupinderjit Singh <rupinderjit.singh@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Davidson K <davidson.kumaresan@arm.com>
Subject: [PATCH 2/2] arm-bsp/linux-arm64-ack: make it compatible with gcc-12
 for TC
Date: Thu,  6 Oct 2022 11:02:49 +0100
Message-Id: <20221006100249.1557942-2-rupinderjit.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221006100249.1557942-1-rupinderjit.singh@arm.com>
References: <20221006100249.1557942-1-rupinderjit.singh@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 06 Oct 2022 10:03:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3942

From: Davidson K <davidson.kumaresan@arm.com>

Signed-off-by: Davidson K <davidson.kumaresan@arm.com>
Change-Id: I924064547f4e1d2d506b58bf5aa84d5a4d2f9f8e
---
 .../linux/linux-arm-platforms.inc             |  2 +
 ...st-ether_addr-prototypes-to-silence-.patch | 66 +++++++++++++++++++
 ...x-building-error-on-Werror-array-com.patch | 45 +++++++++++++
 3 files changed, 113 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
5/tc/0041-etherdevice-Adjust-ether_addr-prototypes-to-silence-.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.1=
5/tc/0042-mm-page_alloc-fix-building-error-on-Werror-array-com.patch

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 85252462..e370a4bf 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -180,6 +180,8 @@ SRC_URI:append:tc =3D " \
     file://0039-gki_config-add-tc-disable_mpam.patch \
     file://0040-ANDROID-KVM-arm64-disable-FFA-driver-at-EL2.patch \
     file://init_disassemble_info-signature-changes-causes-compile-failur=
es.patch \
+    file://0041-etherdevice-Adjust-ether_addr-prototypes-to-silence-.pat=
ch \
+    file://0042-mm-page_alloc-fix-building-error-on-Werror-array-com.pat=
ch \
     "
 KERNEL_FEATURES:append:tc =3D " bsp/arm-platforms/tc.scc"
 KERNEL_FEATURES:append:tc1 =3D " bsp/arm-platforms/tc-autofdo.scc"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/00=
41-etherdevice-Adjust-ether_addr-prototypes-to-silence-.patch b/meta-arm-=
bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0041-etherdevice-Adjust-=
ether_addr-prototypes-to-silence-.patch
new file mode 100644
index 00000000..b6da77d3
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0041-ethe=
rdevice-Adjust-ether_addr-prototypes-to-silence-.patch
@@ -0,0 +1,66 @@
+From 37948a54f3e49fc2fef157f89d5bb52cefcfe68e Mon Sep 17 00:00:00 2001
+From: Kees Cook <keescook@chromium.org>
+Date: Sat, 12 Feb 2022 09:14:49 -0800
+Subject: [PATCH] etherdevice: Adjust ether_addr* prototypes to silence
+ -Wstringop-overead
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+With GCC 12, -Wstringop-overread was warning about an implicit cast from
+char[6] to char[8]. However, the extra 2 bytes are always thrown away,
+alignment doesn't matter, and the risk of hitting the edge of unallocate=
d
+memory has been accepted, so this prototype can just be converted to a
+regular char *. Silences:
+
+net/core/dev.c: In function =E2=80=98bpf_prog_run_generic_xdp=E2=80=99: =
net/core/dev.c:4618:21: warning: =E2=80=98ether_addr_equal_64bits=E2=80=99=
 reading 8 bytes from a region of size 6 [-Wstringop-overread]
+ 4618 |         orig_host =3D ether_addr_equal_64bits(eth->h_dest, > skb=
->dev->dev_addr);
+      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
+net/core/dev.c:4618:21: note: referencing argument 1 of type =E2=80=98co=
nst u8[8]=E2=80=99 {aka =E2=80=98const unsigned char[8]=E2=80=99}
+net/core/dev.c:4618:21: note: referencing argument 2 of type =E2=80=98co=
nst u8[8]=E2=80=99 {aka =E2=80=98const unsigned char[8]=E2=80=99}
+In file included from net/core/dev.c:91: include/linux/etherdevice.h:375=
:20: note: in a call to function =E2=80=98ether_addr_equal_64bits=E2=80=99
+  375 | static inline bool ether_addr_equal_64bits(const u8 addr1[6+2],
+      |                    ^~~~~~~~~~~~~~~~~~~~~~~
+
+Reported-by: Marc Kleine-Budde <mkl@pengutronix.de>
+Tested-by: Marc Kleine-Budde <mkl@pengutronix.de>
+Link: https://lore.kernel.org/netdev/20220212090811.uuzk6d76agw2vv73@pen=
gutronix.de
+Cc: Jakub Kicinski <kuba@kernel.org>
+Cc: "David S. Miller" <davem@davemloft.net>
+Cc: netdev@vger.kernel.org
+Signed-off-by: Kees Cook <keescook@chromium.org>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/g=
it/torvalds/linux.git/commit/?id=3D2618a0dae09ef37728dab89ff60418cbe25ae6=
bd]
+Change-Id: I41ed4ace65094964eacddf0c56f9fc779f7d4e0c
+Signed-off-by: Davidson K <davidson.kumaresan@arm.com>
+---
+ include/linux/etherdevice.h | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/include/linux/etherdevice.h b/include/linux/etherdevice.h
+index c58d50451485..7f28fa702bb7 100644
+--- a/include/linux/etherdevice.h
++++ b/include/linux/etherdevice.h
+@@ -127,7 +127,7 @@ static inline bool is_multicast_ether_addr(const u8 =
*addr)
+ #endif
+ }
+=20
+-static inline bool is_multicast_ether_addr_64bits(const u8 addr[6+2])
++static inline bool is_multicast_ether_addr_64bits(const u8 *addr)
+ {
+ #if defined(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS) && BITS_PER_LONG =3D=
=3D 64
+ #ifdef __BIG_ENDIAN
+@@ -364,8 +364,7 @@ static inline bool ether_addr_equal(const u8 *addr1,=
 const u8 *addr2)
+  * Please note that alignment of addr1 & addr2 are only guaranteed to b=
e 16 bits.
+  */
+=20
+-static inline bool ether_addr_equal_64bits(const u8 addr1[6+2],
+-					   const u8 addr2[6+2])
++static inline bool ether_addr_equal_64bits(const u8 *addr1, const u8 *a=
ddr2)
+ {
+ #if defined(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS) && BITS_PER_LONG =3D=
=3D 64
+ 	u64 fold =3D (*(const u64 *)addr1) ^ (*(const u64 *)addr2);
+--=20
+2.34.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/00=
42-mm-page_alloc-fix-building-error-on-Werror-array-com.patch b/meta-arm-=
bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0042-mm-page_alloc-fix-b=
uilding-error-on-Werror-array-com.patch
new file mode 100644
index 00000000..1267a82c
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.15/tc/0042-mm-p=
age_alloc-fix-building-error-on-Werror-array-com.patch
@@ -0,0 +1,45 @@
+From 74979dd6327bbaa96ecb8525f8ea6025715d5ba7 Mon Sep 17 00:00:00 2001
+From: Xiongwei Song <sxwjean@gmail.com>
+Date: Fri, 14 Jan 2022 14:07:24 -0800
+Subject: [PATCH] mm: page_alloc: fix building error on -Werror=3Darray-c=
ompare
+
+Arthur Marsh reported we would hit the error below when building kernel
+with gcc-12:
+
+  CC      mm/page_alloc.o
+  mm/page_alloc.c: In function `mem_init_print_info':
+  mm/page_alloc.c:8173:27: error: comparison between two arrays [-Werror=
=3Darray-compare]
+   8173 |                 if (start <=3D pos && pos < end && size > adj)=
 \
+        |
+
+In C++20, the comparision between arrays should be warned.
+
+Link: https://lkml.kernel.org/r/20211125130928.32465-1-sxwjean@me.com
+Signed-off-by: Xiongwei Song <sxwjean@gmail.com>
+Reported-by: Arthur Marsh <arthur.marsh@internode.on.net>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/g=
it/torvalds/linux.git/commit/?id=3Dca831f29f8f25c97182e726429b38c0802200c=
8f]
+Signed-off-by: Davidson K <davidson.kumaresan@arm.com>
+Change-Id: I11931013f1fd42f0f2a75375cdfb129cb3a9d5aa
+---
+ mm/page_alloc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mm/page_alloc.c b/mm/page_alloc.c
+index 185fbddecc83..3affeeb194d4 100644
+--- a/mm/page_alloc.c
++++ b/mm/page_alloc.c
+@@ -8282,7 +8282,7 @@ void __init mem_init_print_info(void)
+ 	 */
+ #define adj_init_size(start, end, size, pos, adj) \
+ 	do { \
+-		if (start <=3D pos && pos < end && size > adj) \
++		if (&start[0] <=3D &pos[0] && &pos[0] < &end[0] && size > adj) \
+ 			size -=3D adj; \
+ 	} while (0)
+=20
+--=20
+2.34.1
+
--=20
2.25.1


