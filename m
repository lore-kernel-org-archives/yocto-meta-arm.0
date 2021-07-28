Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.1996.1627459151579234239
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 28 Jul 2021 00:59:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugo.lhostis@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF8FF101E;
	Wed, 28 Jul 2021 00:59:05 -0700 (PDT)
Received: from e126543.arm.com (unknown [10.57.9.238])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD6A23F73D;
	Wed, 28 Jul 2021 00:59:04 -0700 (PDT)
From: "Hugo L'Hostis" <hugo.lhostis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/2] arm-bsp/fvp-baser-aemv8r64: Add support for runfvp
Date: Wed, 28 Jul 2021 08:58:54 +0100
Message-Id: <20210728075854.1210038-2-hugo.lhostis@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728075854.1210038-1-hugo.lhostis@arm.com>
References: <20210728075854.1210038-1-hugo.lhostis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This patch adds support for runfvp to fvp-base-r:
- Add necessary parameter to the fvp-baser-aemv8r64.conf
- Add fvp-base-r-aem bb file
- Add kas support

Issue-Id: SCM-2953
Signed-off-by: Hugo L'Hostis <hugo.lhostis@arm.com>
Change-Id: I252b445297f2d61a90e3cd8f0ec1816890cf733b
---
 kas/fvp-baser-aemv8r64-bsp.yml                |  6 ++
 .../conf/machine/fvp-baser-aemv8r64.conf      | 33 +++++++
 .../documentation/fvp-baser-aemv8r64.md       | 87 ++++++++++---------
 .../recipes-devtools/fvp/fvp-base-r-aem.bb    | 27 ++++++
 4 files changed, 113 insertions(+), 40 deletions(-)
 create mode 100644 meta-arm/recipes-devtools/fvp/fvp-base-r-aem.bb

diff --git a/kas/fvp-baser-aemv8r64-bsp.yml b/kas/fvp-baser-aemv8r64-bsp.=
yml
index bb1e473..47aae84 100644
--- a/kas/fvp-baser-aemv8r64-bsp.yml
+++ b/kas/fvp-baser-aemv8r64-bsp.yml
@@ -21,12 +21,18 @@ repos:
       meta:
       meta-poky:
=20
+env:
+  FVP_BASE_R_AEM_TARBALL_URI: ""
+  FVP_BASE_R_ARM_EULA_ACCEPT: "False"
+
 local_conf_header:
   base: |
     CONF_VERSION =3D "1"
     PACKAGE_CLASSES =3D "package_ipk"
     PACKAGECONFIG_remove_pn-qemu-system-native =3D "gtk+ sdl"
     EXTRA_IMAGE_FEATURES_append =3D " debug-tweaks"
+    IMAGE_CLASSES_append =3D " ${@oe.utils.ifelse(d.getVar('FVP_BASE_R_A=
EM_TARBALL_URI'), 'fvpboot', '')}"
+    LICENSE_FLAGS_WHITELIST_append =3D " ${@oe.utils.vartrue('FVP_BASE_R=
_ARM_EULA_ACCEPT', 'Arm-FVP-EULA', '', d)}"
=20
 target:
   - core-image-minimal
diff --git a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf b/meta-arm=
-bsp/conf/machine/fvp-baser-aemv8r64.conf
index b937286..29dd662 100644
--- a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
+++ b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
@@ -24,3 +24,36 @@ WKS_FILE ?=3D "fvp-base.wks"
 # initialise) and install the pre-generated keys.
 PACKAGECONFIG_remove_pn-openssh =3D "rng-tools"
 MACHINE_EXTRA_RRECOMMENDS +=3D "ssh-pregen-hostkeys"
