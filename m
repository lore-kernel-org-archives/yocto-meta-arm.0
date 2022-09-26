Return-Path: <anton.antonov@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59DEBC32771
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 13:13:07 +0000 (UTC)
Received: from cam-smtp0.cambridge.arm.com (cam-smtp0.cambridge.arm.com
 [217.140.106.50])
 by mx.groups.io with SMTP id smtpd.web10.28135.1664197984548635188
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Sep 2022 06:13:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.106.50, mailfrom: anton.antonov@arm.com)
Received: from atg-devlab-kelpie.cambridge.arm.com
 (atg-devlab-kelpie.cambridge.arm.com [10.2.80.92])
	by cam-smtp0.cambridge.arm.com (8.13.8/8.13.8) with ESMTP id 28QDFRoI022073;
	Mon, 26 Sep 2022 14:15:27 +0100
From: Anton Antonov <Anton.Antonov@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Anton.Antonov@arm.com
Subject: [PATCH] Temporary use qemu 7.0.0 for TS CI pipelines
Date: Mon, 26 Sep 2022 14:12:43 +0100
Message-Id: <20220926131243.1578997-1-Anton.Antonov@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 cam-smtp0.cambridge.arm.com id 28QDFRoI022073
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 26 Sep 2022 13:13:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3838

Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
---
 0001-Revert-qemu-Upgrade-7.0.0-7.1.0.patch    | 709 ++++++++++++++++++
 ...murunner-Update-to-match-qmp-changes.patch |  40 +
 ci/qemuarm64-secureboot-ts.yml                |  12 +
 3 files changed, 761 insertions(+)
 create mode 100644 0001-Revert-qemu-Upgrade-7.0.0-7.1.0.patch
 create mode 100644 0001-Revert-qemurunner-Update-to-match-qmp-changes.pa=
tch

