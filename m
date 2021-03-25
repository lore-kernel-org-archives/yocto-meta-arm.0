Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.8571.1616680770539047806
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 25 Mar 2021 06:59:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14522143D;
	Thu, 25 Mar 2021 06:59:20 -0700 (PDT)
Received: from e125920.arm.com (unknown [10.57.27.10])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 076733F792;
	Thu, 25 Mar 2021 06:59:18 -0700 (PDT)
From: "Peter Hoyes" <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 1/2] arm-autonomy/n1sdp: Remove support for linux-linaro-arm_5.4
Date: Thu, 25 Mar 2021 14:00:44 +0000
Message-Id: <20210325140045.1463562-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Peter Hoyes <Peter.Hoyes@arm.com>

 * Remove linux-linaro-arm and associated patches
 * Use linux-yocto for N1SDP

Issue-Id: SCM-1506
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I6e0ebf7de42af98e7427132590fe813c1703d1c6
---
 .../conf/machine/n1sdp-extra-settings.inc     |  13 +-
 ...ow-specification-of-ncurses-location.patch |  52 ---
 .../linux-linaro-arm-5.4/fix-bfd-link.patch   |  60 ----
 ...arm-smmu-v3-Ignore-IOPF-capabilities.patch |  46 ---
 ...irk-add-acs-override-for-PCI-devices.patch | 156 ---------
 ...-for-the-Arm-Neoverse-N1SDP-platform.patch | 318 ------------------
 ...e-n1sdp-pci-quirk-for-SR-IOV-support.patch |  51 ---
 ...uirk-support-enabling-remote-chip-PC.patch | 134 --------
 .../n1sdp/enable-realtek-R8169.cfg            |   3 -
 .../scripts-dtc-remove-redundant-YYLOC.patch  |  59 ----
 .../perf-fixup-gcc10-01.patch                 |  76 -----
 .../perf-fixup-gcc10-02.patch                 |  50 ---
 .../perf-fixup-gcc10-03.patch                 | 246 --------------
 .../perf-fixup-gcc10-04.patch                 |  45 ---
 .../linux/linux-linaro-arm-n1sdp.inc          |  27 --
 ...asteoi_irq-to-handle-xen-dynamic-eve.patch |  80 -----
 .../linux/linux-linaro-arm-rt_5.4.bb          |  19 --
 .../recipes-kernel/linux/linux-linaro-arm.inc |  29 --
 .../linux/linux-linaro-arm_5.4.bb             |  17 -
 19 files changed, 3 insertions(+), 1478 deletions(-)
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes=
-kernel/linux/linux-linaro-arm-5.4/0001-menuconfig-mconf-cfg-Allow-specif=
ication-of-ncurses-location.patch
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes=
-kernel/linux/linux-linaro-arm-5.4/fix-bfd-link.patch
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes=
-kernel/linux/linux-linaro-arm-5.4/n1sdp/0001-TMP-iommu-arm-smmu-v3-Ignor=
e-IOPF-capabilities.patch
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes=
-kernel/linux/linux-linaro-arm-5.4/n1sdp/0002-pci_quirk-add-acs-override-=
for-PCI-devices.patch
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes=
-kernel/linux/linux-linaro-arm-5.4/n1sdp/0003-pcie-Add-quirk-for-the-Arm-=
Neoverse-N1SDP-platform.patch
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes=
-kernel/linux/linux-linaro-arm-5.4/n1sdp/0004-n1sdp-update-n1sdp-pci-quir=
k-for-SR-IOV-support.patch
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes=
-kernel/linux/linux-linaro-arm-5.4/n1sdp/0005-n1sdp-pcie-add-quirk-suppor=
t-enabling-remote-chip-PC.patch
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes=
-kernel/linux/linux-linaro-arm-5.4/n1sdp/enable-realtek-R8169.cfg
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes=
-kernel/linux/linux-linaro-arm-5.4/n1sdp/scripts-dtc-remove-redundant-YYL=
OC.patch
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes=
-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-01.patch
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes=
-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-02.patch
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes=
-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-03.patch
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes=
-kernel/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-04.patch
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes=
-kernel/linux/linux-linaro-arm-n1sdp.inc
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes=
-kernel/linux/linux-linaro-arm-rt-5.4/0001-xen-use-handle_fasteoi_irq-to-=
handle-xen-dynamic-eve.patch
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes=
-kernel/linux/linux-linaro-arm-rt_5.4.bb
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes=
-kernel/linux/linux-linaro-arm.inc
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes=
-kernel/linux/linux-linaro-arm_5.4.bb

diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n=
1sdp-extra-settings.inc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/c=
onf/machine/n1sdp-extra-settings.inc
index 3612b2e..5731142 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-ex=
tra-settings.inc
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-ex=
tra-settings.inc
@@ -49,23 +49,16 @@ do_image_wic[depends] +=3D "xen:do_deploy"
 IMAGE_EFI_BOOT_FILES +=3D "xen-n1sdp.efi;xen.efi"
 IMAGE_EFI_BOOT_FILES +=3D "${XEN_MOD_DEVICETREE_DTBS}"
=20
-# Use 5.4 kernel until later versions have been validated for autonomy-h=
ost
-python() {
-    if d.getVar('PREFERRED_PROVIDER_virtual/kernel') =3D=3D 'linux-yocto=
':
-        d.setVar('PREFERRED_PROVIDER_virtual/kernel', 'linux-linaro-arm'=
)
-        d.setVar('PREFERRED_VERSION_linux-linaro-arm', '5.4%')
-}
-
-# When alternate-kernel DISTRO_FEATURE is present we set the linux-linar=
o-arm-rt
+# When alternate-kernel DISTRO_FEATURE is present we set the linux-yocto=
-rt
 # by default
 PREFERRED_PROVIDER_alternate/kernel ?=3D "\
 ${@bb.utils.contains('DISTRO_FEATURES', 'alternate-kernel', \
-'linux-linaro-arm-rt', '', d)}"
+'linux-yocto-rt', '', d)}"
=20
 KERNEL_PACKAGE_NAME_alternate/kernel ?=3D "kernel-rt"
 # When alternate-kernel DISTRO_FEATURE is present we set the kernel-rt b=
y
 # default
-KERNEL_PACKAGE_NAME_pn-linux-linaro-arm-rt =3D "\
+KERNEL_PACKAGE_NAME_pn-linux-yocto-rt =3D "\
 ${@ d.getVar('KERNEL_PACKAGE_NAME_alternate/kernel') \
 if bb.utils.contains('DISTRO_FEATURES', 'alternate-kernel', True, False,=
 d) \
 else 'kernel' }"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel=