+
+FVP_EXTRA_ARGS =3D "-a cluster0*=3D${DEPLOY_DIR_IMAGE}/linux-system.axf"
+FVP_PROVIDER ?=3D "fvp-base-r-aem-native"
+FVP_EXE ?=3D "FVP_BaseR_AEMv8R"
+FVP_CONSOLE ?=3D "terminal_0"
+
+# FVP parameters
+FVP_CONFIG[bp.virtioblockdevice.image_path] ?=3D "${DEPLOY_DIR_IMAGE}/${=
IMAGE_NAME}.rootfs.wic"
+FVP_CONFIG[bp.dram_metadata.init_value] ?=3D "0"
+FVP_CONFIG[bp.dram_metadata.is_enabled] ?=3D "true"
+FVP_CONFIG[bp.dram_size] ?=3D "8"
+FVP_CONFIG[bp.exclusive_monitor.monitor_access_level] ?=3D "1"
+FVP_CONFIG[bp.pl011_uart0.unbuffered_output] ?=3D "1"
+FVP_CONFIG[bp.pl011_uart0.untimed_fifos] ?=3D "true"
+FVP_CONFIG[bp.refcounter.non_arch_start_at_default] ?=3D "1"
+FVP_CONFIG[bp.smsc_91c111.enabled] ?=3D "0"
+FVP_CONFIG[bp.ve_sysregs.mmbSiteDefault] ?=3D "0"
+FVP_CONFIG[cache_state_modelled] ?=3D "0"
+FVP_CONFIG[cluster0.gicv3.cpuintf-mmap-access-level] ?=3D "2"
+FVP_CONFIG[cluster0.gicv3.SRE-enable-action-on-mmap] ?=3D "2"
+FVP_CONFIG[cluster0.gicv3.SRE-EL2-enable-RAO] ?=3D "1"
+FVP_CONFIG[cluster0.gicv3.extended-interrupt-range-support] ?=3D "1"
+FVP_CONFIG[cluster0.has_aarch64] ?=3D "1"
+FVP_CONFIG[cluster0.NUM_CORES] ?=3D "4"
+FVP_CONFIG[cluster0.stage12_tlb_size] ?=3D "512"
+FVP_CONFIG[gic_distributor.GICD_CTLR-DS-1-means-secure-only] ?=3D "1"
+FVP_CONFIG[gic_distributor.GITS_BASER0-type] ?=3D "1"
+FVP_CONFIG[gic_distributor.ITS-count] ?=3D "1"
+FVP_CONFIG[gic_distributor.ITS-hardware-collection-count] ?=3D "1"
+FVP_CONFIG[gic_distributor.has-two-security-states] ?=3D "0"
+FVP_CONFIG[pctl.startup] ?=3D "0.0.0.*"
+FVP_CONFIG[bp.virtio_net.enabled] ?=3D "1"
+FVP_CONFIG[bp.vis.rate_limit-enable] ?=3D "0"
\ No newline at end of file
diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-=
bsp/documentation/fvp-baser-aemv8r64.md
index 580e890..53fdca7 100644
--- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
+++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
@@ -50,6 +50,22 @@ Install the kas setup tool for bitbake based projects:
=20
 For more details on kas, see https://kas.readthedocs.io/.
=20
+To build the images for fvp-base machine, you also need to:
+
+ - download the ``FVP_Base_AEMv8R_11.15_14.tgz`` image AEM V8-R FVP Inst=
aller
+  (Linux) package from Arm's website:
+  https://silver.arm.com/download/download.tm?pv=3D4858045&p=3D4029857. =
You need
+   to have an account and be logged in to be able to download it
+ - set absolute path to the ``FVP_Base_AEMv8R_11.15_14.tgz`` downloaded
+   package in ``FVP_BASE_R_AEM_TARBALL_URI``
+ - accept EULA in ``FVP_BASE_R_ARM_EULA_ACCEPT``
+
+
+The variables should be set like so:
+
+    FVP_BASE_R_AEM_TARBALL_URI=3D"file:///absolute/path/to/FVP_Base_AEMv=
8R_11.15_14.tgz"
+    FVP_BASE_R_ARM_EULA_ACCEPT=3D"True"
+
 **Note:** The host machine should have at least 50 GBytes of free disk s=
pace
 for the next steps to work correctly.
=20
@@ -101,49 +117,40 @@ To clean up the tap0 interface on the host use the =
following commands:
     sudo ip link delete tap0
=20
 ### Run