diff --git a/0001-Revert-qemu-Upgrade-7.0.0-7.1.0.patch b/0001-Revert-qem=
u-Upgrade-7.0.0-7.1.0.patch
new file mode 100644
index 00000000..233ddf74
--- /dev/null
+++ b/0001-Revert-qemu-Upgrade-7.0.0-7.1.0.patch
@@ -0,0 +1,709 @@
+From 78eac7bcb279e1d1ebd82e7323dab25d9ac727db Mon Sep 17 00:00:00 2001
+From: Anton Antonov <Anton.Antonov@arm.com>
+Date: Sat, 24 Sep 2022 11:06:38 +0100
+Subject: [PATCH] Revert "qemu: Upgrade 7.0.0 -> 7.1.0"
+
+This reverts commit 9040d46f59643270695afdb093e8b403b89b898a.
+
+OPTEE kernel driver hangs during initialisation under qemu 7.1.0
+if CONFIG_ARM_FFA_TRANSPORT=3Dy which is required for Trusted Services.
+
+This is a temporary workaround for CI pipelines until a proper fix is im=
plemented.
+https://github.com/OP-TEE/optee_os/issues/5551
+
+Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
+---
+ meta/conf/distro/include/tcmode-default.inc   |   2 +-
+ ...u-native_7.1.0.bb =3D> qemu-native_7.0.0.bb} |   0
+ ...e_7.1.0.bb =3D> qemu-system-native_7.0.0.bb} |   3 +-
+ meta/recipes-devtools/qemu/qemu.inc           |  19 +--
+ ...t-against-buggy-or-malicious-guest-d.patch |  47 ++++++
+ .../qemu/qemu/CVE-2021-3507_1.patch           |  92 +++++++++++
+ .../qemu/qemu/CVE-2021-3507_2.patch           | 115 ++++++++++++++
+ .../qemu/qemu/CVE-2022-0216_1.patch           |  42 +++++
+ .../qemu/qemu/CVE-2022-0216_2.patch           | 146 ++++++++++++++++++
+ .../qemu/qemu/CVE-2022-35414.patch            |  53 +++++++
+ meta/recipes-devtools/qemu/qemu/cross.patch   |  17 +-
+ .../qemu/{qemu_7.1.0.bb =3D> qemu_7.0.0.bb}     |   0
+ 12 files changed, 517 insertions(+), 19 deletions(-)
+ rename meta/recipes-devtools/qemu/{qemu-native_7.1.0.bb =3D> qemu-nativ=
e_7.0.0.bb} (100%)
+ rename meta/recipes-devtools/qemu/{qemu-system-native_7.1.0.bb =3D> qem=
u-system-native_7.0.0.bb} (90%)
+ create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3507_1.patc=
h
+ create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3507_2.patc=
h
+ create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-0216_1.patc=
h
+ create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-0216_2.patc=
h
+ create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-35414.patch
+ rename meta/recipes-devtools/qemu/{qemu_7.1.0.bb =3D> qemu_7.0.0.bb} (1=
00%)
+
+diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/dis=
tro/include/tcmode-default.inc
+index 59b226e62f..9abd121e3a 100644
+--- a/meta/conf/distro/include/tcmode-default.inc
++++ b/meta/conf/distro/include/tcmode-default.inc
+@@ -22,7 +22,7 @@ BINUVERSION ?=3D "2.39%"
+ GDBVERSION ?=3D "12.%"
+ GLIBCVERSION ?=3D "2.36"
+ LINUXLIBCVERSION ?=3D "5.19%"
+-QEMUVERSION ?=3D "7.1%"
++QEMUVERSION ?=3D "7.0%"
+ GOVERSION ?=3D "1.19%"
+ # This can not use wildcards like 8.0.% since it is also used in mesa t=
o denote
+ # llvm version being used, so always bump it with llvm recipe version b=
ump
+diff --git a/meta/recipes-devtools/qemu/qemu-native_7.1.0.bb b/meta/reci=
pes-devtools/qemu/qemu-native_7.0.0.bb
+similarity index 100%
+rename from meta/recipes-devtools/qemu/qemu-native_7.1.0.bb
+rename to meta/recipes-devtools/qemu/qemu-native_7.0.0.bb
+diff --git a/meta/recipes-devtools/qemu/qemu-system-native_7.1.0.bb b/me=
ta/recipes-devtools/qemu/qemu-system-native_7.0.0.bb
+similarity index 90%
+rename from meta/recipes-devtools/qemu/qemu-system-native_7.1.0.bb
+rename to meta/recipes-devtools/qemu/qemu-system-native_7.0.0.bb
+index 04c7c2a6ac..5ccede5095 100644
+--- a/meta/recipes-devtools/qemu/qemu-system-native_7.1.0.bb
++++ b/meta/recipes-devtools/qemu/qemu-system-native_7.0.0.bb
+@@ -28,6 +28,5 @@ do_install:append() {
+     rm -rf ${D}${includedir}/qemu-plugin.h
+=20
+     # Install qmp.py to be used with testimage
+-    install -d ${D}${libdir}/qemu-python/qmp/
+-    install -D ${S}/python/qemu/qmp/* ${D}${libdir}/qemu-python/qmp/
++    install -D ${S}/python/qemu/qmp/__init__.py ${D}${libdir}/qemu-pyth=
on/qmp.py
+ }
+diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools=
/qemu/qemu.inc
+index 659e70c0f4..cfcd96a207 100644
+--- a/meta/recipes-devtools/qemu/qemu.inc
++++ b/meta/recipes-devtools/qemu/qemu.inc
+@@ -27,11 +27,17 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.=
tar.xz \
+            file://0008-tests-meson.build-use-relative-path-to-refer-to-=
file.patch \
+            file://0009-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-neede=
d-li.patch \
+            file://0010-hw-pvrdma-Protect-against-buggy-or-malicious-gue=
st-d.patch \
++           file://qemu-7.0.0-glibc-2.36.patch \
++           file://CVE-2022-35414.patch \
++           file://CVE-2021-3507_1.patch \
++           file://CVE-2021-3507_2.patch \
++           file://CVE-2022-0216_1.patch \
++           file://CVE-2022-0216_2.patch \
+            file://0001-net-tulip-Restrict-DMA-engine-to-memories.patch =
\
+            "
+ UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
+=20
+-SRC_URI[sha256sum] =3D "a0634e536bded57cf38ec8a751adb124b89c776fe0846f2=
1ab6c6728f1cbbbe6"
++SRC_URI[sha256sum] =3D "f6b375c7951f728402798b0baabb2d86478ca53d44cedbe=
fabbe1c46bf46f839"
+=20
+ SRC_URI:append:class-target =3D " file://cross.patch"
+ SRC_URI:append:class-nativesdk =3D " file://cross.patch"
+@@ -70,14 +76,8 @@ do_install_ptest() {
+ 	# Strip the paths from the QEMU variable, we can use PATH
+ 	sed -i -e "s#^QEMU=3D.*/qemu-#QEMU=3Dqemu-#g" ${D}${PTEST_PATH}/tests/=
tcg/*.mak
+=20
+-	# Strip compiler flags as they break reproducibility
+-	sed -i -e "s,^CC=3D.*,CC=3Dgcc," \
+-	       -e "s,^CCAS=3D.*,CCAS=3Dgcc," \
+-	       -e "s,^LD=3D.*,LD=3Dld," ${D}${PTEST_PATH}/tests/tcg/*.mak
+-
+-	# Update SRC_PATH variable to the right place on target
+-	sed -i -e "s#^SRC_PATH=3D.*#SRC_PATH=3D${PTEST_PATH}#g" ${D}${PTEST_PA=
TH}/tests/tcg/*.mak
+-
++        # Strip compiler flags as they break reproducibility
++        sed -i -e "s,CROSS_CC_GUEST=3D.*,CROSS_CC_GUEST=3D," ${D}${PTES=
T_PATH}/tests/tcg/*.mak
+ }
+=20
+ # QEMU_TARGETS is overridable variable
+@@ -152,6 +152,7 @@ PACKAGECONFIG[uring] =3D "--enable-linux-io-uring,--=
disable-linux-io-uring,liburin
+ PACKAGECONFIG[xen] =3D "--enable-xen,--disable-xen,xen-tools,xen-tools-=
libxenstore xen-tools-libxenctrl xen-tools-libxenguest"
+ PACKAGECONFIG[vnc-sasl] =3D "--enable-vnc --enable-vnc-sasl,--disable-v=
nc-sasl,cyrus-sasl,"
+ PACKAGECONFIG[vnc-jpeg] =3D "--enable-vnc --enable-vnc-jpeg,--disable-v=
nc-jpeg,jpeg,"
++PACKAGECONFIG[vnc-png] =3D "--enable-vnc --enable-vnc-png,--disable-vnc=
-png,libpng,"
+ PACKAGECONFIG[libcurl] =3D "--enable-curl,--disable-curl,curl,"
+ PACKAGECONFIG[nss] =3D "--enable-smartcard,--disable-smartcard,nss,"
+ PACKAGECONFIG[curses] =3D "--enable-curses,--disable-curses,ncurses,"
+diff --git a/meta/recipes-devtools/qemu/qemu/0010-hw-pvrdma-Protect-agai=
nst-buggy-or-malicious-guest-d.patch b/meta/recipes-devtools/qemu/qemu/00=
10-hw-pvrdma-Protect-against-buggy-or-malicious-guest-d.patch
+index 810c74fabd..8ca9cae402 100644
+--- a/meta/recipes-devtools/qemu/qemu/0010-hw-pvrdma-Protect-against-bug=
gy-or-malicious-guest-d.patch
++++ b/meta/recipes-devtools/qemu/qemu/0010-hw-pvrdma-Protect-against-bug=
gy-or-malicious-guest-d.patch
+@@ -1,3 +1,4 @@
++<<<<<<< HEAD
+ CVE: CVE-2022-1050
+ Upstream-Status: Submitted [https://lore.kernel.org/qemu-devel/20220403=
095234.2210-1-yuval.shaia.ml@gmail.com/]
+ Signed-off-by: Ross Burton <ross.burton@arm.com>
+@@ -23,6 +24,33 @@ Signed-off-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
+=20
+ diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
+ index da7ddfa548..89db963c46 100644
++=3D=3D=3D=3D=3D=3D=3D
++From 52c38fa9f3a790a7c2805e7d8cce3ea9262d6ae2 Mon Sep 17 00:00:00 2001
++From: Yuval Shaia <yuval.shaia.ml@gmail.com>
++Date: Tue, 12 Apr 2022 11:01:51 +0100
++Subject: [PATCH 10/12] hw/pvrdma: Protect against buggy or malicious gu=
est
++ driver
++
++Guest driver might execute HW commands when shared buffers are not yet
++allocated.
++This might happen on purpose (malicious guest) or because some other
++guest/host address mapping.
++We need to protect againts such case.
++
++Reported-by: Mauro Matteo Cascella <mcascell@redhat.com>
++Signed-off-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
++
++CVE: CVE-2022-1050
++Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/qemu-=
devel/2022-03/msg05197.html]
++
++---
++ hw/rdma/vmw/pvrdma_cmd.c  | 6 ++++++
++ hw/rdma/vmw/pvrdma_main.c | 3 ++-
++ 2 files changed, 8 insertions(+), 1 deletion(-)
++
++diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
++index da7ddfa54..89db963c4 100644
++>>>>>>> parent of 9040d46f59... qemu: Upgrade 7.0.0 -> 7.1.0
+ --- a/hw/rdma/vmw/pvrdma_cmd.c
+ +++ b/hw/rdma/vmw/pvrdma_cmd.c
+ @@ -796,6 +796,12 @@ int pvrdma_exec_cmd(PVRDMADev *dev)
+@@ -38,6 +66,25 @@ index da7ddfa548..89db963c46 100644
+      if (dsr_info->req->hdr.cmd >=3D sizeof(cmd_handlers) /
+                        sizeof(struct cmd_handler)) {
+          rdma_error_report("Unsupported command");
++<<<<<<< HEAD
+ --=20
+ 2.34.1
++=3D=3D=3D=3D=3D=3D=3D
++diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
++index 91206dbb8..0b7d908e2 100644
++--- a/hw/rdma/vmw/pvrdma_main.c
+++++ b/hw/rdma/vmw/pvrdma_main.c
++@@ -249,7 +249,8 @@ static void init_dsr_dev_caps(PVRDMADev *dev)
++ {
++     struct pvrdma_device_shared_region *dsr;
++=20
++-    if (dev->dsr_info.dsr =3D=3D NULL) {
+++    if (!dev->dsr_info.dsr) {
+++        /* Buggy or malicious guest driver */
++         rdma_error_report("Can't initialized DSR");
++         return;
++     }
++--=20
++2.30.2
++>>>>>>> parent of 9040d46f59... qemu: Upgrade 7.0.0 -> 7.1.0
+=20
+diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3507_1.patch b/met=
a/recipes-devtools/qemu/qemu/CVE-2021-3507_1.patch
+new file mode 100644
+index 0000000000..24fd2c5ed3
+--- /dev/null
++++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3507_1.patch
+@@ -0,0 +1,92 @@
++From 57a89cc36ead7234e540d0ecbe1a792ab6b04cb7 Mon Sep 17 00:00:00 2001
++From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redha=
t.com>
++Date: Thu, 18 Nov 2021 12:57:32 +0100
++Subject: [PATCH 1/2] hw/block/fdc: Prevent end-of-track overrun
++ (CVE-2021-3507)
++MIME-Version: 1.0
++Content-Type: text/plain; charset=3DUTF-8
++Content-Transfer-Encoding: 8bit
++
++Per the 82078 datasheet, if the end-of-track (EOT byte in
++the FIFO) is more than the number of sectors per side, the
++command is terminated unsuccessfully:
++
++* 5.2.5 DATA TRANSFER TERMINATION
++
++  The 82078 supports terminal count explicitly through
++  the TC pin and implicitly through the underrun/over-
++  run and end-of-track (EOT) functions. For full sector
++  transfers, the EOT parameter can define the last
++  sector to be transferred in a single or multisector
++  transfer. If the last sector to be transferred is a par-
++  tial sector, the host can stop transferring the data in
++  mid-sector, and the 82078 will continue to complete
++  the sector as if a hardware TC was received. The
++  only difference between these implicit functions and
++  TC is that they return "abnormal termination" result
++  status. Such status indications can be ignored if they
++  were expected.
++
++* 6.1.3 READ TRACK
++
++  This command terminates when the EOT specified
++  number of sectors have been read. If the 82078
++  does not find an I D Address Mark on the diskette
++  after the second=C2=B7 occurrence of a pulse on the
++  INDX# pin, then it sets the IC code in Status Regis-
++  ter 0 to "01" (Abnormal termination), sets the MA bit
++  in Status Register 1 to "1", and terminates the com-
++  mand.
++
++* 6.1.6 VERIFY
++
++  Refer to Table 6-6 and Table 6-7 for information
++  concerning the values of MT and EC versus SC and
++  EOT value.
++
++* Table 6=C2=B76. Result Phase Table
++
++* Table 6-7. Verify Command Result Phase Table
++
++Fix by aborting the transfer when EOT > # Sectors Per Side.
++
++Cc: qemu-stable@nongnu.org
++Cc: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
++Fixes: baca51faff0 ("floppy driver: disk geometry auto detect")
++Reported-by: Alexander Bulekov <alxndr@bu.edu>
++Resolves: https://gitlab.com/qemu-project/qemu/-/issues/339
++Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
++Message-Id: <20211118115733.4038610-2-philmd@redhat.com>
++Reviewed-by: Hanna Reitz <hreitz@redhat.com>
++Signed-off-by: Kevin Wolf <kwolf@redhat.com>
++
++Upstream-Status: Backport [defac5e2fbddf8423a354ff0454283a2115e1367]
++CVE: CVE-2021-3507
++
++Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
++---
++ hw/block/fdc.c | 8 ++++++++
++ 1 file changed, 8 insertions(+)
++
++diff --git a/hw/block/fdc.c b/hw/block/fdc.c
++index 347875a0c..57bb35579 100644
++--- a/hw/block/fdc.c
+++++ b/hw/block/fdc.c
++@@ -1530,6 +1530,14 @@ static void fdctrl_start_transfer(FDCtrl *fdctrl=
, int direction)
++         int tmp;
++         fdctrl->data_len =3D 128 << (fdctrl->fifo[5] > 7 ? 7 : fdctrl-=
>fifo[5]);
++         tmp =3D (fdctrl->fifo[6] - ks + 1);
+++        if (tmp < 0) {
+++            FLOPPY_DPRINTF("invalid EOT: %d\n", tmp);
+++            fdctrl_stop_transfer(fdctrl, FD_SR0_ABNTERM, FD_SR1_MA, 0x=
00);
+++            fdctrl->fifo[3] =3D kt;
+++            fdctrl->fifo[4] =3D kh;
+++            fdctrl->fifo[5] =3D ks;
+++            return;
+++        }
++         if (fdctrl->fifo[0] & 0x80)
++             tmp +=3D fdctrl->fifo[6];
++         fdctrl->data_len *=3D tmp;
++--=20
++2.33.0
++
+diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3507_2.patch b/met=
a/recipes-devtools/qemu/qemu/CVE-2021-3507_2.patch
+new file mode 100644
+index 0000000000..acc93e897b
+--- /dev/null
++++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3507_2.patch
+@@ -0,0 +1,115 @@
++From 3e8601ec707dcbc3c768f7733d016dc70c947e4a Mon Sep 17 00:00:00 2001
++From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@redha=
t.com>
++Date: Thu, 18 Nov 2021 12:57:33 +0100
++Subject: [PATCH 2/2] tests/qtest/fdc-test: Add a regression test for
++ CVE-2021-3507
++MIME-Version: 1.0
++Content-Type: text/plain; charset=3DUTF-8
++Content-Transfer-Encoding: 8bit
++
++Add the reproducer from https://gitlab.com/qemu-project/qemu/-/issues/3=
39
++
++Without the previous commit, when running 'make check-qtest-i386'
++with QEMU configured with '--enable-sanitizers' we get:
++
++  =3D=3D4028352=3D=3DERROR: AddressSanitizer: heap-buffer-overflow on a=
ddress 0x619000062a00 at pc 0x5626d03c491a bp 0x7ffdb4199410 sp 0x7ffdb41=
98bc0
++  READ of size 786432 at 0x619000062a00 thread T0
++      #0 0x5626d03c4919 in __asan_memcpy (qemu-system-i386+0x1e65919)
++      #1 0x5626d1c023cc in flatview_write_continue softmmu/physmem.c:27=
87:13
++      #2 0x5626d1bf0c0f in flatview_write softmmu/physmem.c:2822:14
++      #3 0x5626d1bf0798 in address_space_write softmmu/physmem.c:2914:1=
8
++      #4 0x5626d1bf0f37 in address_space_rw softmmu/physmem.c:2924:16
++      #5 0x5626d1bf14c8 in cpu_physical_memory_rw softmmu/physmem.c:293=
3:5
++      #6 0x5626d0bd5649 in cpu_physical_memory_write include/exec/cpu-c=
ommon.h:82:5
++      #7 0x5626d0bd0a07 in i8257_dma_write_memory hw/dma/i8257.c:452:9
++      #8 0x5626d09f825d in fdctrl_transfer_handler hw/block/fdc.c:1616:=
13
++      #9 0x5626d0a048b4 in fdctrl_start_transfer hw/block/fdc.c:1539:13
++      #10 0x5626d09f4c3e in fdctrl_write_data hw/block/fdc.c:2266:13
++      #11 0x5626d09f22f7 in fdctrl_write hw/block/fdc.c:829:9
++      #12 0x5626d1c20bc5 in portio_write softmmu/ioport.c:207:17
++
++  0x619000062a00 is located 0 bytes to the right of 512-byte region [0x=
619000062800,0x619000062a00)
++  allocated by thread T0 here:
++      #0 0x5626d03c66ec in posix_memalign (qemu-system-i386+0x1e676ec)
++      #1 0x5626d2b988d4 in qemu_try_memalign util/oslib-posix.c:210:11
++      #2 0x5626d2b98b0c in qemu_memalign util/oslib-posix.c:226:27
++      #3 0x5626d09fbaf0 in fdctrl_realize_common hw/block/fdc.c:2341:20
++      #4 0x5626d0a150ed in isabus_fdc_realize hw/block/fdc-isa.c:113:5
++      #5 0x5626d2367935 in device_set_realized hw/core/qdev.c:531:13
++
++  SUMMARY: AddressSanitizer: heap-buffer-overflow (qemu-system-i386+0x1=
e65919) in __asan_memcpy
++  Shadow bytes around the buggy address:
++    0x0c32800044f0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
++    0x0c3280004500: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
++    0x0c3280004510: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
++    0x0c3280004520: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
++    0x0c3280004530: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
++  =3D>0x0c3280004540:[fa]fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
++    0x0c3280004550: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
++    0x0c3280004560: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
++    0x0c3280004570: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
++    0x0c3280004580: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
++    0x0c3280004590: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
++  Shadow byte legend (one shadow byte represents 8 application bytes):
++    Addressable:           00
++    Heap left redzone:       fa
++    Freed heap region:       fd
++  =3D=3D4028352=3D=3DABORTING
++
++[ kwolf: Added snapshot=3Don to prevent write file lock failure ]
++
++Reported-by: Alexander Bulekov <alxndr@bu.edu>
++Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
++Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
++Signed-off-by: Kevin Wolf <kwolf@redhat.com>
++
++Upstream-Status: Backport [46609b90d9e3a6304def11038a76b58ff43f77bc]
++CVE: CVE-2021-3507
++
++Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
++---
++ tests/qtest/fdc-test.c | 21 +++++++++++++++++++++
++ 1 file changed, 21 insertions(+)
++
++diff --git a/tests/qtest/fdc-test.c b/tests/qtest/fdc-test.c
++index b0d40012e..1d4f85212 100644
++--- a/tests/qtest/fdc-test.c
+++++ b/tests/qtest/fdc-test.c
++@@ -583,6 +583,26 @@ static void test_cve_2021_20196(void)
++     qtest_quit(s);
++ }
++=20
+++static void test_cve_2021_3507(void)
+++{
+++    QTestState *s;
+++
+++    s =3D qtest_initf("-nographic -m 32M -nodefaults "
+++                    "-drive file=3D%s,format=3Draw,if=3Dfloppy,snapsho=
t=3Don",
+++                    test_image);
+++    qtest_outl(s, 0x9, 0x0a0206);
+++    qtest_outw(s, 0x3f4, 0x1600);
+++    qtest_outw(s, 0x3f4, 0x0000);
+++    qtest_outw(s, 0x3f4, 0x0000);
+++    qtest_outw(s, 0x3f4, 0x0000);
+++    qtest_outw(s, 0x3f4, 0x0200);
+++    qtest_outw(s, 0x3f4, 0x0200);
+++    qtest_outw(s, 0x3f4, 0x0000);
+++    qtest_outw(s, 0x3f4, 0x0000);
+++    qtest_outw(s, 0x3f4, 0x0000);
+++    qtest_quit(s);
+++}
+++
++ int main(int argc, char **argv)
++ {
++     int fd;
++@@ -614,6 +634,7 @@ int main(int argc, char **argv)
++     qtest_add_func("/fdc/read_no_dma_19", test_read_no_dma_19);
++     qtest_add_func("/fdc/fuzz-registers", fuzz_registers);
++     qtest_add_func("/fdc/fuzz/cve_2021_20196", test_cve_2021_20196);
+++    qtest_add_func("/fdc/fuzz/cve_2021_3507", test_cve_2021_3507);
++=20
++     ret =3D g_test_run();
++=20
++--=20
++2.33.0
++
+diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2022-0216_1.patch b/met=
a/recipes-devtools/qemu/qemu/CVE-2022-0216_1.patch
+new file mode 100644
+index 0000000000..56fc34ce5a
+--- /dev/null
++++ b/meta/recipes-devtools/qemu/qemu/CVE-2022-0216_1.patch
+@@ -0,0 +1,42 @@
++From f37ac8619a39498edd225c4a0b3039b28814833d Mon Sep 17 00:00:00 2001
++From: Mauro Matteo Cascella <mcascell@redhat.com>
++Date: Tue, 5 Jul 2022 22:05:43 +0200
++Subject: [PATCH 1/2] scsi/lsi53c895a: fix use-after-free in lsi_do_msgo=
ut
++ (CVE-2022-0216)
++
++Set current_req->req to NULL to prevent reusing a free'd buffer in case=
 of
++repeated SCSI cancel requests. Thanks to Thomas Huth for suggesting the=
 patch.
++
++Fixes: CVE-2022-0216
++Resolves: https://gitlab.com/qemu-project/qemu/-/issues/972
++Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
++Reviewed-by: Thomas Huth <thuth@redhat.com>
++Message-Id: <20220705200543.2366809-1-mcascell@redhat.com>
++Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
++
++Upstream-Status: Backport [6c8fa961da5e60f574bb52fd3ad44b1e9e8ad4b8]
++CVE: CVE-2022-0216
++
++Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
++---
++ hw/scsi/lsi53c895a.c | 3 ++-
++ 1 file changed, 2 insertions(+), 1 deletion(-)
++
++diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
++index c8773f73f..99ea42d49 100644
++--- a/hw/scsi/lsi53c895a.c
+++++ b/hw/scsi/lsi53c895a.c
++@@ -1028,8 +1028,9 @@ static void lsi_do_msgout(LSIState *s)
++         case 0x0d:
++             /* The ABORT TAG message clears the current I/O process on=
ly. */
++             trace_lsi_do_msgout_abort(current_tag);
++-            if (current_req) {
+++            if (current_req && current_req->req) {
++                 scsi_req_cancel(current_req->req);
+++                current_req->req =3D NULL;
++             }
++             lsi_disconnect(s);
++             break;
++--=20
++2.33.0
++
+diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2022-0216_2.patch b/met=
a/recipes-devtools/qemu/qemu/CVE-2022-0216_2.patch
+new file mode 100644
+index 0000000000..f332154b6a
+--- /dev/null
++++ b/meta/recipes-devtools/qemu/qemu/CVE-2022-0216_2.patch
+@@ -0,0 +1,146 @@
++From 5451bf6db85ce3da1238e9154d051ebccec8f171 Mon Sep 17 00:00:00 2001
++From: Mauro Matteo Cascella <mcascell@redhat.com>
++Date: Mon, 11 Jul 2022 14:33:16 +0200
++Subject: [PATCH 2/2] scsi/lsi53c895a: really fix use-after-free in
++ lsi_do_msgout (CVE-2022-0216)
++
++Set current_req to NULL, not current_req->req, to prevent reusing a fre=
e'd
++buffer in case of repeated SCSI cancel requests.  Also apply the fix to
++CLEAR QUEUE and BUS DEVICE RESET messages as well, since they also canc=
el
++the request.
++
++Thanks to Alexander Bulekov for providing a reproducer.
++
++Fixes: CVE-2022-0216
++Resolves: https://gitlab.com/qemu-project/qemu/-/issues/972
++Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
++Tested-by: Alexander Bulekov <alxndr@bu.edu>
++Message-Id: <20220711123316.421279-1-mcascell@redhat.com>
++Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
++
++Upstream-Status: Backport [4367a20cc442c56b05611b4224de9a61908f9eac]
++CVE: CVE-2022-0216
++
++Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
++---
++ hw/scsi/lsi53c895a.c               |  3 +-
++ tests/qtest/fuzz-lsi53c895a-test.c | 76 ++++++++++++++++++++++++++++++
++ 2 files changed, 78 insertions(+), 1 deletion(-)
++
++diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
++index 99ea42d49..ad5f5e5f3 100644
++--- a/hw/scsi/lsi53c895a.c
+++++ b/hw/scsi/lsi53c895a.c
++@@ -1030,7 +1030,7 @@ static void lsi_do_msgout(LSIState *s)
++             trace_lsi_do_msgout_abort(current_tag);
++             if (current_req && current_req->req) {
++                 scsi_req_cancel(current_req->req);
++-                current_req->req =3D NULL;
+++                current_req =3D NULL;
++             }
++             lsi_disconnect(s);
++             break;
++@@ -1056,6 +1056,7 @@ static void lsi_do_msgout(LSIState *s)
++             /* clear the current I/O process */
++             if (s->current) {
++                 scsi_req_cancel(s->current->req);
+++                current_req =3D NULL;
++             }
++=20
++             /* As the current implemented devices scsi_disk and scsi_g=
eneric
++diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi5=
3c895a-test.c
++index ba5d46897..c1af0ab1c 100644
++--- a/tests/qtest/fuzz-lsi53c895a-test.c
+++++ b/tests/qtest/fuzz-lsi53c895a-test.c
++@@ -8,6 +8,79 @@
++ #include "qemu/osdep.h"
++ #include "libqos/libqtest.h"
++=20
+++/*
+++ * This used to trigger a UAF in lsi_do_msgout()
+++ * https://gitlab.com/qemu-project/qemu/-/issues/972
+++ */
+++static void test_lsi_do_msgout_cancel_req(void)
+++{
+++    QTestState *s;
+++
+++    if (sizeof(void *) =3D=3D 4) {
+++        g_test_skip("memory size too big for 32-bit build");
+++        return;
+++    }
+++
+++    s =3D qtest_init("-M q35 -m 4G -display none -nodefaults "
+++                   "-device lsi53c895a,id=3Dscsi "
+++                   "-device scsi-hd,drive=3Ddisk0 "
+++                   "-drive file=3Dnull-co://,id=3Ddisk0,if=3Dnone,form=
at=3Draw");
+++
+++    qtest_outl(s, 0xcf8, 0x80000810);
+++    qtest_outl(s, 0xcf8, 0xc000);
+++    qtest_outl(s, 0xcf8, 0x80000810);
+++    qtest_outw(s, 0xcfc, 0x7);
+++    qtest_outl(s, 0xcf8, 0x80000810);
+++    qtest_outl(s, 0xcfc, 0xc000);
+++    qtest_outl(s, 0xcf8, 0x80000804);
+++    qtest_outw(s, 0xcfc, 0x05);
+++    qtest_writeb(s, 0x69736c10, 0x08);
+++    qtest_writeb(s, 0x69736c13, 0x58);
+++    qtest_writeb(s, 0x69736c1a, 0x01);
+++    qtest_writeb(s, 0x69736c1b, 0x06);
+++    qtest_writeb(s, 0x69736c22, 0x01);
+++    qtest_writeb(s, 0x69736c23, 0x07);
+++    qtest_writeb(s, 0x69736c2b, 0x02);
+++    qtest_writeb(s, 0x69736c48, 0x08);
+++    qtest_writeb(s, 0x69736c4b, 0x58);
+++    qtest_writeb(s, 0x69736c52, 0x04);
+++    qtest_writeb(s, 0x69736c53, 0x06);
+++    qtest_writeb(s, 0x69736c5b, 0x02);
+++    qtest_outl(s, 0xc02d, 0x697300);
+++    qtest_writeb(s, 0x5a554662, 0x01);
+++    qtest_writeb(s, 0x5a554663, 0x07);
+++    qtest_writeb(s, 0x5a55466a, 0x10);
+++    qtest_writeb(s, 0x5a55466b, 0x22);
+++    qtest_writeb(s, 0x5a55466c, 0x5a);
+++    qtest_writeb(s, 0x5a55466d, 0x5a);
+++    qtest_writeb(s, 0x5a55466e, 0x34);
+++    qtest_writeb(s, 0x5a55466f, 0x5a);
+++    qtest_writeb(s, 0x5a345a5a, 0x77);
+++    qtest_writeb(s, 0x5a345a5b, 0x55);
+++    qtest_writeb(s, 0x5a345a5c, 0x51);
+++    qtest_writeb(s, 0x5a345a5d, 0x27);
+++    qtest_writeb(s, 0x27515577, 0x41);
+++    qtest_outl(s, 0xc02d, 0x5a5500);
+++    qtest_writeb(s, 0x364001d0, 0x08);
+++    qtest_writeb(s, 0x364001d3, 0x58);
+++    qtest_writeb(s, 0x364001da, 0x01);
+++    qtest_writeb(s, 0x364001db, 0x26);
+++    qtest_writeb(s, 0x364001dc, 0x0d);
+++    qtest_writeb(s, 0x364001dd, 0xae);
+++    qtest_writeb(s, 0x364001de, 0x41);
+++    qtest_writeb(s, 0x364001df, 0x5a);
+++    qtest_writeb(s, 0x5a41ae0d, 0xf8);
+++    qtest_writeb(s, 0x5a41ae0e, 0x36);
+++    qtest_writeb(s, 0x5a41ae0f, 0xd7);
+++    qtest_writeb(s, 0x5a41ae10, 0x36);
+++    qtest_writeb(s, 0x36d736f8, 0x0c);
+++    qtest_writeb(s, 0x36d736f9, 0x80);
+++    qtest_writeb(s, 0x36d736fa, 0x0d);
+++    qtest_outl(s, 0xc02d, 0x364000);
+++
+++    qtest_quit(s);
+++}
+++
++ /*
++  * This used to trigger the assert in lsi_do_dma()
++  * https://bugs.launchpad.net/qemu/+bug/697510
++@@ -48,5 +121,8 @@ int main(int argc, char **argv)
++                        test_lsi_do_dma_empty_queue);
++     }
++=20
+++    qtest_add_func("fuzz/lsi53c895a/lsi_do_msgout_cancel_req",
+++                   test_lsi_do_msgout_cancel_req);
+++
++     return g_test_run();
++ }
++--=20
++2.33.0
++
+diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2022-35414.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2022-35414.patch
+new file mode 100644
+index 0000000000..fe79a749ae
+--- /dev/null
++++ b/meta/recipes-devtools/qemu/qemu/CVE-2022-35414.patch
+@@ -0,0 +1,53 @@
++From a10c33942dc8cb31b3762b9dd4adde4c490eed9c Mon Sep 17 00:00:00 2001
++From: Hitendra Prajapati <hprajapati@mvista.com>
++Date: Wed, 3 Aug 2022 10:11:11 +0530
++Subject: [PATCH] CVE-2022-35414
++
++Upstream-Status: Backport [https://github.com/qemu/qemu/commit/418ade78=
49ce7641c0f7333718caf5091a02fd4c]
++CVE: CVE-2022-35414
++Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
++---
++ softmmu/physmem.c | 13 ++++++++++++-
++ 1 file changed, 12 insertions(+), 1 deletion(-)
++
++diff --git a/softmmu/physmem.c b/softmmu/physmem.c
++index 4e1b27a20..ad8a90dec 100644
++--- a/softmmu/physmem.c
+++++ b/softmmu/physmem.c
++@@ -669,7 +669,7 @@ void tcg_iommu_init_notifier_list(CPUState *cpu)
++=20
++ /* Called from RCU critical section */
++ MemoryRegionSection *
++-address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr add=
r,
+++address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr ori=
g_addr,
++                                   hwaddr *xlat, hwaddr *plen,
++                                   MemTxAttrs attrs, int *prot)
++ {
++@@ -678,6 +678,7 @@ address_space_translate_for_iotlb(CPUState *cpu, in=
t asidx, hwaddr addr,
++     IOMMUMemoryRegionClass *imrc;
++     IOMMUTLBEntry iotlb;
++     int iommu_idx;
+++    hwaddr addr =3D orig_addr;
++     AddressSpaceDispatch *d =3D
++         qatomic_rcu_read(&cpu->cpu_ases[asidx].memory_dispatch);
++=20
++@@ -722,6 +723,16 @@ address_space_translate_for_iotlb(CPUState *cpu, i=
nt asidx, hwaddr addr,
++     return section;
++=20
++ translate_fail:
+++    /*
+++     * We should be given a page-aligned address -- certainly
+++     * tlb_set_page_with_attrs() does so.  The page offset of xlat
+++     * is used to index sections[], and PHYS_SECTION_UNASSIGNED =3D 0.
+++     * The page portion of xlat will be logged by memory_region_access=
_valid()
+++     * when this memory access is rejected, so use the original untran=
slated
+++     * physical address.
+++     */
+++    assert((orig_addr & ~TARGET_PAGE_MASK) =3D=3D 0);
+++    *xlat =3D orig_addr;
++     return &d->map.sections[PHYS_SECTION_UNASSIGNED];
++ }
++=20
++--=20
++2.25.1
++
+diff --git a/meta/recipes-devtools/qemu/qemu/cross.patch b/meta/recipes-=
devtools/qemu/qemu/cross.patch
+index ca2ad361ef..d1256a1229 100644
+--- a/meta/recipes-devtools/qemu/qemu/cross.patch
++++ b/meta/recipes-devtools/qemu/qemu/cross.patch
+@@ -14,19 +14,19 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxf=
oundation.org>
+  configure | 4 ----
+  1 file changed, 4 deletions(-)
+=20
+-Index: qemu-7.1.0/configure
+-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+---- qemu-7.1.0.orig/configure
+-+++ qemu-7.1.0/configure
+-@@ -2710,7 +2710,6 @@ if test "$skip_meson" =3D no; then
++diff --git a/configure b/configure
++index 7c08c1835..0613279f9 100755
++--- a/configure
+++++ b/configure
++@@ -3118,7 +3118,6 @@ if test "$skip_meson" =3D no; then
++   fi
+    echo "strip =3D [$(meson_quote $strip)]" >> $cross
+-   echo "widl =3D [$(meson_quote $widl)]" >> $cross
+    echo "windres =3D [$(meson_quote $windres)]" >> $cross
+ -  if test "$cross_compile" =3D "yes"; then
+      cross_arg=3D"--cross-file config-meson.cross"
+      echo "[host_machine]" >> $cross
+      echo "system =3D '$targetos'" >> $cross
+-@@ -2728,9 +2727,6 @@ if test "$skip_meson" =3D no; then
++@@ -3136,9 +3135,6 @@ if test "$skip_meson" =3D no; then
+      else
+          echo "endian =3D 'little'" >> $cross
+      fi
+@@ -36,3 +36,6 @@ Index: qemu-7.1.0/configure
+    mv $cross config-meson.cross
+ =20
+    rm -rf meson-private meson-info meson-logs
++--=20
++2.30.2
++
+diff --git a/meta/recipes-devtools/qemu/qemu_7.1.0.bb b/meta/recipes-dev=
tools/qemu/qemu_7.0.0.bb
+similarity index 100%
+rename from meta/recipes-devtools/qemu/qemu_7.1.0.bb
+rename to meta/recipes-devtools/qemu/qemu_7.0.0.bb
+--=20
+2.25.1
+
diff --git a/0001-Revert-qemurunner-Update-to-match-qmp-changes.patch b/0=
001-Revert-qemurunner-Update-to-match-qmp-changes.patch
new file mode 100644
index 00000000..4da09928
--- /dev/null
+++ b/0001-Revert-qemurunner-Update-to-match-qmp-changes.patch
@@ -0,0 +1,40 @@
+From 7ec1129a1dd31197d1e0d0992f5c3386588cde11 Mon Sep 17 00:00:00 2001
+From: Anton Antonov <Anton.Antonov@arm.com>
+Date: Thu, 22 Sep 2022 10:45:27 +0100
+Subject: [PATCH] Revert "qemurunner: Update to match qmp changes"
+
+This reverts commit df89d59a19f3000d829ee6b18364260a4e5312e8.
+
+Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
+---
+ meta/lib/oeqa/utils/qemurunner.py | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qem=
urunner.py
+index 6a85f57e49..a70f3fd46a 100644
+--- a/meta/lib/oeqa/utils/qemurunner.py
++++ b/meta/lib/oeqa/utils/qemurunner.py
+@@ -191,8 +191,8 @@ class QemuRunner:
+         importlib.invalidate_caches()
+         try:
+             qmp =3D importlib.import_module("qmp")
+-        except Exception as e:
+-            self.logger.error("qemurunner: qmp.py missing, please ensur=
e it's installed (%s)" % str(e))
++        except:
++            self.logger.error("qemurunner: qmp.py missing, please ensur=
e it's installed")
+             return False
+         # Path relative to tmpdir used as cwd for qemu below to avoid u=
nix socket path length issues
+         qmp_file =3D "." + next(tempfile._get_candidate_names())
+@@ -328,8 +328,7 @@ class QemuRunner:
+         try:
+             os.chdir(os.path.dirname(qmp_port))
+             try:
+-               from qmp.legacy import QEMUMonitorProtocol
+-               self.qmp =3D QEMUMonitorProtocol(os.path.basename(qmp_po=
rt))
++               self.qmp =3D qmp.QEMUMonitorProtocol(os.path.basename(qm=
p_port))
+             except OSError as msg:
+                 self.logger.warning("Failed to initialize qemu monitor =
socket: %s File: %s" % (msg, msg.filename))
+                 return False
+--=20
+2.25.1
+
diff --git a/ci/qemuarm64-secureboot-ts.yml b/ci/qemuarm64-secureboot-ts.=
yml
index 66a27c68..060f3d13 100644
--- a/ci/qemuarm64-secureboot-ts.yml
+++ b/ci/qemuarm64-secureboot-ts.yml
@@ -9,6 +9,18 @@ header:
     - ci/base.yml
     - ci/meta-openembedded.yml
=20
+# qemu image with optee and arm-ffa kernel drivers fails to boot under q=
emu 7.1.0
+# temporary use qemu 7.0.0 until a proper fix is implemented
+repos:
+  poky:
+    patches:
+      qemu:
+        repo: meta-arm
+        path: 0001-Revert-qemu-Upgrade-7.0.0-7.1.0.patch
+      qemurunner:
+        repo: meta-arm
+        path: 0001-Revert-qemurunner-Update-to-match-qmp-changes.patch
+
 machine: qemuarm64-secureboot
=20
 local_conf_header:
--=20
2.25.1