/linux/linux-linaro-arm-5.4/0001-menuconfig-mconf-cfg-Allow-specification=
-of-ncurses-location.patch b/meta-arm-autonomy/dynamic-layers/meta-arm-bs=
p/recipes-kernel/linux/linux-linaro-arm-5.4/0001-menuconfig-mconf-cfg-All=
ow-specification-of-ncurses-location.patch
deleted file mode 100644
index 372d0af..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/=
linux-linaro-arm-5.4/0001-menuconfig-mconf-cfg-Allow-specification-of-ncu=
rses-location.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-rom d078e29aa31ac3fa4c041bf89c46bc6372c1a02a Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@windriver.com>
-Date: Mon, 2 Jul 2018 23:10:28 -0400
-Subject: menuconfig,mconf-cfg: Allow specification of ncurses location
-
-In some cross build environments such as the Yocto Project build
-environment it provides an ncurses library that is compiled
-differently than the host's version.  This causes display corruption
-problems when the host's curses includes are used instead of the
-includes from the provided compiler are overridden.  There is a second
-case where there is no curses libraries at all on the host system and
-menuconfig will just fail entirely.
-
-The solution is simply to allow an override variable in
-check-lxdialog.sh for environments such as the Yocto Project.  Adding
-a CROSS_CURSES_LIB and CROSS_CURSES_INC solves the issue and allowing
-compiling and linking against the right headers and libraries.
-
-Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
-cc: Michal Marek <mmarek@suse.cz>
-cc: linux-kbuild@vger.kernel.org
-Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
----
- scripts/kconfig/mconf-cfg.sh | 8 ++++++++
- 1 file changed, 8 insertions(+)
- mode change 100755 =3D> 100644 scripts/kconfig/mconf-cfg.sh
-
-(limited to 'scripts/kconfig/mconf-cfg.sh')
-
-diff --git a/scripts/kconfig/mconf-cfg.sh b/scripts/kconfig/mconf-cfg.sh
-old mode 100755
-new mode 100644
-index c812872d7f9d..65a9b9e5b8a6
---- a/scripts/kconfig/mconf-cfg.sh
-+++ b/scripts/kconfig/mconf-cfg.sh
-@@ -4,6 +4,14 @@
- PKG=3D"ncursesw"
- PKG2=3D"ncurses"
-=20
-+if [ "$CROSS_CURSES_LIB" !=3D "" ]; then
-+    echo libs=3D\'$CROSS_CURSES_LIB\'
-+    if [ x"$CROSS_CURSES_INC" !=3D x ]; then
-+	echo cflags=3D\'$CROSS_CURSES_INC\'
-+    fi
-+    exit 0
-+fi
-+
- if [ -n "$(command -v pkg-config)" ]; then
- 	if pkg-config --exists $PKG; then
- 		echo cflags=3D\"$(pkg-config --cflags $PKG)\"
---=20
-cgit v1.2.2-1-g5e49
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel=
/linux/linux-linaro-arm-5.4/fix-bfd-link.patch b/meta-arm-autonomy/dynami=
c-layers/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/fix-bfd-l=
ink.patch
deleted file mode 100644
index 63d4fda..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/=
linux-linaro-arm-5.4/fix-bfd-link.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 0ada120c883d4f1f6aafd01cf0fbb10d8bbba015 Mon Sep 17 00:00:00 2001
-From: Changbin Du <changbin.du@gmail.com>
-Date: Tue, 28 Jan 2020 23:29:38 +0800
-Subject: [PATCH] perf: Make perf able to build with latest libbfd
-
-libbfd has changed the bfd_section_* macros to inline functions
-bfd_section_<field> since 2019-09-18. See below two commits:
-  o http://www.sourceware.org/ml/gdb-cvs/2019-09/msg00064.html
-  o https://www.sourceware.org/ml/gdb-cvs/2019-09/msg00072.html
-
-This fix make perf able to build with both old and new libbfd.
-
-Signed-off-by: Changbin Du <changbin.du@gmail.com>
-Acked-by: Jiri Olsa <jolsa@redhat.com>
-Cc: Peter Zijlstra <peterz@infradead.org>
-Link: http://lore.kernel.org/lkml/20200128152938.31413-1-changbin.du@gma=
il.com
-Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
----
- tools/perf/util/srcline.c | 16 +++++++++++++++-
- 1 file changed, 15 insertions(+), 1 deletion(-)
-
-diff --git a/tools/perf/util/srcline.c b/tools/perf/util/srcline.c
-index 6ccf6f6d09df9..5b7d6c16d33fe 100644
---- a/tools/perf/util/srcline.c
-+++ b/tools/perf/util/srcline.c
-@@ -193,16 +193,30 @@ static void find_address_in_section(bfd *abfd, ase=
ction *section, void *data)
- 	bfd_vma pc, vma;
- 	bfd_size_type size;
- 	struct a2l_data *a2l =3D data;
-+	flagword flags;
-=20
- 	if (a2l->found)
- 		return;
-=20
--	if ((bfd_get_section_flags(abfd, section) & SEC_ALLOC) =3D=3D 0)
-+#ifdef bfd_get_section_flags
-+	flags =3D bfd_get_section_flags(abfd, section);
-+#else
-+	flags =3D bfd_section_flags(section);
-+#endif
-+	if ((flags & SEC_ALLOC) =3D=3D 0)
- 		return;
-=20
- 	pc =3D a2l->addr;
-+#ifdef bfd_get_section_vma
- 	vma =3D bfd_get_section_vma(abfd, section);
-+#else
-+	vma =3D bfd_section_vma(section);
-+#endif
-+#ifdef bfd_get_section_size
- 	size =3D bfd_get_section_size(section);
-+#else
-+	size =3D bfd_section_size(section);
-+#endif
-=20
- 	if (pc < vma || pc >=3D vma + size)
- 		return;
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel=
/linux/linux-linaro-arm-5.4/n1sdp/0001-TMP-iommu-arm-smmu-v3-Ignore-IOPF-=
capabilities.patch b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipe=
s-kernel/linux/linux-linaro-arm-5.4/n1sdp/0001-TMP-iommu-arm-smmu-v3-Igno=
re-IOPF-capabilities.patch
deleted file mode 100644
index e1ff4a5..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/=
linux-linaro-arm-5.4/n1sdp/0001-TMP-iommu-arm-smmu-v3-Ignore-IOPF-capabil=
ities.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 4ebcbe09471d6b6b18fce42993489bed3801f10c Mon Sep 17 00:00:00 2001
-From: Jean-Philippe Brucker <jean-philippe@linaro.org>
-Date: Fri, 24 Jan 2020 10:17:14 +0100
-Subject: [PATCH 1/4] TMP: iommu/arm-smmu-v3: Ignore IOPF capabilities
-
-Don't mandate PRI or stall to enable SVA. Some devices have their own
-method for managing I/O page faults when they notice a translation
-request that fails.
-
-Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
----
- drivers/iommu/arm-smmu-v3.c | 18 +++++++++++++++++-
- 1 file changed, 17 insertions(+), 1 deletion(-)
-
-diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
-index fed6a9d5867e..a8d7d6ccbb21 100644
---- a/drivers/iommu/arm-smmu-v3.c
-+++ b/drivers/iommu/arm-smmu-v3.c
-@@ -3276,7 +3276,23 @@ static bool arm_smmu_ats_supported(struct arm_smm=
u_master *master)
-=20
- static bool arm_smmu_iopf_supported(struct arm_smmu_master *master)
- {
--	return master->stall_enabled || master->pri_supported;
-+	/* return master->stall_enabled || master->pri_supported; */
-+
-+	/*
-+	 * FIXME: this temporary hack allows enabling SVA for any endpoint eve=
n
-+	 * when they don't have PRI/stall.
-+	 *
-+	 * To implement this more cleanly, we need a third method, complementi=
ng
-+	 * stall_enabled and pri_supported, to enable IOPF. A bit that says
-+	 * "this device's page faults are handled out of band", called for
-+	 * example master->oob_iopf. How to set it?  It can easily be a firmwa=
re
-+	 * quirk, but that does not suffice in my opinion. We need to know tha=
t
-+	 * there is software ready to handle these page faults. The device
-+	 * driver owning this endpoint could for example call
-+	 * iommu_dev_enable_feature(dev, IOMMU_DEV_FEAT_OOB_IOPF), before
-+	 * enabling IOMMU_DEV_FEAT_SVA.
-+	 */
-+	return true;
- }
-=20
- static void arm_smmu_enable_ats(struct arm_smmu_master *master)
---=20
-2.25.0
-
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel=
/linux/linux-linaro-arm-5.4/n1sdp/0002-pci_quirk-add-acs-override-for-PCI=
-devices.patch b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-ke=
rnel/linux/linux-linaro-arm-5.4/n1sdp/0002-pci_quirk-add-acs-override-for=
-PCI-devices.patch
deleted file mode 100644
index a66083a..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/=
linux-linaro-arm-5.4/n1sdp/0002-pci_quirk-add-acs-override-for-PCI-device=
s.patch
+++ /dev/null
@@ -1,156 +0,0 @@
-From 224e4adc6bc6a23f5deb3e1ebea03a85e3cad606 Mon Sep 17 00:00:00 2001
-From: Manoj Kumar <manoj.kumar3@arm.com>
-Date: Mon, 3 Feb 2020 10:11:19 +0000
-Subject: [PATCH 2/4] pci_quirk: add acs override for PCI devices
-
-Patch taken from:
-https://gitlab.com/Queuecumber/linux-acs-override/raw/master/workspaces/=
5.4/acso.patch
-
-Signed-off-by: Manoj Kumar <manoj.kumar3@arm.com>
----
- .../admin-guide/kernel-parameters.txt         |   9 ++
- drivers/pci/quirks.c                          | 101 ++++++++++++++++++
- 2 files changed, 110 insertions(+)
-
-diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documenta=
tion/admin-guide/kernel-parameters.txt
-index 8d7932502edc..f2be8337e98c 100644
---- a/Documentation/admin-guide/kernel-parameters.txt
-+++ b/Documentation/admin-guide/kernel-parameters.txt
-@@ -3423,6 +3423,15 @@
- 		nomsi		[MSI] If the PCI_MSI kernel config parameter is
- 				enabled, this kernel boot option can be used to
- 				disable the use of MSI interrupts system-wide.
-+		pcie_acs_override =3D
-+					[PCIE] Override missing PCIe ACS support for:
-+				downstream
-+					All downstream ports - full ACS capabilities
-+				multfunction
-+					All multifunction devices - multifunction ACS subset
-+				id:nnnn:nnnn
-+					Specfic device - full ACS capabilities
-+					Specified as vid:did (vendor/device ID) in hex
- 		noioapicquirk	[APIC] Disable all boot interrupt quirks.
- 				Safety option to keep boot IRQs enabled. This
- 				should never be necessary.
-diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
-index d134e12aab9d..9067bc7833be 100644
---- a/drivers/pci/quirks.c
-+++ b/drivers/pci/quirks.c
-@@ -3494,6 +3494,106 @@ static void quirk_no_bus_reset(struct pci_dev *d=
ev)
- 	dev->dev_flags |=3D PCI_DEV_FLAGS_NO_BUS_RESET;
- }
-=20
-+static bool acs_on_downstream;
-+static bool acs_on_multifunction;
-+
-+#define NUM_ACS_IDS 16
-+struct acs_on_id {
-+	unsigned short vendor;
-+	unsigned short device;
-+};
-+static struct acs_on_id acs_on_ids[NUM_ACS_IDS];
-+static u8 max_acs_id;
-+
-+static __init int pcie_acs_override_setup(char *p)
-+{
-+	if (!p)
-+		return -EINVAL;
-+
-+	while (*p) {
-+		if (!strncmp(p, "downstream", 10))
-+			acs_on_downstream =3D true;
-+		if (!strncmp(p, "multifunction", 13))
-+			acs_on_multifunction =3D true;
-+		if (!strncmp(p, "id:", 3)) {
-+			char opt[5];
-+			int ret;
-+			long val;
-+
-+			if (max_acs_id >=3D NUM_ACS_IDS - 1) {
-+				pr_warn("Out of PCIe ACS override slots (%d)\n",
-+						NUM_ACS_IDS);
-+				goto next;
-+			}
-+
-+			p +=3D 3;
-+			snprintf(opt, 5, "%s", p);
-+			ret =3D kstrtol(opt, 16, &val);
-+			if (ret) {
-+				pr_warn("PCIe ACS ID parse error %d\n", ret);
-+				goto next;
-+			}
-+			acs_on_ids[max_acs_id].vendor =3D val;
-+
-+			p +=3D strcspn(p, ":");
-+			if (*p !=3D ':') {
-+				pr_warn("PCIe ACS invalid ID\n");
-+				goto next;
-+			}
-+
-+			p++;
-+			snprintf(opt, 5, "%s", p);
-+			ret =3D kstrtol(opt, 16, &val);
-+			if (ret) {
-+				pr_warn("PCIe ACS ID parse error %d\n", ret);
-+				goto next;
-+			}
-+			acs_on_ids[max_acs_id].device =3D val;
-+			max_acs_id++;
-+		}
-+next:
-+		p +=3D strcspn(p, ",");
-+		if (*p =3D=3D ',')
-+			p++;
-+	}
-+
-+	if (acs_on_downstream || acs_on_multifunction || max_acs_id)
-+		pr_warn("Warning: PCIe ACS overrides enabled; This may allow non-IOMM=
U protected peer-to-peer DMA\n");
-+
-+	return 0;
-+}
-+early_param("pcie_acs_override", pcie_acs_override_setup);
-+
-+static int pcie_acs_overrides(struct pci_dev *dev, u16 acs_flags)
-+{
-+	int i;
-+
-+	/* Never override ACS for legacy devices or devices with ACS caps */
-+	if (!pci_is_pcie(dev) ||
-+		pci_find_ext_capability(dev, PCI_EXT_CAP_ID_ACS))
-+			return -ENOTTY;
-+
-+	for (i =3D 0; i < max_acs_id; i++)
-+		if (acs_on_ids[i].vendor =3D=3D dev->vendor &&
-+			acs_on_ids[i].device =3D=3D dev->device)
-+				return 1;
-+
-+	switch (pci_pcie_type(dev)) {
-+	case PCI_EXP_TYPE_DOWNSTREAM:
-+	case PCI_EXP_TYPE_ROOT_PORT:
-+		if (acs_on_downstream)
-+			return 1;
-+		break;
-+	case PCI_EXP_TYPE_ENDPOINT:
-+	case PCI_EXP_TYPE_UPSTREAM:
-+	case PCI_EXP_TYPE_LEG_END:
-+	case PCI_EXP_TYPE_RC_END:
-+		if (acs_on_multifunction && dev->multifunction)
-+			return 1;
-+	}
-+
-+	return -ENOTTY;
-+}
- /*
-  * Some Atheros AR9xxx and QCA988x chips do not behave after a bus rese=
t.
-  * The device will throw a Link Down error on AER-capable systems and
-@@ -4674,6 +4774,7 @@ static const struct pci_dev_acs_enabled {
- 	{ PCI_VENDOR_ID_BROADCOM, 0xD714, pci_quirk_brcm_acs },
- 	/* Amazon Annapurna Labs */
- 	{ PCI_VENDOR_ID_AMAZON_ANNAPURNA_LABS, 0x0031, pci_quirk_al_acs },
-+   { PCI_ANY_ID, PCI_ANY_ID, pcie_acs_overrides },
- 	{ 0 }
- };
-=20
---=20
-2.25.0
-
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel=
/linux/linux-linaro-arm-5.4/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neovers=
e-N1SDP-platform.patch b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/re=
cipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0003-pcie-Add-quirk-for-the=
-Arm-Neoverse-N1SDP-platform.patch
deleted file mode 100644
index d827e9d..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/=
linux-linaro-arm-5.4/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP=
-platform.patch
+++ /dev/null
@@ -1,318 +0,0 @@
-From 813f6c6015c75caf25553cd2e36361bac9151145 Mon Sep 17 00:00:00 2001
-From: Deepak Pandey <Deepak.Pandey@arm.com>
-Date: Mon, 9 Dec 2019 16:06:38 +0000
-Subject: [PATCH 3/4] pcie: Add quirk for the Arm Neoverse N1SDP platform
-
-The Arm N1SDP SoC suffers from some PCIe integration issues, most
-prominently config space accesses to not existing BDFs being answered
-with a bus abort, resulting in an SError.
-To mitigate this, the firmware scans the bus before boot (catching the
-SErrors) and creates a table with valid BDFs, which acts as a filter for
-Linux' config space accesses.
-
-Add code consulting the table as an ACPI PCIe quirk, also register the
-corresponding device tree based description of the host controller.
-Also fix the other two minor issues on the way, namely not being fully
-ECAM compliant and config space accesses being restricted to 32-bit
-accesses only.
-
-This allows the Arm Neoverse N1SDP board to boot Linux without crashing
-and to access *any* devices (there are no platform devices except UART).
-
-Signed-off-by: Deepak Pandey <Deepak.Pandey@arm.com>
-[Sudipto: extend to cover the CCIX root port as well]
-Signed-off-by: Sudipto Paul <sudipto.paul@arm.com>
-[Andre: fix coding style issues, rewrite some parts, add DT support]
-Signed-off-by: Andre Przywara <andre.przywara@arm.com>
----
- arch/arm64/configs/defconfig        |   1 +
- drivers/acpi/pci_mcfg.c             |   7 +
- drivers/pci/controller/Kconfig      |  11 ++
- drivers/pci/controller/Makefile     |   1 +
- drivers/pci/controller/pcie-n1sdp.c | 196 ++++++++++++++++++++++++++++
- include/linux/pci-ecam.h            |   2 +
- 6 files changed, 218 insertions(+)
- create mode 100644 drivers/pci/controller/pcie-n1sdp.c
-
-diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
-index 619a892148fb..56f00e82a4c4 100644
---- a/arch/arm64/configs/defconfig
-+++ b/arch/arm64/configs/defconfig
-@@ -177,6 +177,7 @@ CONFIG_NET_9P=3Dy
- CONFIG_NET_9P_VIRTIO=3Dy
- CONFIG_PCI=3Dy
- CONFIG_PCIEPORTBUS=3Dy
-+CONFIG_PCI_QUIRKS=3Dy
- CONFIG_PCI_IOV=3Dy
- CONFIG_HOTPLUG_PCI=3Dy
- CONFIG_HOTPLUG_PCI_ACPI=3Dy
-diff --git a/drivers/acpi/pci_mcfg.c b/drivers/acpi/pci_mcfg.c
-index 6b347d9920cc..7a2b41b9ab57 100644
---- a/drivers/acpi/pci_mcfg.c
-+++ b/drivers/acpi/pci_mcfg.c
-@@ -142,6 +142,13 @@ static struct mcfg_fixup mcfg_quirks[] =3D {
- 	XGENE_V2_ECAM_MCFG(4, 0),
- 	XGENE_V2_ECAM_MCFG(4, 1),
- 	XGENE_V2_ECAM_MCFG(4, 2),
-+
-+#define N1SDP_ECAM_MCFG(rev, seg, ops) \
-+	{"ARMLTD", "ARMN1SDP", rev, seg, MCFG_BUS_ANY, ops }
-+
-+	/* N1SDP SoC with v1 PCIe controller */
-+	N1SDP_ECAM_MCFG(0x20181101, 0, &pci_n1sdp_pcie_ecam_ops),
-+	N1SDP_ECAM_MCFG(0x20181101, 1, &pci_n1sdp_ccix_ecam_ops),
- };
-=20
- static char mcfg_oem_id[ACPI_OEM_ID_SIZE];
-diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kco=
nfig
-index 70e078238899..03860176e339 100644
---- a/drivers/pci/controller/Kconfig
-+++ b/drivers/pci/controller/Kconfig
-@@ -65,6 +65,17 @@ config PCI_FTPCI100
- 	depends on OF
- 	default ARCH_GEMINI
-=20
-+config PCIE_HOST_N1SDP_ECAM
-+	bool "ARM N1SDP PCIe Controller"
-+	depends on ARM64
-+	depends on OF || (ACPI && PCI_QUIRKS)
-+	select PCI_HOST_COMMON
-+	default y if ARCH_VEXPRESS
-+	help
-+	  Say Y here if you want PCIe support for the Arm N1SDP platform.
-+	  The controller is ECAM compliant, but needs a quirk to workaround
-+	  an integration issue.
-+
- config PCI_TEGRA
- 	bool "NVIDIA Tegra PCIe controller"
- 	depends on ARCH_TEGRA || COMPILE_TEST
-diff --git a/drivers/pci/controller/Makefile b/drivers/pci/controller/Ma=
kefile
-index a2a22c9d91af..7ea98c5a04ec 100644
---- a/drivers/pci/controller/Makefile
-+++ b/drivers/pci/controller/Makefile
-@@ -30,6 +30,7 @@ obj-$(CONFIG_PCIE_MEDIATEK) +=3D pcie-mediatek.o
- obj-$(CONFIG_PCIE_MOBIVEIL) +=3D pcie-mobiveil.o
- obj-$(CONFIG_PCIE_TANGO_SMP8759) +=3D pcie-tango.o
- obj-$(CONFIG_VMD) +=3D vmd.o
-+obj-$(CONFIG_PCIE_HOST_N1SDP_ECAM) +=3D pcie-n1sdp.o
- # pcie-hisi.o quirks are needed even without CONFIG_PCIE_DW
- obj-y				+=3D dwc/
-=20
-diff --git a/drivers/pci/controller/pcie-n1sdp.c b/drivers/pci/controlle=
r/pcie-n1sdp.c
-new file mode 100644
-index 000000000000..620ab221466c
---- /dev/null
-+++ b/drivers/pci/controller/pcie-n1sdp.c
-@@ -0,0 +1,196 @@
-+// SPDX-License-Identifier: GPL-2.0
-+/*
-+ * Copyright (C) 2018/2019 ARM Ltd.
-+ *
-+ * This quirk is to mask the following issues:
-+ * - PCIE SLVERR: config space accesses to invalid PCIe BDFs cause a bu=
s
-+ *		  error (signalled as an asynchronous SError)
-+ * - MCFG BDF mapping: the root complex is mapped separately from the d=
evice
-+ *		       config space
-+ * - Non 32-bit accesses to config space are not supported.
-+ *
-+ * At boot time the SCP board firmware creates a discovery table with
-+ * the root complex' base address and the valid BDF values, discovered =
while
-+ * scanning the config space and catching the SErrors.
-+ * Linux responds only to the EPs listed in this table, returning NULL
-+ * for the rest.
-+ */
-+
-+#include <linux/kernel.h>
-+#include <linux/init.h>
-+#include <linux/ioport.h>
-+#include <linux/sizes.h>
-+#include <linux/of_pci.h>
-+#include <linux/of.h>
-+#include <linux/pci-ecam.h>
-+#include <linux/platform_device.h>
-+#include <linux/module.h>
-+
-+/* Platform specific values as hardcoded in the firmware. */
-+#define AP_NS_SHARED_MEM_BASE	0x06000000
-+#define MAX_SEGMENTS		2		/* Two PCIe root complexes. */
-+#define BDF_TABLE_SIZE		SZ_16K
-+
-+/*
-+ * Shared memory layout as written by the SCP upon boot time:
-+ *  ----
-+ *  Discover data header --> RC base address
-+ *                       \-> BDF Count
-+ *  Discover data        --> BDF 0...n
-+ *  ----
-+ */
-+struct pcie_discovery_data {
-+	u32 rc_base_addr;
-+	u32 nr_bdfs;
-+	u32 valid_bdfs[0];
-+} *pcie_discovery_data[MAX_SEGMENTS];
-+
-+void __iomem *rc_remapped_addr[MAX_SEGMENTS];
-+
-+/*
-+ * map_bus() is called before we do a config space access for a certain
-+ * device. We use this to check whether this device is valid, avoiding
-+ * config space accesses which would result in an SError otherwise.
-+ */
-+static void __iomem *pci_n1sdp_map_bus(struct pci_bus *bus, unsigned in=
t devfn,
-+				       int where)
-+{
-+	struct pci_config_window *cfg =3D bus->sysdata;
-+	unsigned int devfn_shift =3D cfg->ops->bus_shift - 8;
-+	unsigned int busn =3D bus->number;
-+	unsigned int segment =3D bus->domain_nr;
-+	unsigned int bdf_addr;
-+	unsigned int table_count, i;
-+
-+	if (segment >=3D MAX_SEGMENTS ||
-+	    busn < cfg->busr.start || busn > cfg->busr.end)
-+		return NULL;
-+
-+	/* The PCIe root complex has a separate config space mapping. */
-+	if (busn =3D=3D 0 && devfn =3D=3D 0)
-+		return rc_remapped_addr[segment] + where;
-+
-+	busn -=3D cfg->busr.start;
-+	bdf_addr =3D (busn << cfg->ops->bus_shift) + (devfn << devfn_shift);
-+	table_count =3D pcie_discovery_data[segment]->nr_bdfs;
-+	for (i =3D 0; i < table_count; i++) {
-+		if (bdf_addr =3D=3D pcie_discovery_data[segment]->valid_bdfs[i])
-+			return pci_ecam_map_bus(bus, devfn, where);
-+	}
-+
-+	return NULL;
-+}
-+
-+static int pci_n1sdp_init(struct pci_config_window *cfg, unsigned int s=
egment)
-+{
-+	phys_addr_t table_base;
-+	struct device *dev =3D cfg->parent;
-+	struct pcie_discovery_data *shared_data;
-+	size_t bdfs_size;
-+
-+	if (segment >=3D MAX_SEGMENTS)
-+		return -ENODEV;
-+
-+	table_base =3D AP_NS_SHARED_MEM_BASE + segment * BDF_TABLE_SIZE;
-+
-+	if (!request_mem_region(table_base, BDF_TABLE_SIZE,
-+				"PCIe valid BDFs")) {
-+		dev_err(dev, "PCIe BDF shared region request failed\n");
-+		return -ENOMEM;
-+	}
-+
-+	shared_data =3D devm_ioremap(dev,
-+				   table_base, BDF_TABLE_SIZE);
-+	if (!shared_data)
-+		return -ENOMEM;
-+
-+	/* Copy the valid BDFs structure to allocated normal memory. */
-+	bdfs_size =3D sizeof(struct pcie_discovery_data) +
-+		    sizeof(u32) * shared_data->nr_bdfs;
-+	pcie_discovery_data[segment] =3D devm_kmalloc(dev, bdfs_size, GFP_KERN=
EL);
-+	if (!pcie_discovery_data[segment])
-+		return -ENOMEM;
-+
-+	memcpy_fromio(pcie_discovery_data[segment], shared_data, bdfs_size);
-+
-+	rc_remapped_addr[segment] =3D devm_ioremap_nocache(dev,
-+						shared_data->rc_base_addr,
-+						PCI_CFG_SPACE_EXP_SIZE);
-+	if (!rc_remapped_addr[segment]) {
-+		dev_err(dev, "Cannot remap root port base\n");
-+		return -ENOMEM;
-+	}
-+
-+	devm_iounmap(dev, shared_data);
-+
-+	return 0;
-+}
-+
-+static int pci_n1sdp_pcie_init(struct pci_config_window *cfg)
-+{
-+	return pci_n1sdp_init(cfg, 0);
-+}
-+
-+static int pci_n1sdp_ccix_init(struct pci_config_window *cfg)
-+{
-+	return pci_n1sdp_init(cfg, 1);
-+}
-+
-+struct pci_ecam_ops pci_n1sdp_pcie_ecam_ops =3D {
-+	.bus_shift	=3D 20,
-+	.init		=3D pci_n1sdp_pcie_init,
-+	.pci_ops	=3D {
-+		.map_bus        =3D pci_n1sdp_map_bus,
-+		.read           =3D pci_generic_config_read32,
-+		.write          =3D pci_generic_config_write32,
-+	}
-+};
-+
-+struct pci_ecam_ops pci_n1sdp_ccix_ecam_ops =3D {
-+	.bus_shift	=3D 20,
-+	.init		=3D pci_n1sdp_ccix_init,
-+	.pci_ops	=3D {
-+		.map_bus        =3D pci_n1sdp_map_bus,
-+		.read           =3D pci_generic_config_read32,
-+		.write          =3D pci_generic_config_write32,
-+	}
-+};
-+
-+static const struct of_device_id n1sdp_pcie_of_match[] =3D {
-+	{ .compatible =3D "arm,n1sdp-pcie" },
-+	{ },
-+};
-+MODULE_DEVICE_TABLE(of, n1sdp_pcie_of_match);
-+
-+static int n1sdp_pcie_probe(struct platform_device *pdev)
-+{
-+	const struct device_node *of_node =3D pdev->dev.of_node;
-+	u32 segment;
-+
-+	if (of_property_read_u32(of_node, "linux,pci-domain", &segment)) {
-+		dev_err(&pdev->dev, "N1SDP PCI controllers require linux,pci-domain p=
roperty\n");
-+		return -EINVAL;
-+	}
-+
-+	switch (segment) {
-+	case 0:
-+		return pci_host_common_probe(pdev, &pci_n1sdp_pcie_ecam_ops);
-+	case 1:
-+		return pci_host_common_probe(pdev, &pci_n1sdp_ccix_ecam_ops);
-+	}
-+
-+	dev_err(&pdev->dev, "Invalid segment number, must be smaller than %d\n=
",
-+		MAX_SEGMENTS);
-+
-+	return -EINVAL;
-+}
-+
-+static struct platform_driver n1sdp_pcie_driver =3D {
-+	.driver =3D {
-+		.name =3D KBUILD_MODNAME,
-+		.of_match_table =3D n1sdp_pcie_of_match,
-+		.suppress_bind_attrs =3D true,
-+	},
-+	.probe =3D n1sdp_pcie_probe,
-+};
-+builtin_platform_driver(n1sdp_pcie_driver);
-diff --git a/include/linux/pci-ecam.h b/include/linux/pci-ecam.h
-index a73164c85e78..03cdea69f4e8 100644
---- a/include/linux/pci-ecam.h
-+++ b/include/linux/pci-ecam.h
-@@ -57,6 +57,8 @@ extern struct pci_ecam_ops pci_thunder_ecam_ops; /* Ca=
vium ThunderX 1.x */
- extern struct pci_ecam_ops xgene_v1_pcie_ecam_ops; /* APM X-Gene PCIe v=
1 */
- extern struct pci_ecam_ops xgene_v2_pcie_ecam_ops; /* APM X-Gene PCIe v=
2.x */
- extern struct pci_ecam_ops al_pcie_ops; /* Amazon Annapurna Labs PCIe *=
/
-+extern struct pci_ecam_ops pci_n1sdp_pcie_ecam_ops; /* Arm N1SDP PCIe *=
/
-+extern struct pci_ecam_ops pci_n1sdp_ccix_ecam_ops; /* Arm N1SDP PCIe *=
/
- #endif
-=20
- #ifdef CONFIG_PCI_HOST_COMMON
---=20
-2.25.0
-
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel=
/linux/linux-linaro-arm-5.4/n1sdp/0004-n1sdp-update-n1sdp-pci-quirk-for-S=
R-IOV-support.patch b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recip=
es-kernel/linux/linux-linaro-arm-5.4/n1sdp/0004-n1sdp-update-n1sdp-pci-qu=
irk-for-SR-IOV-support.patch
deleted file mode 100644
index 6fb2dac..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/=
linux-linaro-arm-5.4/n1sdp/0004-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-s=
upport.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 7bcc0412428050b0ab1fd70cbb4aaead5ac3c0e5 Mon Sep 17 00:00:00 2001
-From: Manoj Kumar <manoj.kumar3@arm.com>
-Date: Wed, 29 Jan 2020 17:21:39 +0000
-Subject: [PATCH 4/4] n1sdp: update n1sdp pci quirk for SR-IOV support
-
-VFs are not probing the vendor ID first, which is otherwise
-the gate keeper for undiscovered devices. So any accesses using
-a config space offset greater than 0 must be coming for an
-already discovered device or from a VF that has just been created.
-
-Also if Linux already has a struct pci_dev* for a given BDF,
-this device is safe to access.
-
-Skip the firmware table in these cases and allow accesses to
-those devices. That enables SR-IOV support on the N1SDP board.
-
-Signed-off-by: Andre Przywara <andre.przywara@arm.com>
----
- drivers/pci/controller/pcie-n1sdp.c | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/drivers/pci/controller/pcie-n1sdp.c b/drivers/pci/controlle=
r/pcie-n1sdp.c
-index 620ab221466c..04c0de043817 100644
---- a/drivers/pci/controller/pcie-n1sdp.c
-+++ b/drivers/pci/controller/pcie-n1sdp.c
-@@ -61,6 +61,7 @@ static void __iomem *pci_n1sdp_map_bus(struct pci_bus =
*bus, unsigned int devfn,
- 	unsigned int segment =3D bus->domain_nr;
- 	unsigned int bdf_addr;
- 	unsigned int table_count, i;
-+	struct pci_dev *dev;
-=20
- 	if (segment >=3D MAX_SEGMENTS ||
- 	    busn < cfg->busr.start || busn > cfg->busr.end)
-@@ -70,6 +71,14 @@ static void __iomem *pci_n1sdp_map_bus(struct pci_bus=
 *bus, unsigned int devfn,
- 	if (busn =3D=3D 0 && devfn =3D=3D 0)
- 		return rc_remapped_addr[segment] + where;
-=20
-+	dev =3D pci_get_domain_bus_and_slot(segment, busn, devfn);
-+	if (dev && dev->is_virtfn)
-+		return pci_ecam_map_bus(bus, devfn, where);
-+
-+	/* Accesses beyond the vendor ID always go to existing devices. */
-+	if (where > 0)
-+		return pci_ecam_map_bus(bus, devfn, where);
-+
- 	busn -=3D cfg->busr.start;
- 	bdf_addr =3D (busn << cfg->ops->bus_shift) + (devfn << devfn_shift);
- 	table_count =3D pcie_discovery_data[segment]->nr_bdfs;
---=20
-2.25.0
-
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel=
/linux/linux-linaro-arm-5.4/n1sdp/0005-n1sdp-pcie-add-quirk-support-enabl=
ing-remote-chip-PC.patch b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/=
recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0005-n1sdp-pcie-add-quirk=
-support-enabling-remote-chip-PC.patch
deleted file mode 100644
index d3db77a..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/=
linux-linaro-arm-5.4/n1sdp/0005-n1sdp-pcie-add-quirk-support-enabling-rem=
ote-chip-PC.patch
+++ /dev/null
@@ -1,134 +0,0 @@
-Upstream-Status: Inappropriate [will not be submitted as its an hack req=
uired to fix the hardware issue]
-
-This patch is picked from the git repository:
-https://git.linaro.org/landing-teams/working/arm/n1sdp-pcie-quirk.git/pa=
tch/?id=3D04b7e76d0fe6481a803f58e54e008a1489d713a5
-
-Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
-
-From 94892f681463908e4a879258dfd6053bbb025447 Mon Sep 17 00:00:00 2001
-From: Sayanta Pattanayak <sayanta.pattanayak@arm.com>
-Date: Fri, 31 Jul 2020 15:32:24 +0530
-Subject: [PATCH 5/5] n1sdp: pcie: add quirk support enabling remote chip=
 PCIe
-
-Base address mapping for remote chip Root PCIe ECAM space.
-
-Remote Chip PCIe topology is enumerated in Firmware and current
-change takes referecne of enumerated PCIe hierarchy of Remote chip into =
the
-kernel and include in complete PCIe topology for kernel framework.
-
-Change-Id: I368e51c535ac66e48bd356bd33da6c49f1a0fb2a
-Signed-off-by: Sayanta Pattanayak <sayanta.pattanayak@arm.com>
----
- drivers/acpi/pci_mcfg.c             |  1 +
- drivers/pci/controller/pcie-n1sdp.c | 34 ++++++++++++++++++++++++++---
- include/linux/pci-ecam.h            |  1 +
- 3 files changed, 33 insertions(+), 3 deletions(-)
-
-diff --git a/drivers/acpi/pci_mcfg.c b/drivers/acpi/pci_mcfg.c
-index 7a2b41b9ab57..53d073ef941f 100644
---- a/drivers/acpi/pci_mcfg.c
-+++ b/drivers/acpi/pci_mcfg.c
-@@ -149,6 +149,7 @@ static struct mcfg_fixup mcfg_quirks[] =3D {
- 	/* N1SDP SoC with v1 PCIe controller */
- 	N1SDP_ECAM_MCFG(0x20181101, 0, &pci_n1sdp_pcie_ecam_ops),
- 	N1SDP_ECAM_MCFG(0x20181101, 1, &pci_n1sdp_ccix_ecam_ops),
-+	N1SDP_ECAM_MCFG(0x20181101, 2, &pci_n1sdp_remote_pcie_ecam_ops),
- };
-=20
- static char mcfg_oem_id[ACPI_OEM_ID_SIZE];
-diff --git a/drivers/pci/controller/pcie-n1sdp.c b/drivers/pci/controlle=
r/pcie-n1sdp.c
-index 04c0de043817..19b573468ac5 100644
---- a/drivers/pci/controller/pcie-n1sdp.c
-+++ b/drivers/pci/controller/pcie-n1sdp.c
-@@ -28,8 +28,10 @@
-=20
- /* Platform specific values as hardcoded in the firmware. */
- #define AP_NS_SHARED_MEM_BASE	0x06000000
--#define MAX_SEGMENTS		2		/* Two PCIe root complexes. */
-+/* Two PCIe root complexes in One Chip + One PCIe RC in Remote Chip*/
-+#define MAX_SEGMENTS		3
- #define BDF_TABLE_SIZE		SZ_16K
-+#define REMOTE_CHIP_ADDR_OFFSET	0x40000000000
-=20
- /*
-  * Shared memory layout as written by the SCP upon boot time:
-@@ -100,7 +102,10 @@ static int pci_n1sdp_init(struct pci_config_window =
*cfg, unsigned int segment)
- 	if (segment >=3D MAX_SEGMENTS)
- 		return -ENODEV;
-=20
--	table_base =3D AP_NS_SHARED_MEM_BASE + segment * BDF_TABLE_SIZE;
-+	if (segment > 1)
-+		table_base =3D AP_NS_SHARED_MEM_BASE + REMOTE_CHIP_ADDR_OFFSET;
-+	else
-+		table_base =3D AP_NS_SHARED_MEM_BASE + segment * BDF_TABLE_SIZE;
-=20
- 	if (!request_mem_region(table_base, BDF_TABLE_SIZE,
- 				"PCIe valid BDFs")) {
-@@ -122,7 +127,13 @@ static int pci_n1sdp_init(struct pci_config_window =
*cfg, unsigned int segment)
-=20
- 	memcpy_fromio(pcie_discovery_data[segment], shared_data, bdfs_size);
-=20
--	rc_remapped_addr[segment] =3D devm_ioremap_nocache(dev,
-+
-+	if (segment > 1)
-+		rc_remapped_addr[segment] =3D devm_ioremap_nocache(dev,
-+						shared_data->rc_base_addr + REMOTE_CHIP_ADDR_OFFSET,
-+						PCI_CFG_SPACE_EXP_SIZE);
-+	else
-+		rc_remapped_addr[segment] =3D devm_ioremap_nocache(dev,
- 						shared_data->rc_base_addr,
- 						PCI_CFG_SPACE_EXP_SIZE);
- 	if (!rc_remapped_addr[segment]) {
-@@ -145,6 +156,11 @@ static int pci_n1sdp_ccix_init(struct pci_config_wi=
ndow *cfg)
- 	return pci_n1sdp_init(cfg, 1);
- }
-=20
-+static int pci_n1sdp_remote_pcie_init(struct pci_config_window *cfg)
-+{
-+	return pci_n1sdp_init(cfg, 2);
-+}
-+
- struct pci_ecam_ops pci_n1sdp_pcie_ecam_ops =3D {
- 	.bus_shift	=3D 20,
- 	.init		=3D pci_n1sdp_pcie_init,
-@@ -165,6 +181,16 @@ struct pci_ecam_ops pci_n1sdp_ccix_ecam_ops =3D {
- 	}
- };
-=20
-+struct pci_ecam_ops pci_n1sdp_remote_pcie_ecam_ops =3D {
-+	.bus_shift	=3D 20,
-+	.init		=3D pci_n1sdp_remote_pcie_init,
-+	.pci_ops	=3D {
-+		.map_bus        =3D pci_n1sdp_map_bus,
-+		.read           =3D pci_generic_config_read32,
-+		.write          =3D pci_generic_config_write32,
-+	}
-+};
-+
- static const struct of_device_id n1sdp_pcie_of_match[] =3D {
- 	{ .compatible =3D "arm,n1sdp-pcie" },
- 	{ },
-@@ -186,6 +212,8 @@ static int n1sdp_pcie_probe(struct platform_device *=
pdev)
- 		return pci_host_common_probe(pdev, &pci_n1sdp_pcie_ecam_ops);
- 	case 1:
- 		return pci_host_common_probe(pdev, &pci_n1sdp_ccix_ecam_ops);
-+	case 2:
-+		return pci_host_common_probe(pdev, &pci_n1sdp_remote_pcie_ecam_ops);
- 	}
-=20
- 	dev_err(&pdev->dev, "Invalid segment number, must be smaller than %d\n=
",
-diff --git a/include/linux/pci-ecam.h b/include/linux/pci-ecam.h
-index 03cdea69f4e8..2270662428e1 100644
---- a/include/linux/pci-ecam.h
-+++ b/include/linux/pci-ecam.h
-@@ -59,6 +59,7 @@ extern struct pci_ecam_ops xgene_v2_pcie_ecam_ops; /* =
APM X-Gene PCIe v2.x */
- extern struct pci_ecam_ops al_pcie_ops; /* Amazon Annapurna Labs PCIe *=
/
- extern struct pci_ecam_ops pci_n1sdp_pcie_ecam_ops; /* Arm N1SDP PCIe *=
/
- extern struct pci_ecam_ops pci_n1sdp_ccix_ecam_ops; /* Arm N1SDP PCIe *=
/
-+extern struct pci_ecam_ops pci_n1sdp_remote_pcie_ecam_ops; /* Arm N1SDP=
 PCIe */
- #endif
-=20
- #ifdef CONFIG_PCI_HOST_COMMON
---=20
-2.25.0
-
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel=
/linux/linux-linaro-arm-5.4/n1sdp/enable-realtek-R8169.cfg b/meta-arm-aut=
onomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5=
.4/n1sdp/enable-realtek-R8169.cfg
deleted file mode 100644
index 7a57474..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/=
linux-linaro-arm-5.4/n1sdp/enable-realtek-R8169.cfg
+++ /dev/null
@@ -1,3 +0,0 @@
-# Enable Realtek Gigabit Ethernet adapter
-CONFIG_REALTEK_PHY=3Dy
-CONFIG_R8169=3Dy
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel=
/linux/linux-linaro-arm-5.4/n1sdp/scripts-dtc-remove-redundant-YYLOC.patc=
h b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/li=
nux-linaro-arm-5.4/n1sdp/scripts-dtc-remove-redundant-YYLOC.patch
deleted file mode 100644
index f3ae5e5..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/=
linux-linaro-arm-5.4/n1sdp/scripts-dtc-remove-redundant-YYLOC.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-Upstream-Status: Backport https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git/log/scripts/dtc/dtc-lexer.l?h=3Dv5.8
-Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
-
-From 35b34d264cb347909ec89d9fa895900035d5438c Mon Sep 17 00:00:00 2001
-From: Dirk Mueller <dmueller@suse.com>
-Date: Tue, 14 Jan 2020 18:53:41 +0100
-Subject: scripts/dtc: Remove redundant YYLOC global declaration
-
-commit e33a814e772cdc36436c8c188d8c42d019fda639 upstream.
-
-gcc 10 will default to -fno-common, which causes this error at link
-time:
-
-  (.text+0x0): multiple definition of `yylloc'; dtc-lexer.lex.o (symbol =
from plugin):(.text+0x0): first defined here
-
-This is because both dtc-lexer as well as dtc-parser define the same
-global symbol yyloc. Before with -fcommon those were merged into one
-defintion. The proper solution would be to to mark this as "extern",
-however that leads to:
-
-  dtc-lexer.l:26:16: error: redundant redeclaration of 'yylloc' [-Werror=
=3Dredundant-decls]
-   26 | extern YYLTYPE yylloc;
-      |                ^~~~~~
-In file included from dtc-lexer.l:24:
-dtc-parser.tab.h:127:16: note: previous declaration of 'yylloc' was here
-  127 | extern YYLTYPE yylloc;
-      |                ^~~~~~
-cc1: all warnings being treated as errors
-
-which means the declaration is completely redundant and can just be
-dropped.
-
-Signed-off-by: Dirk Mueller <dmueller@suse.com>
-Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
-[robh: cherry-pick from upstream]
-Cc: stable@vger.kernel.org
-Signed-off-by: Rob Herring <robh@kernel.org>
-Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
----
- scripts/dtc/dtc-lexer.l | 1 -
- 1 file changed, 1 deletion(-)
-
-(limited to 'scripts/dtc/dtc-lexer.l')
-
-diff --git a/scripts/dtc/dtc-lexer.l b/scripts/dtc/dtc-lexer.l
-index 5c6c3fd557d7..b3b7270300de 100644
---- a/scripts/dtc/dtc-lexer.l
-+++ b/scripts/dtc/dtc-lexer.l
-@@ -23,7 +23,6 @@ LINECOMMENT	"//".*\n
- #include "srcpos.h"
- #include "dtc-parser.tab.h"
-=20
--YYLTYPE yylloc;
- extern bool treesource_error;
-=20
- /* CAUTION: this will stop working if we ever use yyless() or yyunput()=
 */
---=20
-cgit v1.2.2-1-g5e49
-
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel=
/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-01.patch b/meta-arm-autonomy=
/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/pe=
rf-fixup-gcc10-01.patch
deleted file mode 100644
index efca58f..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/=
linux-linaro-arm-5.4/perf-fixup-gcc10-01.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-perf cs-etm: Move definition of 'traceid_list' global variable from head=
er file
-Upstream-Status: Backport https://git.kernel.org/pub/scm/linux/kernel/gi=
t/stable/linux.git/patch/tools/perf/util?id=3Dbc79abf4afea97d5ce682aa2bd1=
095fb74400916
-Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
-
-From bc79abf4afea97d5ce682aa2bd1095fb74400916 Mon Sep 17 00:00:00 2001
-From: Leo Yan <leo.yan@linaro.org>
-Date: Tue, 5 May 2020 21:36:42 +0800
-Subject: perf cs-etm: Move definition of 'traceid_list' global variable =
from
- header file
-
-commit 168200b6d6ea0cb5765943ec5da5b8149701f36a upstream.
-
-The variable 'traceid_list' is defined in the header file cs-etm.h,
-if multiple C files include cs-etm.h the compiler might complaint for
-multiple definition of 'traceid_list'.
-
-To fix multiple definition error, move the definition of 'traceid_list'
-into cs-etm.c.
-
-Fixes: cd8bfd8c973e ("perf tools: Add processing of coresight metadata")
-Reported-by: Thomas Backlund <tmb@mageia.org>
-Signed-off-by: Leo Yan <leo.yan@linaro.org>
-Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
-Reviewed-by: Mike Leach <mike.leach@linaro.org>
-Tested-by: Mike Leach <mike.leach@linaro.org>
-Tested-by: Thomas Backlund <tmb@mageia.org>
-Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
-Cc: Jiri Olsa <jolsa@redhat.com>
-Cc: Mark Rutland <mark.rutland@arm.com>
-Cc: Namhyung Kim <namhyung@kernel.org>
-Cc: Peter Zijlstra <peterz@infradead.org>
-Cc: Suzuki Poulouse <suzuki.poulose@arm.com>
-Cc: Tor Jeremiassen <tor@ti.com>
-Cc: linux-arm-kernel@lists.infradead.org
-Link: http://lore.kernel.org/lkml/20200505133642.4756-1-leo.yan@linaro.o=
rg
-Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
-Cc: Paul Barker <pbarker@konsulko.com>
-Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
----
- tools/perf/util/cs-etm.c | 3 +++
- tools/perf/util/cs-etm.h | 3 ---
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-(limited to 'tools/perf/util')
-
-diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
-index 451eee24165ee..f5a9cb4088080 100644
---- a/tools/perf/util/cs-etm.c
-+++ b/tools/perf/util/cs-etm.c
-@@ -94,6 +94,9 @@ struct cs_etm_queue {
- 	struct cs_etm_traceid_queue **traceid_queues;
- };
-=20
-+/* RB tree for quick conversion between traceID and metadata pointers *=
/
-+static struct intlist *traceid_list;
-+
- static int cs_etm__update_queues(struct cs_etm_auxtrace *etm);
- static int cs_etm__process_queues(struct cs_etm_auxtrace *etm);
- static int cs_etm__process_timeless_queues(struct cs_etm_auxtrace *etm,
-diff --git a/tools/perf/util/cs-etm.h b/tools/perf/util/cs-etm.h
-index 650ecc2a63492..4ad925d6d7996 100644
---- a/tools/perf/util/cs-etm.h
-+++ b/tools/perf/util/cs-etm.h
-@@ -114,9 +114,6 @@ enum cs_etm_isa {
- 	CS_ETM_ISA_T32,
- };
-=20
--/* RB tree for quick conversion between traceID and metadata pointers *=
/
--struct intlist *traceid_list;
--
- struct cs_etm_queue;
-=20
- struct cs_etm_packet {
---=20
-cgit 1.2.3-1.el7
-
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel=
/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-02.patch b/meta-arm-autonomy=
/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/pe=
rf-fixup-gcc10-02.patch
deleted file mode 100644
index b512d3e..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/=
linux-linaro-arm-5.4/perf-fixup-gcc10-02.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-perf tests bp_account: Make global variable static
-Upstream-Status: Backport https://git.kernel.org/pub/scm/linux/kernel/gi=
t/stable/linux.git/patch/tools/perf/tests/bp_account.c?id=3D73d2d6b421dfd=
c66b4615452a94efcece27a3c21
-Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
-
-From 73d2d6b421dfdc66b4615452a94efcece27a3c21 Mon Sep 17 00:00:00 2001
-From: Arnaldo Carvalho de Melo <acme@redhat.com>
-Date: Mon, 2 Mar 2020 11:13:19 -0300
-Subject: perf tests bp_account: Make global variable static
-
-commit cff20b3151ccab690715cb6cf0f5da5cccb32adf upstream.
-
-To fix the build with newer gccs, that without this patch exit with:
-
-    LD       /tmp/build/perf/tests/perf-in.o
-  ld: /tmp/build/perf/tests/bp_account.o:/git/perf/tools/perf/tests/bp_a=
ccount.c:22: multiple definition of `the_var'; /tmp/build/perf/tests/bp_s=
ignal.o:/git/perf/tools/perf/tests/bp_signal.c:38: first defined here
-  make[4]: *** [/git/perf/tools/build/Makefile.build:145: /tmp/build/per=
f/tests/perf-in.o] Error 1
-
-First noticed in fedora:rawhide/32 with:
-
-  [perfbuilder@a5ff49d6e6e4 ~]$ gcc --version
-  gcc (GCC) 10.0.1 20200216 (Red Hat 10.0.1-0.8)
-
-Reported-by: Jiri Olsa <jolsa@kernel.org>
-Cc: Adrian Hunter <adrian.hunter@intel.com>
-Cc: Namhyung Kim <namhyung@kernel.org>
-Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
-Cc: Ben Hutchings <ben@decadent.org.uk>
-Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
----
- tools/perf/tests/bp_account.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-(limited to 'tools/perf/tests/bp_account.c')
-
-diff --git a/tools/perf/tests/bp_account.c b/tools/perf/tests/bp_account=
.c
-index 016bba2c142db..55a9de311d7b0 100644
---- a/tools/perf/tests/bp_account.c
-+++ b/tools/perf/tests/bp_account.c
-@@ -23,7 +23,7 @@
- #include "../perf-sys.h"
- #include "cloexec.h"
-=20
--volatile long the_var;
-+static volatile long the_var;
-=20
- static noinline int test_function(void)
- {
---=20
-cgit 1.2.3-1.el7
-
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel=
/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-03.patch b/meta-arm-autonomy=
/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/pe=
rf-fixup-gcc10-03.patch
deleted file mode 100644
index 8b8a299..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/=
linux-linaro-arm-5.4/perf-fixup-gcc10-03.patch
+++ /dev/null
@@ -1,246 +0,0 @@
-perf bench: Share some global variables to fix build with gcc 10
-Upstream-Status: Backport https://git.kernel.org/pub/scm/linux/kernel/gi=
t/stable/linux.git/commit/tools/perf/bench?h=3Dlinux-5.4.y&id=3Ddf35e878d=
0a51755fb500e2e8e29c7ebb0239756
-Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
-
-From df35e878d0a51755fb500e2e8e29c7ebb0239756 Mon Sep 17 00:00:00 2001
-From: Arnaldo Carvalho de Melo <acme@redhat.com>
-Date: Mon, 2 Mar 2020 12:09:38 -0300
-Subject: perf bench: Share some global variables to fix build with gcc 1=
0
-
-commit e4d9b04b973b2dbce7b42af95ea70d07da1c936d upstream.
-
-Noticed with gcc 10 (fedora rawhide) that those variables were not being
-declared as static, so end up with:
-
-  ld: /tmp/build/perf/bench/epoll-wait.o:/git/perf/tools/perf/bench/epol=
l-wait.c:93: multiple definition of `end'; /tmp/build/perf/bench/futex-ha=
sh.o:/git/perf/tools/perf/bench/futex-hash.c:40: first defined here
-  ld: /tmp/build/perf/bench/epoll-wait.o:/git/perf/tools/perf/bench/epol=
l-wait.c:93: multiple definition of `start'; /tmp/build/perf/bench/futex-=
hash.o:/git/perf/tools/perf/bench/futex-hash.c:40: first defined here
-  ld: /tmp/build/perf/bench/epoll-wait.o:/git/perf/tools/perf/bench/epol=
l-wait.c:93: multiple definition of `runtime'; /tmp/build/perf/bench/fute=
x-hash.o:/git/perf/tools/perf/bench/futex-hash.c:40: first defined here
-  ld: /tmp/build/perf/bench/epoll-ctl.o:/git/perf/tools/perf/bench/epoll=
-ctl.c:38: multiple definition of `end'; /tmp/build/perf/bench/futex-hash=
.o:/git/perf/tools/perf/bench/futex-hash.c:40: first defined here
-  ld: /tmp/build/perf/bench/epoll-ctl.o:/git/perf/tools/perf/bench/epoll=
-ctl.c:38: multiple definition of `start'; /tmp/build/perf/bench/futex-ha=
sh.o:/git/perf/tools/perf/bench/futex-hash.c:40: first defined here
-  ld: /tmp/build/perf/bench/epoll-ctl.o:/git/perf/tools/perf/bench/epoll=
-ctl.c:38: multiple definition of `runtime'; /tmp/build/perf/bench/futex-=
hash.o:/git/perf/tools/perf/bench/futex-hash.c:40: first defined here
-  make[4]: *** [/git/perf/tools/build/Makefile.build:145: /tmp/build/per=
f/bench/perf-in.o] Error 1
-
-Prefix those with bench__ and add them to bench/bench.h, so that we can
-share those on the tools needing to access those variables from signal
-handlers.
-
-Acked-by: Thomas Gleixner <tglx@linutronix.de>
-Cc: Adrian Hunter <adrian.hunter@intel.com>
-Cc: Davidlohr Bueso <dave@stgolabs.net>
-Cc: Jiri Olsa <jolsa@kernel.org>
-Cc: Namhyung Kim <namhyung@kernel.org>
-Link: http://lore.kernel.org/lkml/20200303155811.GD13702@kernel.org
-Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
-Cc: Ben Hutchings <ben@decadent.org.uk>
-Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
----
- tools/perf/bench/bench.h         |  4 ++++
- tools/perf/bench/epoll-ctl.c     |  7 +++----
- tools/perf/bench/epoll-wait.c    | 11 +++++------
- tools/perf/bench/futex-hash.c    | 12 ++++++------
- tools/perf/bench/futex-lock-pi.c | 11 +++++------
- 5 files changed, 23 insertions(+), 22 deletions(-)
-
-(limited to 'tools/perf/bench')
-
-diff --git a/tools/perf/bench/bench.h b/tools/perf/bench/bench.h
-index fddb3ced9db62..4aa6de1aa67dc 100644
---- a/tools/perf/bench/bench.h
-+++ b/tools/perf/bench/bench.h
-@@ -2,6 +2,10 @@
- #ifndef BENCH_H
- #define BENCH_H
-=20
-+#include <sys/time.h>
-+
-+extern struct timeval bench__start, bench__end, bench__runtime;
-+
- /*
-  * The madvise transparent hugepage constants were added in glibc
-  * 2.13. For compatibility with older versions of glibc, define these
-diff --git a/tools/perf/bench/epoll-ctl.c b/tools/perf/bench/epoll-ctl.c
-index bb617e5688412..a7526c05df382 100644
---- a/tools/perf/bench/epoll-ctl.c
-+++ b/tools/perf/bench/epoll-ctl.c
-@@ -35,7 +35,6 @@
-=20
- static unsigned int nthreads =3D 0;
- static unsigned int nsecs    =3D 8;
--struct timeval start, end, runtime;
- static bool done, __verbose, randomize;
-=20
- /*
-@@ -94,8 +93,8 @@ static void toggle_done(int sig __maybe_unused,
- {
- 	/* inform all threads that we're done for the day */
- 	done =3D true;
--	gettimeofday(&end, NULL);
--	timersub(&end, &start, &runtime);
-+	gettimeofday(&bench__end, NULL);
-+	timersub(&bench__end, &bench__start, &bench__runtime);
- }
-=20
- static void nest_epollfd(void)
-@@ -361,7 +360,7 @@ int bench_epoll_ctl(int argc, const char **argv)
-=20
- 	threads_starting =3D nthreads;
-=20
--	gettimeofday(&start, NULL);
-+	gettimeofday(&bench__start, NULL);
-=20
- 	do_threads(worker, cpu);
-=20
-diff --git a/tools/perf/bench/epoll-wait.c b/tools/perf/bench/epoll-wait=
.c
-index 7af694437f4ea..d1c5cb526b9ff 100644
---- a/tools/perf/bench/epoll-wait.c
-+++ b/tools/perf/bench/epoll-wait.c
-@@ -90,7 +90,6 @@
-=20
- static unsigned int nthreads =3D 0;
- static unsigned int nsecs    =3D 8;
--struct timeval start, end, runtime;
- static bool wdone, done, __verbose, randomize, nonblocking;
-=20
- /*
-@@ -276,8 +275,8 @@ static void toggle_done(int sig __maybe_unused,
- {
- 	/* inform all threads that we're done for the day */
- 	done =3D true;
--	gettimeofday(&end, NULL);
--	timersub(&end, &start, &runtime);
-+	gettimeofday(&bench__end, NULL);
-+	timersub(&bench__end, &bench__start, &bench__runtime);
- }
-=20
- static void print_summary(void)
-@@ -287,7 +286,7 @@ static void print_summary(void)
-=20
- 	printf("\nAveraged %ld operations/sec (+- %.2f%%), total secs =3D %d\n=
",
- 	       avg, rel_stddev_stats(stddev, avg),
--	       (int) runtime.tv_sec);
-+	       (int)bench__runtime.tv_sec);
- }
-=20
- static int do_threads(struct worker *worker, struct perf_cpu_map *cpu)
-@@ -479,7 +478,7 @@ int bench_epoll_wait(int argc, const char **argv)
-=20
- 	threads_starting =3D nthreads;
-=20
--	gettimeofday(&start, NULL);
-+	gettimeofday(&bench__start, NULL);
-=20
- 	do_threads(worker, cpu);
-=20
-@@ -519,7 +518,7 @@ int bench_epoll_wait(int argc, const char **argv)
- 		qsort(worker, nthreads, sizeof(struct worker), cmpworker);
-=20
- 	for (i =3D 0; i < nthreads; i++) {
--		unsigned long t =3D worker[i].ops/runtime.tv_sec;
-+		unsigned long t =3D worker[i].ops / bench__runtime.tv_sec;
-=20
- 		update_stats(&throughput_stats, t);
-=20
-diff --git a/tools/perf/bench/futex-hash.c b/tools/perf/bench/futex-hash=
.c
-index 8ba0c3330a9a2..21776862e940f 100644
---- a/tools/perf/bench/futex-hash.c
-+++ b/tools/perf/bench/futex-hash.c
-@@ -37,7 +37,7 @@ static unsigned int nfutexes =3D 1024;
- static bool fshared =3D false, done =3D false, silent =3D false;
- static int futex_flag =3D 0;
-=20
--struct timeval start, end, runtime;
-+struct timeval bench__start, bench__end, bench__runtime;
- static pthread_mutex_t thread_lock;
- static unsigned int threads_starting;
- static struct stats throughput_stats;
-@@ -103,8 +103,8 @@ static void toggle_done(int sig __maybe_unused,
- {
- 	/* inform all threads that we're done for the day */
- 	done =3D true;
--	gettimeofday(&end, NULL);
--	timersub(&end, &start, &runtime);
-+	gettimeofday(&bench__end, NULL);
-+	timersub(&bench__end, &bench__start, &bench__runtime);
- }
-=20
- static void print_summary(void)
-@@ -114,7 +114,7 @@ static void print_summary(void)
-=20
- 	printf("%sAveraged %ld operations/sec (+- %.2f%%), total secs =3D %d\n=
",
- 	       !silent ? "\n" : "", avg, rel_stddev_stats(stddev, avg),
--	       (int) runtime.tv_sec);
-+	       (int)bench__runtime.tv_sec);
- }
-=20
- int bench_futex_hash(int argc, const char **argv)
-@@ -161,7 +161,7 @@ int bench_futex_hash(int argc, const char **argv)
-=20
- 	threads_starting =3D nthreads;
- 	pthread_attr_init(&thread_attr);
--	gettimeofday(&start, NULL);
-+	gettimeofday(&bench__start, NULL);
- 	for (i =3D 0; i < nthreads; i++) {
- 		worker[i].tid =3D i;
- 		worker[i].futex =3D calloc(nfutexes, sizeof(*worker[i].futex));
-@@ -204,7 +204,7 @@ int bench_futex_hash(int argc, const char **argv)
- 	pthread_mutex_destroy(&thread_lock);
-=20
- 	for (i =3D 0; i < nthreads; i++) {
--		unsigned long t =3D worker[i].ops/runtime.tv_sec;
-+		unsigned long t =3D worker[i].ops / bench__runtime.tv_sec;
- 		update_stats(&throughput_stats, t);
- 		if (!silent) {
- 			if (nfutexes =3D=3D 1)
-diff --git a/tools/perf/bench/futex-lock-pi.c b/tools/perf/bench/futex-l=
ock-pi.c
-index d0cae8125423f..30d97121dc4fb 100644
---- a/tools/perf/bench/futex-lock-pi.c
-+++ b/tools/perf/bench/futex-lock-pi.c
-@@ -37,7 +37,6 @@ static bool silent =3D false, multi =3D false;
- static bool done =3D false, fshared =3D false;
- static unsigned int nthreads =3D 0;
- static int futex_flag =3D 0;
--struct timeval start, end, runtime;
- static pthread_mutex_t thread_lock;
- static unsigned int threads_starting;
- static struct stats throughput_stats;
-@@ -64,7 +63,7 @@ static void print_summary(void)
-=20
- 	printf("%sAveraged %ld operations/sec (+- %.2f%%), total secs =3D %d\n=
",
- 	       !silent ? "\n" : "", avg, rel_stddev_stats(stddev, avg),
--	       (int) runtime.tv_sec);
-+	       (int)bench__runtime.tv_sec);
- }
-=20
- static void toggle_done(int sig __maybe_unused,
-@@ -73,8 +72,8 @@ static void toggle_done(int sig __maybe_unused,
- {
- 	/* inform all threads that we're done for the day */
- 	done =3D true;
--	gettimeofday(&end, NULL);
--	timersub(&end, &start, &runtime);
-+	gettimeofday(&bench__end, NULL);
-+	timersub(&bench__end, &bench__start, &bench__runtime);
- }
-=20
- static void *workerfn(void *arg)
-@@ -185,7 +184,7 @@ int bench_futex_lock_pi(int argc, const char **argv)
-=20
- 	threads_starting =3D nthreads;
- 	pthread_attr_init(&thread_attr);
--	gettimeofday(&start, NULL);
-+	gettimeofday(&bench__start, NULL);
-=20
- 	create_threads(worker, thread_attr, cpu);
- 	pthread_attr_destroy(&thread_attr);
-@@ -211,7 +210,7 @@ int bench_futex_lock_pi(int argc, const char **argv)
- 	pthread_mutex_destroy(&thread_lock);
-=20
- 	for (i =3D 0; i < nthreads; i++) {
--		unsigned long t =3D worker[i].ops/runtime.tv_sec;
-+		unsigned long t =3D worker[i].ops / bench__runtime.tv_sec;
-=20
- 		update_stats(&throughput_stats, t);
- 		if (!silent)
---=20
-cgit 1.2.3-1.el7
-
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel=
/linux/linux-linaro-arm-5.4/perf-fixup-gcc10-04.patch b/meta-arm-autonomy=
/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/pe=
rf-fixup-gcc10-04.patch
deleted file mode 100644
index dae1222..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/=
linux-linaro-arm-5.4/perf-fixup-gcc10-04.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-libtraceevent: Fix build with binutils 2.35
-Upstream-Status: Backport https://git.kernel.org/pub/scm/linux/kernel/gi=
t/stable/linux-stable-rc.git/patch/tools/lib/traceevent/plugins/Makefile?=
id=3Dc2fd34d4311033120fa502aa8bd4723cdeee0103
-Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
-
-From c2fd34d4311033120fa502aa8bd4723cdeee0103 Mon Sep 17 00:00:00 2001
-From: Ben Hutchings <ben@decadent.org.uk>
-Date: Sat, 25 Jul 2020 02:06:23 +0100
-Subject: libtraceevent: Fix build with binutils 2.35
-
-commit 39efdd94e314336f4acbac4c07e0f37bdc3bef71 upstream.
-
-In binutils 2.35, 'nm -D' changed to show symbol versions along with
-symbol names, with the usual @@ separator.  When generating
-libtraceevent-dynamic-list we need just the names, so strip off the
-version suffix if present.
-
-Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
-Tested-by: Salvatore Bonaccorso <carnil@debian.org>
-Reviewed-by: Steven Rostedt <rostedt@goodmis.org>
-Cc: linux-trace-devel@vger.kernel.org
-Cc: stable@vger.kernel.org
-Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
-Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
----
- tools/lib/traceevent/plugins/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-(limited to 'tools/lib/traceevent/plugins/Makefile')
-
-diff --git a/tools/lib/traceevent/plugins/Makefile b/tools/lib/traceeven=
t/plugins/Makefile
-index f440989fa55e4..23c3535bcbd6b 100644
---- a/tools/lib/traceevent/plugins/Makefile
-+++ b/tools/lib/traceevent/plugins/Makefile
-@@ -196,7 +196,7 @@ define do_generate_dynamic_list_file
- 	xargs echo "U w W" | tr 'w ' 'W\n' | sort -u | xargs echo`;\
- 	if [ "$$symbol_type" =3D "U W" ];then				\
- 		(echo '{';                                              \
--		$(NM) -u -D $1 | awk 'NF>1 {print "\t"$$2";"}' | sort -u;\
-+		$(NM) -u -D $1 | awk 'NF>1 {sub("@.*", "", $$2); print "\t"$$2";"}' |=
 sort -u;\
- 		echo '};';                                              \
- 		) > $2;                                                 \
- 	else                                                            \
---=20
-cgit 1.2.3-1.el7
-
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel=
/linux/linux-linaro-arm-n1sdp.inc b/meta-arm-autonomy/dynamic-layers/meta=
-arm-bsp/recipes-kernel/linux/linux-linaro-arm-n1sdp.inc
deleted file mode 100644
index 7a2d49b..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/=
linux-linaro-arm-n1sdp.inc
+++ /dev/null
@@ -1,27 +0,0 @@
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/linux-linaro-arm-5.4:"
-
-SRC_URI_append =3D " \
-    file://0001-TMP-iommu-arm-smmu-v3-Ignore-IOPF-capabilities.patch \
-    file://0002-pci_quirk-add-acs-override-for-PCI-devices.patch \
-    file://0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch=
 \
-    file://0004-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch \
-    file://0005-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.pat=
ch \
-    file://enable-realtek-R8169.cfg \
-    file://scripts-dtc-remove-redundant-YYLOC.patch \
-    "
-
-# Referring to commit TAG N1SDP-2020.07.27
-SRCREV =3D "84baaae9e751c058717d9702438429257f077f03"
-
-# Use intree defconfig
-KBUILD_DEFCONFIG =3D "defconfig"
-
-# Since the intree defconfig in n1sdp kernel repository is not setting a=
ll the configs,
-# KCONFIG_MODE is set to "alldefconfig" to properly expand the defconfig=
.
-KCONFIG_MODE =3D "--alldefconfig"
-
-COMPATIBLE_MACHINE =3D "n1sdp"
-
-# Since we use the intree defconfig and the preempt-rt turns off some co=
nfigs
-# do_kernel_configcheck will display warnings. So, lets disable it.
-KCONF_AUDIT_LEVEL_pn-linux-linaro-arm-rt =3D "0"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel=
/linux/linux-linaro-arm-rt-5.4/0001-xen-use-handle_fasteoi_irq-to-handle-=
xen-dynamic-eve.patch b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/rec=
ipes-kernel/linux/linux-linaro-arm-rt-5.4/0001-xen-use-handle_fasteoi_irq=
-to-handle-xen-dynamic-eve.patch
deleted file mode 100644
index 39c159f..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/=
linux-linaro-arm-rt-5.4/0001-xen-use-handle_fasteoi_irq-to-handle-xen-dyn=
amic-eve.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From c2971c8a3f076ea8a522ce4fbb367d112d86c13a Mon Sep 17 00:00:00 2001
-From: Stefano Stabellini <sstabellini@kernel.org>
-Date: Mon, 27 Apr 2020 16:15:26 -0700
-Subject: [PATCH] xen: use handle_fasteoi_irq to handle xen dynamic event=
s
-
-When handling Xen events, we need to make sure the following sequence is
-followed:
-
-- mask event
-- handle event and clear event (the order does not matter)
-- unmask event
-
-It is not possible to implement this flow with handle_edge_irq, so
-switch back to handle_fasteoi_irq. Please note that Xen event irqs are
-ONESHOT. Also note that handle_fasteoi_irq was in-use before the
-following commit, that is partially reverted by this patch:
-
-7e186bdd0098 xen: do not clear and mask evtchns in __xen_evtchn_do_upcal=
l
-
-PIRQ handling is left unchanged.
-
-This patch fixes a domU hang observed when using LinuxRT as dom0 kernel.
-
-Link: https://lkml.org/lkml/2020/4/27/1287
-Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
-
-Upstream-Status: Inappropriate since the upstream solution diverges from=
 this patch
-Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
----
- drivers/xen/events/events_base.c | 13 +++----------
- 1 file changed, 3 insertions(+), 10 deletions(-)
-
-diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/event=
s_base.c
-index 6c8843968a52..1873a19b8b24 100644
---- a/drivers/xen/events/events_base.c
-+++ b/drivers/xen/events/events_base.c
-@@ -845,7 +845,7 @@ int bind_evtchn_to_irq(unsigned int evtchn)
- 			goto out;
-=20
- 		irq_set_chip_and_handler_name(irq, &xen_dynamic_chip,
--					      handle_edge_irq, "event");
-+					      handle_fasteoi_irq, "event");
-=20
- 		ret =3D xen_irq_info_evtchn_setup(irq, evtchn);
- 		if (ret < 0) {
-@@ -978,7 +978,7 @@ int bind_virq_to_irq(unsigned int virq, unsigned int=
 cpu, bool percpu)
- 						      handle_percpu_irq, "virq");
- 		else
- 			irq_set_chip_and_handler_name(irq, &xen_dynamic_chip,
--						      handle_edge_irq, "virq");
-+						      handle_fasteoi_irq, "virq");
-=20
- 		bind_virq.virq =3D virq;
- 		bind_virq.vcpu =3D xen_vcpu_nr(cpu);
-@@ -1387,12 +1387,6 @@ static void ack_dynirq(struct irq_data *data)
- 		clear_evtchn(evtchn);
- }
-=20
--static void mask_ack_dynirq(struct irq_data *data)
--{
--	disable_dynirq(data);
--	ack_dynirq(data);
--}
--
- static int retrigger_dynirq(struct irq_data *data)
- {
- 	unsigned int evtchn =3D evtchn_from_irq(data->irq);
-@@ -1595,8 +1589,7 @@ static struct irq_chip xen_dynamic_chip __read_mos=
tly =3D {
- 	.irq_mask		=3D disable_dynirq,
- 	.irq_unmask		=3D enable_dynirq,
-=20
--	.irq_ack		=3D ack_dynirq,
--	.irq_mask_ack		=3D mask_ack_dynirq,
-+	.irq_eoi		=3D ack_dynirq,
-=20
- 	.irq_set_affinity	=3D set_affinity_irq,
- 	.irq_retrigger		=3D retrigger_dynirq,
---=20
-2.17.1
-
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel=
/linux/linux-linaro-arm-rt_5.4.bb b/meta-arm-autonomy/dynamic-layers/meta=
-arm-bsp/recipes-kernel/linux/linux-linaro-arm-rt_5.4.bb
deleted file mode 100644
index fa3bb73..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/=
linux-linaro-arm-rt_5.4.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-# This recipe provides the kernel with PREEMPT_RT patches and is based o=
n
-# linux-linaro-arm_5.4.bb. Set PREFERRED_PROVIDER_virtual/kernel to
-# linux-linaro-arm-rt to enable it as the default kernel.
-require linux-linaro-arm_5.4.bb
-
-
-#
-# Include preempt-rt patches
-#
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}-5.4:"
-SRC_URI_append =3D " \
-    https://cdn.kernel.org/pub/linux/kernel/projects/rt/5.4/older/patch-=
5.4.3-rt1.patch.gz;name=3Drt-patch \
-    file://0001-xen-use-handle_fasteoi_irq-to-handle-xen-dynamic-eve.pat=
ch \
-    "
-SRC_URI[rt-patch.sha256sum] =3D "6b92ba32c7ce30919c9b66e49e5f1dce58e1f8b=
d92fef91e548d6f2d434a2b39"
-
-LINUX_KERNEL_TYPE =3D "preempt-rt"
-
-KERNEL_FEATURES +=3D "features/arm-autonomy/preempt-rt-extras.scc"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel=
/linux/linux-linaro-arm.inc b/meta-arm-autonomy/dynamic-layers/meta-arm-b=
sp/recipes-kernel/linux/linux-linaro-arm.inc
deleted file mode 100644
index 4859a66..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/=
linux-linaro-arm.inc
+++ /dev/null
@@ -1,29 +0,0 @@
-# Recipe for building linaro kernel
-
-SUMMARY =3D "Linux Kernel Upstream, supported by Arm/Linaro"
-SECTION =3D "kernel"
-LICENSE =3D "GPLv2"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b8=
814"
-
-inherit kernel
-inherit kernel-yocto
-
-# Require linux-yocto.inc in order to have separate build dirs when buil=
ding
-# LINUX_KERNEL_TYPE as 'standard' and 'preempt-rt'
-require recipes-kernel/linux/linux-yocto.inc
-
-SRC_URI =3D "git://git.linaro.org/landing-teams/working/arm/kernel-relea=
se.git;branch=3D${KBRANCH} \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3D${KMETA_BRANCH};destsuffix=3Dkernel-meta \
-           file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurs=
es-location.patch"
-
-DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '',=
 d)}"
-DEPENDS +=3D "openssl-native util-linux-native"
-
-LINUX_VERSION ?=3D "${PV}"
-S =3D "${WORKDIR}/git"
-
-# Add machine-specific settings
-MACHINE_KERNEL_REQUIRE ?=3D ""
-MACHINE_KERNEL_REQUIRE_n1sdp =3D "linux-linaro-arm-n1sdp.inc"
-
-require ${MACHINE_KERNEL_REQUIRE}
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel=
/linux/linux-linaro-arm_5.4.bb b/meta-arm-autonomy/dynamic-layers/meta-ar=
m-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
deleted file mode 100644
index 8e880ed..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/=
linux-linaro-arm_5.4.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SRCREV ?=3D "84baaae9e751c058717d9702438429257f077f03"
-SRCREV_meta ?=3D "e32057eca987b7abbe3eb47ba36f06af8711278a"
-
-# KBRANCH is set to n1sdp by default as there is no master or 5.4 branch=
 on the repository
-KBRANCH ?=3D "n1sdp"
-KMETA_BRANCH ?=3D "yocto-5.4"
-
-# Apply following patches
-SRC_URI_append =3D " \
-    file://fix-bfd-link.patch \
-    file://perf-fixup-gcc10-01.patch \
-    file://perf-fixup-gcc10-02.patch \
-    file://perf-fixup-gcc10-03.patch \
-    file://perf-fixup-gcc10-04.patch \
-    "
-
-require linux-linaro-arm.inc
--=20
2.25.1