-To Run the Fixed Virtual Platform simulation tool you must download "Arm=
v8-R
-AEM FVP" from Arm developer (This might require the user to register) fr=
om this
-address:
-https://developer.arm.com/tools-and-software/simulation-models/fixed-vir=
tual-platforms/arm-ecosystem-models
-and install it on your host PC.
-
-To run an image after the build is done:
-
-    export YOCTO_DEPLOY_IMGS_DIR=3D"~/fvp-baser-aemv8r64-bsp/build/tmp/d=
eploy/images/fvp-baser-aemv8r64/"
-    cd <path-to-AEMv8R_base_pkg>/models/Linux64_GCC-6.4/
-    ./FVP_BaseR_AEMv8R \
-        -C bp.dram_metadata.init_value=3D0 \
-        -C bp.dram_metadata.is_enabled=3Dtrue \
-        -C bp.dram_size=3D8 \
-        -C bp.exclusive_monitor.monitor_access_level=3D1 \
-        -C bp.pl011_uart0.unbuffered_output=3D1 \
-        -C bp.pl011_uart0.untimed_fifos=3Dtrue \
-        -C bp.refcounter.non_arch_start_at_default=3D1 \
-        -C bp.smsc_91c111.enabled=3D0 \
-        -C bp.ve_sysregs.mmbSiteDefault=3D0 \
-        -C cache_state_modelled=3Dtrue \
-        -C cluster0.gicv3.cpuintf-mmap-access-level=3D2 \
-        -C cluster0.gicv3.SRE-enable-action-on-mmap=3D2 \
-        -C cluster0.gicv3.SRE-EL2-enable-RAO=3D1 \
-        -C cluster0.gicv3.extended-interrupt-range-support=3D1 \
-        -C cluster0.has_aarch64=3D1 \
-        -C cluster0.NUM_CORES=3D4 \
-        -C cluster0.stage12_tlb_size=3D512 \
-        -C gic_distributor.GICD_CTLR-DS-1-means-secure-only=3D1 \
-        -C gic_distributor.GITS_BASER0-type=3D1 \
-        -C gic_distributor.ITS-count=3D1 \
-        -C gic_distributor.ITS-hardware-collection-count=3D1 \
-        -C gic_distributor.has-two-security-states=3D0 \
-        -C pctl.startup=3D0.0.0.* \
-        -C bp.virtio_net.enabled=3D1 \
-        -C cache_state_modelled=3D0 \
-        -C bp.vis.rate_limit-enable=3D0 \
-        -C bp.virtio_net.hostbridge.interfaceName=3Dtap0 \
-        -a cluster0*=3D${YOCTO_DEPLOY_IMGS_DIR}/linux-system.axf \
-        -C bp.virtioblockdevice.image_path=3D${YOCTO_DEPLOY_IMGS_DIR}/co=
re-image-minimal-fvp-baser-aemv8r64.wic
+To run an image after the build is done with the standard Linux kernel:
+
+    kas shell --keep-config-unchanged \
+       meta-arm/kas/fvp-baser-aemv8r64-bsp.yml \
+           --command "../meta-arm/scripts/runfvp \
+                --console \
+                -- \
+                    --parameter 'bp.smsc_91c111.enabled=3D1' \
+                    --parameter 'bp.hostbridge.interfaceName=3Dtap0'"
+
+To run an image after the build is done with the Real-Time Linux kernel
+(PREEMPT\_RT):
+
+    kas shell --keep-config-unchanged \
+       meta-arm/kas/fvp-baser-aemv8r64-rt-bsp.yml \
+           --command "../meta-arm/scripts/runfvp \
+                --console \
+                -- \
+                    --parameter 'bp.smsc_91c111.enabled=3D1' \
+                    --parameter 'bp.hostbridge.interfaceName=3Dtap0'"
=20
 **Note:** The terminal console login is `root` without password.
=20
+To finish the fvp emulation, you need to close the telnet session and st=
op the
+runfvp script:
+
+1. To close the telnet session:
+
+ - Escape to telnet console with ``ctrl+]``.
+ - Run ``quit`` to close the session.
+
+2. To stop the runfvp:
+
+ - Type ``ctrl+c`` and wait for kas process to finish.
=20
 Devices supported in the kernel
 -------------------------------
diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-r-aem.bb b/meta-arm/r=
ecipes-devtools/fvp/fvp-base-r-aem.bb
new file mode 100644
index 0000000..53b849a
--- /dev/null
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-r-aem.bb
@@ -0,0 +1,27 @@
+require fvp-common.inc
+
+SUMMARY =3D "Arm Fixed Virtual Platform - Armv8-R Base Architecture Enve=
lope Model FVP"
+HOMEPAGE =3D "https://developer.arm.com/tools-and-software/simulation-mo=
dels/fixed-virtual-platforms/arm-ecosystem-models"
+LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
+                    file://license_terms/third_party_licenses.txt;md5=3D=
3db0c4947b7e3405c40b943672d8de2f"
+
+# This FVP cannot be downloaded directly, so download the Armv8-R Base A=
EM FVP
+# yourself from the homepage and set FVP_BASE_R_AEM_TARBALL_URI appropri=
ately
+# (for example, file:///home/user/FVP_Base_AEMv8R_11.15_14.tgz).
+FVP_BASE_R_AEM_TARBALL_URI ?=3D ""
+FVP_BASE_R_ARM_EULA_ACCEPT ?=3D "False"
+PV =3D "11.15_14"
+
+SRC_URI =3D "${FVP_BASE_R_AEM_TARBALL_URI};subdir=3D${BP}"
+python() {
+    if not d.getVar("FVP_BASE_R_AEM_TARBALL_URI"):
+        raise bb.parse.SkipRecipe("FVP_BASE_R_AEM_TARBALL_URI not set")
+}
+
+do_install() {
+    mkdir --parents ${D}${FVPDIR} ${D}${bindir}
+
+    cp --archive --no-preserve=3Downership ${S}/AEMv8R_base_pkg//* ${D}$=
{FVPDIR}/
+
+    fvp_link_binaries
+}
--=20
2.25.1

