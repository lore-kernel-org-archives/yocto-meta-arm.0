Return-Path: <debbie.martin@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88026C4167B
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 09:50:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.46330.1699005011768035582
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 03 Nov 2023 02:50:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: debbie.martin@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC9202F4;
	Fri,  3 Nov 2023 02:50:53 -0700 (PDT)
Received: from e127725.arm.com (unknown [10.57.2.89])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98E623F64C;
	Fri,  3 Nov 2023 02:50:09 -0700 (PDT)
From: Debbie Martin <Debbie.Martin@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Diego Sueiro <diego.sueiro@arm.com>,
	Peter Hoyes <Peter.Hoyes@arm.com>,
	Qi Feng <qi.feng@arm.com>,
	Robbie Cao <robbie.cao@arm.com>,
	Vineeth Raveendran <vineeth.raveendran@arm.com>
Subject: [PATCH 2/5] arm-systemready: Introduce the Arm SystemReady layer
Date: Fri,  3 Nov 2023 09:49:36 +0000
Message-Id: <20231103094939.1290558-2-Debbie.Martin@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231103094939.1290558-1-Debbie.Martin@arm.com>
References: <20231103094939.1290558-1-Debbie.Martin@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 03 Nov 2023 09:50:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5199

Add the meta-arm-systemready layer. This provides the infrastructure to
load and run the Arm SystemReady IR ACS v2.0.0 prebuilt image and
analyze the results.

The recipes included are as follows:
1. arm-systemready-firmware: Enables the ARM_SYSTEMREADY_FIRMWARE machine
   conf variable to be used to specify which firmware packages to deploy.
2. arm-systemready-ir-acs: Runs the Arm SystemReady IR ACS tests from
   the pre-built images and checks the results adhere to the specificatio=
n.
3. arm-systemready-linux-distros-[debian|opensuse]: Install the distro of
   choice from CD/DVD image to target disk image.

Signed-off-by: Debbie Martin <Debbie.Martin@arm.com>
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Signed-off-by: Qi Feng <qi.feng@arm.com>
Signed-off-by: Robbie Cao <robbie.cao@arm.com>
Signed-off-by: Tom=C3=A1s Gonz=C3=A1lez <tomasagustin.gonzalezorlando@arm=
.com
Signed-off-by: Vineeth Raveendran <vineeth.raveendran@arm.com>
---
 .../classes/arm-systemready-acs.bbclass       | 161 ++++++++++++++++++
 .../classes/extra_imagedepends_only.bbclass   |  25 +++
 meta-arm-systemready/conf/layer.conf          |  15 ++
 .../runtime/cases/arm_systemready_ir_acs.py   |  37 ++++
 .../arm-systemready-firmware.bb               |  14 ++
 .../python3-construct-native_2.10.68.bb       |  13 ++
 .../arm-systemready-ir-acs.bb                 |  61 +++++++
 .../arm-systemready-scripts-native.bb         |  31 ++++
 ...-Return-non-zero-exit-code-on-failur.patch |  37 ++++
 ...-sr-results-Device-tree-improvements.patch |  77 +++++++++
 .../edk2-test-parser-native.bb                |  26 +++
 .../arm-systemready-linux-distros-debian.bb   |  41 +++++
 .../arm-systemready-linux-distros-opensuse.bb |  69 ++++++++
 .../arm-systemready-linux-distros.inc         |  50 ++++++
 14 files changed, 657 insertions(+)
 create mode 100644 meta-arm-systemready/classes/arm-systemready-acs.bbcl=
ass
 create mode 100644 meta-arm-systemready/classes/extra_imagedepends_only.=
bbclass
 create mode 100644 meta-arm-systemready/conf/layer.conf
 create mode 100644 meta-arm-systemready/lib/oeqa/runtime/cases/arm_syste=
mready_ir_acs.py
 create mode 100644 meta-arm-systemready/recipes-bsp/arm-systemready/arm-=
systemready-firmware.bb
 create mode 100644 meta-arm-systemready/recipes-devtools/python/python3-=
construct-native_2.10.68.bb
 create mode 100644 meta-arm-systemready/recipes-test/arm-systemready-acs=
/arm-systemready-ir-acs.bb
 create mode 100644 meta-arm-systemready/recipes-test/arm-systemready-acs=
/arm-systemready-scripts-native.bb
 create mode 100644 meta-arm-systemready/recipes-test/arm-systemready-acs=
/arm-systemready-scripts/0001-check-sr-results-Return-non-zero-exit-code-=
on-failur.patch
 create mode 100644 meta-arm-systemready/recipes-test/arm-systemready-acs=
/arm-systemready-scripts/0002-check-sr-results-Device-tree-improvements.p=
atch
 create mode 100644 meta-arm-systemready/recipes-test/arm-systemready-acs=
/edk2-test-parser-native.bb
 create mode 100644 meta-arm-systemready/recipes-test/arm-systemready-lin=
ux-distros/arm-systemready-linux-distros-debian.bb
 create mode 100644 meta-arm-systemready/recipes-test/arm-systemready-lin=
ux-distros/arm-systemready-linux-distros-opensuse.bb
 create mode 100644 meta-arm-systemready/recipes-test/arm-systemready-lin=
ux-distros/arm-systemready-linux-distros.inc

diff --git a/meta-arm-systemready/classes/arm-systemready-acs.bbclass b/m=
eta-arm-systemready/classes/arm-systemready-acs.bbclass
new file mode 100644
index 00000000..e9888023
--- /dev/null
+++ b/meta-arm-systemready/classes/arm-systemready-acs.bbclass
@@ -0,0 +1,161 @@
+# This class contains the common logic to deploy the SystemReady ACS pre=
-built
+# image and set up the testimage environment. It is to be inherited by r=
ecipes
+# which contains the URI to download the SystemReady ACS image.
+# This class also contains a testimage "postfunc" called acs_logs_handle=
 which
+# performs the following functions after the tests have completed:
+#   * Extract the acs_results directory from the Wic image to
+#     ${WORKDIR}/testimage
+#   * Create a symlink to the acs_results in ${TMPDIR}/log/oeqa for ease=
 of
+#     access
+#   * Run the test parser, format results, and check results routines
+
+INHIBIT_DEFAULT_DEPS =3D "1"
+COMPATIBLE_HOST =3D "aarch64-*"
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+inherit nopackages deploy rootfs-postcommands ${IMAGE_CLASSES} python3na=
tive
+
+do_configure[noexec] =3D "1"
+do_compile[noexec] =3D "1"
+do_install[noexec] =3D "1"
+do_testimage[depends] +=3D "mtools-native:do_populate_sysroot"
+
+# Deploy with this suffix so it is picked up in the machine configuratio=
n
+IMAGE_DEPLOY_SUFFIX ?=3D ".wic"
+
+# Post-process commands may write to IMGDEPLOYDIR
+IMGDEPLOYDIR =3D "${DEPLOYDIR}"
+# Write the test data in IMAGE_POSTPROCESS_COMMAND
+IMAGE_POSTPROCESS_COMMAND +=3D "write_image_test_data; "
+
+python do_deploy() {
+    deploydir =3D d.getVar('DEPLOYDIR')
+    suffix =3D d.getVar('IMAGE_DEPLOY_SUFFIX')
+    imgfile =3D os.path.join(d.getVar('WORKDIR'), d.getVar('IMAGE_FILENA=
ME'))
+    deployfile =3D os.path.join(deploydir, d.getVar('IMAGE_NAME') + suff=
ix)
+    linkfile =3D os.path.join(deploydir, d.getVar('IMAGE_LINK_NAME') + s=
uffix)
+
+    # Install the image file in the deploy directory
+    import shutil
+    shutil.copyfile(imgfile, deployfile)
+    if os.path.lexists(linkfile):
+        os.remove(manifest_link)
+    os.symlink(os.path.basename(deployfile), linkfile)
+
+    # Run the image post-process commands
+    from oe.utils import execute_pre_post_process
+    post_process_cmds =3D d.getVar("IMAGE_POSTPROCESS_COMMAND")
+    execute_pre_post_process(d, post_process_cmds)
+
+    # Copy the report.txt to DEPLOYDIR
+    # The machine-specific implementation can optionally put the report =
file in
+    # ${WORKDIR}/report.txt. If there is no such file present, use the t=
emplate.
+    workdir =3D d.getVar('WORKDIR')
+    report_file =3D os.path.join(workdir, "report.txt")
+    report_file_dest =3D os.path.join(deploydir, "report.txt")
+    if os.path.exists(report_file):
+        report_file_to_copy =3D report_file
+    else:
+        report_file_to_copy =3D os.path.join(workdir, "systemready-ir-te=
mplate",
+                                            "report.txt")
+    shutil.copyfile(report_file_to_copy, report_file_dest)
+
+    # Ensure an empty rootfs manifest exists (required by testimage)
+    fname =3D os.path.join(deploydir, d.getVar('IMAGE_LINK_NAME') + ".ma=
nifest")
+    open(fname, 'w').close()
+}
+addtask deploy after do_install before do_image_complete
+
+do_image_complete() {
+    true
+}
+addtask image_complete after do_deploy before do_build
+do_image_complete[depends] +=3D "arm-systemready-firmware:do_image_compl=
ete"
+
+ACS_LOG_NAME =3D "acs_results_${DATETIME}"
+ACS_LOG_NAME[vardepsexclude] +=3D "DATETIME"
+ACS_LOG_DIR =3D "${TEST_LOG_DIR}/${ACS_LOG_NAME}"
+ACS_LOG_LINK =3D "${TEST_LOG_DIR}/acs_results"
+TEST_LOG_DIR =3D "${WORKDIR}/testimage"
+RM_WORK_EXCLUDE_ITEMS +=3D "${@ os.path.basename(d.getVar('TEST_LOG_DIR'=
)) }"
+
+do_testimage[postfuncs] +=3D "acs_logs_handle"
+do_testimage[depends] +=3D "edk2-test-parser-native:do_populate_sysroot =
\
+                          arm-systemready-scripts-native:do_populate_sys=
root"
+
+# Process the logs
+python acs_logs_handle() {
+    import logging
+    from oeqa.utils import make_logger_bitbake_compatible
+    import shutil
+
+    deploy_dir_image =3D d.getVar('DEPLOY_DIR_IMAGE')
+    systemready_scripts_dir =3D os.path.join(d.getVar('STAGING_LIBDIR_NA=
TIVE'),
+                                           "systemready_scripts")
+    edk2_test_parser_dir =3D os.path.join(d.getVar('STAGING_LIBDIR_NATIV=
E'),
+                                        "edk2_test_parser")
+    deployfile =3D os.path.join(deploy_dir_image, d.getVar('IMAGE_LINK_N=
AME')
+                              + d.getVar('IMAGE_DEPLOY_SUFFIX'))
+
+    testimage_dir =3D d.getVar('TEST_LOG_DIR')
+    logdir =3D d.getVar('ACS_LOG_DIR')
+    loglink =3D d.getVar('ACS_LOG_LINK')
+
+    # Copy the report.txt file from DEPLOY_DIR_IMAGE
+    report_file =3D os.path.join(deploy_dir_image, "report.txt")
+    report_file_dest =3D os.path.join(testimage_dir, "report.txt")
+    shutil.copyfile(report_file, report_file_dest)
+
+    # Extract the log files from the Wic image to the testimage logs dir=
ectory
+    resultspath =3D deployfile + ':3/acs_results'
+    import subprocess
+    subprocess.run(['wic', 'cp', resultspath, logdir], check=3DTrue)
+
+    # Create a symlink to the acs_results directory
+    if os.path.lexists(loglink):
+        os.remove(loglink)
+    os.symlink(os.path.basename(logdir), loglink)
+
+    # Create a top-level symlink to the acs_results directory
+    top_logdir =3D os.path.join(get_testimage_json_result_dir(d), d.getV=
ar("PN"))
+    log_name =3D d.getVar('ACS_LOG_NAME')
+    top_link =3D os.path.join(top_logdir, log_name)
+    log_target =3D os.path.relpath(logdir, top_logdir)
+    os.symlink(log_target, top_link)
+
+    # Parse the logs and generate results file
+    logger =3D make_logger_bitbake_compatible(logging.getLogger("BitBake=
"))
+
+    sct_log =3D os.path.join(logdir, 'sct_results', 'Overall', 'Summary.=
ekl')
+    sct_seq =3D os.path.join(logdir, 'sct_results', 'Sequence', 'EBBR.se=
q')
+
+    parser_path =3D os.path.join(edk2_test_parser_dir, "parser.py")
+    # format-sr-results.py needs the output file to be called "result.md=
"
+    subprocess.run([parser_path, sct_log, sct_seq, "--md",
+                   os.path.join(logdir, "result.md")], check=3DTrue)
+
+    scripts_path =3D os.path.join(systemready_scripts_dir,
+                                "format-sr-results.py")
+    summary_path =3D os.path.join(testimage_dir, "summary.md")
+    subprocess.run([scripts_path, "--dir", testimage_dir, "--md", summar=
y_path],
+                   check=3DTrue)
+
+    # Symlink acs-console.log to default_log
+    subprocess.run(["ln", "-sf", os.path.join(testimage_dir, "default_lo=
g"),
+                    os.path.join(testimage_dir, "acs-console.log")], che=
ck=3DTrue)
+
+    # Run the check-sr-results.py systemready script to check the result=
s
+    check_sr_results_log_path =3D os.path.join(testimage_dir,
+                                             "check_sr_results.log")
+    with open(check_sr_results_log_path, "w") as f:
+        check_sr_results_path =3D os.path.join(systemready_scripts_dir,
+                                            "check-sr-results.py")
+        try:
+            subprocess.run([check_sr_results_path, "--dir", testimage_di=
r,
+                            "--print-meta", "--debug"],
+                           stdout=3Df, stderr=3Df, text=3DTrue, check=3D=
True)
+        except subprocess.CalledProcessError:
+            logger.error(f"ACS run failed the check SystemReady results.=
 See "
+                         f"{summary_path} and {check_sr_results_log_path=
} for "
+                         f"details of the error.")
+            raise bb.BBHandledException()
+}
diff --git a/meta-arm-systemready/classes/extra_imagedepends_only.bbclass=
 b/meta-arm-systemready/classes/extra_imagedepends_only.bbclass
new file mode 100644
index 00000000..bf06a9f4
--- /dev/null
+++ b/meta-arm-systemready/classes/extra_imagedepends_only.bbclass
@@ -0,0 +1,25 @@
+# This class is to be inherited by recipes interested in only deploying =
what is
+# listed in the EXTRA_IMAGEDEPENDS.
+# It is inheriting the image.bbclass to make sure that the
+# image_license.manifest is generated.
+
+IMAGE_FSTYPES =3D ""
+
+inherit image
+
+IMAGE_FEATURES =3D ""
+EXTRA_IMAGE_FEATURES =3D ""
+
+INHIBIT_DEFAULT_DEPS =3D "1"
+DEPENDS =3D ""
+RDEPENDS =3D ""
+RRECOMMENDS =3D ""
+
+deltask do_prepare_recipe_sysroot
+deltask do_flush_pseudodb
+deltask do_image_qa
+do_rootfs[depends] =3D ""
+do_rootfs[noexec] =3D "1"
+do_image[noexec] =3D "1"
+do_image_complete[noexec] =3D "1"
+do_build[depends] =3D ""
diff --git a/meta-arm-systemready/conf/layer.conf b/meta-arm-systemready/=
conf/layer.conf
new file mode 100644
index 00000000..27bb568e
--- /dev/null
+++ b/meta-arm-systemready/conf/layer.conf
@@ -0,0 +1,15 @@
+# We have a conf and classes directory, add to BBPATH
+BBPATH .=3D ":${LAYERDIR}"
+
+# We have recipes-* directories, add to BBFILES
+BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb \
+            ${LAYERDIR}/recipes-*/*/*.bbappend"
+
+BBFILE_COLLECTIONS +=3D "meta-arm-systemready"
+BBFILE_PATTERN_meta-arm-systemready =3D "^${LAYERDIR}/"
+
+LAYERSERIES_COMPAT_meta-arm-systemready =3D "nanbield"
+
+LAYERDEPENDS_meta-arm-systemready =3D "core"
+
+addpylib ${LAYERDIR}/lib oeqa
diff --git a/meta-arm-systemready/lib/oeqa/runtime/cases/arm_systemready_=
ir_acs.py b/meta-arm-systemready/lib/oeqa/runtime/cases/arm_systemready_i=
r_acs.py
new file mode 100644
index 00000000..518d1aa2
--- /dev/null
+++ b/meta-arm-systemready/lib/oeqa/runtime/cases/arm_systemready_ir_acs.=
py
@@ -0,0 +1,37 @@
+from oeqa.runtime.case import OERuntimeTestCase
+
+
+class SystemReadyACSTest(OERuntimeTestCase):
+    def setUp(self):
+        self.console =3D self.td.get('ARM_SYSTEMREADY_ACS_CONSOLE')
+        self.assertNotEqual(self.console, '',
+                            msg=3D'ARM_SYSTEMREADY_ACS_CONSOLE is not se=
t')
+
+    def test_acs(self):
+        """
+        The purpose of this test case is to detect any issues with the A=
CS
+        tests themselves. The intention is to fail only if there is an i=
ssue
+        running the tests, not if an ACS test fails
+        """
+        self.target.transition('on')
+        # The tests finish on a root shell
+        test_patterns =3D [r'([a-zA-Z0-9_ ]+): \[([a-zA-Z_ ]+)\]',
+                         'ACS run is completed'] # Signifies successful =
completion
+
+        while True:
+            match_id =3D self.target.expect(self.console, test_patterns,
+                                          timeout=3D10*60*60)
+            if match_id =3D=3D 0:
+                # A test group's result has been printed
+                matches =3D self.target.match(self.console)
+                group_name =3D matches[1].decode().strip()
+                status =3D matches[2].decode().strip()
+                self.logger.info(f'Test Group ({group_name}): {status}')
+            elif match_id =3D=3D 1:
+                break
+
+        # Workaround to ensure the model syncs the log files to disk
+        self.target.sendline(self.console, r'sync /mnt')
+        self.target.expect(self.console, r'root@generic-arm64:~#')
+
+        self.logger.info('Linux tests complete')
diff --git a/meta-arm-systemready/recipes-bsp/arm-systemready/arm-systemr=
eady-firmware.bb b/meta-arm-systemready/recipes-bsp/arm-systemready/arm-s=
ystemready-firmware.bb
new file mode 100644
index 00000000..54ffc859
--- /dev/null
+++ b/meta-arm-systemready/recipes-bsp/arm-systemready/arm-systemready-fi=
rmware.bb
@@ -0,0 +1,14 @@
+SUMMARY =3D "Arm SystemReady Firmware Image"
+DESCRIPTION =3D "This recipe ensures that all packages listed in \
+ARM_SYSTEMREADY_FIRMWARE variable (set at machine conf) are deployed."
+
+EXTRA_IMAGEDEPENDS =3D "${ARM_SYSTEMREADY_FIRMWARE}"
+
+inherit extra_imagedepends_only
+
+python() {
+    if not d.getVar("ARM_SYSTEMREADY_FIRMWARE"):
+        raise bb.parse.SkipRecipe("ARM_SYSTEMREADY_FIRMWARE needs to be =
set")
+}
+
+do_testimage[noexec] =3D "1"
diff --git a/meta-arm-systemready/recipes-devtools/python/python3-constru=
ct-native_2.10.68.bb b/meta-arm-systemready/recipes-devtools/python/pytho=
n3-construct-native_2.10.68.bb
new file mode 100644
index 00000000..5e39ae72
--- /dev/null
+++ b/meta-arm-systemready/recipes-devtools/python/python3-construct-nati=
ve_2.10.68.bb
@@ -0,0 +1,13 @@
+SUMMARY =3D "A powerful declarative symmetric parser/builder for binary =
data"
+HOMEPAGE =3D "https://github.com/construct/construct"
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D202b39559c1c79fe4715ce81e9e0a=
c02"
+
+PYPI_PACKAGE =3D "construct"
+
+SRC_URI[sha256sum] =3D "7b2a3fd8e5f597a5aa1d614c3bd516fa065db01704c72a1e=
faaeec6ef23d8b45"
+
+inherit pypi
+inherit setuptools3
+inherit native
diff --git a/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-sy=
stemready-ir-acs.bb b/meta-arm-systemready/recipes-test/arm-systemready-a=
cs/arm-systemready-ir-acs.bb
new file mode 100644
index 00000000..f9226c31
--- /dev/null
+++ b/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-systemrea=
dy-ir-acs.bb
@@ -0,0 +1,61 @@
+SUMMARY =3D "Arm SystemReady IR ACS"
+DESCRIPTION =3D "Arm SystemReady IR Architecture Compliance Suite prebui=
lt image"
+
+LICENSE =3D "AFL-2.1 & Apache-2.0 & BSD-2-Clause & BSD-2-Clause-Patent \
+           & BSD-3-Clause & BSD-4-Clause & bzip2-1.0.4 & bzip2-1.0.6 & C=
C-BY-SA-4.0 \
+           & curl & GPL-2.0-only & GPL-2.0-or-later & GPL-3.0-only \
+           & GPL-3.0-or-later & GPL-3.0-with-GCC-exception & ISC \
+           & LGPL-2.0-only & LGPL-2.0-or-later & LGPL-2.1-only \
+           & LGPL-2.1-or-later & LGPL-3.0-only & MIT & MPL-2.0 & PD & PS=
F-2.0 \
+           & Python-2.0 & Unicode-DFS-2016 & Unicode-TOU & Zlib"
+LIC_FILES_CHKSUM =3D "\
+file://${COMMON_LICENSE_DIR}/AFL-2.1;md5=3De40039b90e182a056bcd9ad3e47dd=
d71 \
+file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89aea4e17d99a7cacdbeed46a0=
096b10 \
+file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=3Dcb641bc04cda31daea161b1b=
c15da69f \
+file://${COMMON_LICENSE_DIR}/BSD-2-Clause-Patent;md5=3D0518d409dae93098c=
ca8dfa932f3ab1b \
+file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=3D550794465ba0ec5312d6919e=
203a55f9 \
+file://${COMMON_LICENSE_DIR}/BSD-4-Clause;md5=3D624d9e67e8ac41a78f6b6c2c=
55a83a2b \
+file://${COMMON_LICENSE_DIR}/bzip2-1.0.4;md5=3D452e1b423688222dcfc3cb946=
2c92902 \
+file://${COMMON_LICENSE_DIR}/bzip2-1.0.6;md5=3D841c5495611ae95b13e80fa4a=
0627333 \
+file://${COMMON_LICENSE_DIR}/CC-BY-SA-4.0;md5=3D4084714af41157e38872e798=
eb3fe1b1 \
+file://${COMMON_LICENSE_DIR}/curl;md5=3Df7adb1397db248527ffed14d947e445c=
 \
+file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=3D801f80980d171dd642561083=
3a22dbe6 \
+file://${COMMON_LICENSE_DIR}/GPL-2.0-or-later;md5=3Dfed54355545ffd980b81=
4dab4a3b312c \
+file://${COMMON_LICENSE_DIR}/GPL-3.0-only;md5=3Dc79ff39f19dfec6d293b95de=
a7b07891 \
+file://${COMMON_LICENSE_DIR}/GPL-3.0-or-later;md5=3D1c76c4cc354acaac30ed=
4d5eefea7245 \
+file://${COMMON_LICENSE_DIR}/GPL-3.0-with-GCC-exception;md5=3Daef5f35c92=
72f508be848cd99e0151df \
+file://${COMMON_LICENSE_DIR}/ISC;md5=3Df3b90e78ea0cffb20bf5cca7947a896d =
\
+file://${COMMON_LICENSE_DIR}/LGPL-2.0-only;md5=3D9427b8ccf5cf3df47c29110=
424c9641a \
+file://${COMMON_LICENSE_DIR}/LGPL-2.0-or-later;md5=3D6d2d9952d88b50a51a5=
c73dc431d06c7 \
+file://${COMMON_LICENSE_DIR}/LGPL-2.1-only;md5=3D1a6d268fd218675ffea8be5=
56788b780 \
+file://${COMMON_LICENSE_DIR}/LGPL-2.1-or-later;md5=3D2a4f4fd2128ea2f6504=
7ee63fbca9f68 \
+file://${COMMON_LICENSE_DIR}/LGPL-3.0-only;md5=3Dbfccfe952269fff2b407dd1=
1f2f3083b \
+file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506ecda2f7b4f302 =
\
+file://${COMMON_LICENSE_DIR}/MPL-2.0;md5=3D815ca599c9df247a0c7f619bab123=
dad \
+file://${COMMON_LICENSE_DIR}/PD;md5=3Db3597d12946881e13cb3b548d1173851 \
+file://${COMMON_LICENSE_DIR}/PSF-2.0;md5=3D76c1502273262a5ebefb50dfb20d7=
c4f \
+file://${COMMON_LICENSE_DIR}/Python-2.0;md5=3Da5c8025e305fb49e6d40576935=
8851f6 \
+file://${COMMON_LICENSE_DIR}/Unicode-DFS-2016;md5=3D907371994d651afe53e9=
8adc27824669 \
+file://${COMMON_LICENSE_DIR}/Unicode-TOU;md5=3D666362dc5dba74f477af0f44f=
b85bd22 \
+file://${COMMON_LICENSE_DIR}/Zlib;md5=3D87f239f408daca8a157858e192597633=
 \
+"
+IMAGE_CLASSES:remove =3D "license_image"
+
+COMPATIBLE_MACHINE =3D "fvp-*"
+
+TEST_SUITES =3D "arm_systemready_ir_acs"
+
+PV =3D "2.0.0"
+PV_DATE =3D "23.03"
+FULL_PV =3D "v${PV_DATE}_${PV}"
+ARM_SYSTEMREADY_IR_ACS_BRANCH ?=3D "main"
+IMAGE_FILENAME =3D "ir-acs-live-image-generic-arm64.wic"
+SRC_URI =3D " \
+    https://github.com/ARM-software/arm-systemready/raw/${ARM_SYSTEMREAD=
Y_IR_ACS_BRANCH}/IR/prebuilt_images/${FULL_PV}/${IMAGE_FILENAME}.xz;name=3D=
acs-img \
+    git://git.gitlab.arm.com/systemready/systemready-ir-template.git;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3Dsystemready-ir-template;name=3Dsr=
-ir-template \
+"
+SRC_URI[acs-img.sha256sum] =3D "ea52f84dab44bde97de3e2d2224d883acaae3572=
4dd8e2bdfb125de49040f9b3"
+# Revision pointing to v2023.04 tag
+SRCREV_sr-ir-template =3D "c714db178ddf72e5ae5017f15421095297d5bf0e"
+
+inherit arm-systemready-acs
diff --git a/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-sy=
stemready-scripts-native.bb b/meta-arm-systemready/recipes-test/arm-syste=
mready-acs/arm-systemready-scripts-native.bb
new file mode 100644
index 00000000..ccc87ed2
--- /dev/null
+++ b/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-systemrea=
dy-scripts-native.bb
@@ -0,0 +1,31 @@
+SUMMARY =3D "System Ready Scripts"
+DESCRIPTION =3D "A collection of scripts to help with SystemReady compli=
ance."
+HOMEPAGE =3D "https://gitlab.arm.com/systemready/systemready-scripts"
+
+inherit native
+
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D85b7d439a311c22626c2e3f05daf6=
28e"
+
+RDEPENDS:${PN} =3D "python3-packaging-native python3-pyyaml-native \
+python3-chardet-native python3-requests-native python3-construct-native =
\
+dtc-native python3-dtschema-wrapper-native"
+
+PV =3D "v2023.04"
+S =3D "${WORKDIR}/git"
+SRC_URI =3D "\
+        git://git.gitlab.arm.com/systemready/systemready-scripts.git;pro=
tocol=3Dhttps;nobranch=3D1 \
+        file://0001-check-sr-results-Return-non-zero-exit-code-on-failur=
.patch \
+        file://0002-check-sr-results-Device-tree-improvements.patch \
+"
+
+# The SRCREV is at the v2023.04 tag
+SRCREV  =3D "f8244ab8da09f9e6005ceff81ebb234f35a2a698"
+
+do_install() {
+    install -d ${D}/${libdir}/systemready_scripts
+    cp -r ${S}/* ${D}/${libdir}/systemready_scripts
+}
+
+do_configure[noexec] =3D "1"
+do_compile[noexec] =3D "1"
diff --git a/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-sy=
stemready-scripts/0001-check-sr-results-Return-non-zero-exit-code-on-fail=
ur.patch b/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-syst=
emready-scripts/0001-check-sr-results-Return-non-zero-exit-code-on-failur=
.patch
new file mode 100644
index 00000000..6a95881d
--- /dev/null
+++ b/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-systemrea=
dy-scripts/0001-check-sr-results-Return-non-zero-exit-code-on-failur.patc=
h
@@ -0,0 +1,37 @@
+From ad8f2826f6e2cefb630f7fc2c7c99857f224e109 Mon Sep 17 00:00:00 2001
+From: Debbie Martin <Debbie.Martin@arm.com>
+Date: Tue, 5 Sep 2023 21:37:46 +0100
+Subject: [PATCH] check-sr-results: Return non-zero exit code on failure
+
+Return a non-zero exit code if there are any warnings or errors found.
+
+Upstream-Status: Pending
+Signed-off-by: Debbie Martin <Debbie.Martin@arm.com>
+---
+ check-sr-results.py | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/check-sr-results.py b/check-sr-results.py
+index 12b89cd..48658f0 100755
+--- a/check-sr-results.py
++++ b/check-sr-results.py
+@@ -185,6 +185,9 @@ class Stats:
+     def inc_error(self):
+         self._inc('error')
+=20
++    def has_warnings_or_errors(self):
++        return self.data['warning'] or self.data['error']
++
+=20
+ # Download (possibly large) file from URL.
+ # We raise an exception in case of issue.
+@@ -1519,3 +1522,6 @@ if __name__ =3D=3D '__main__':
+     if args.print_meta:
+         print()
+         print_meta()
++
++    if stats.has_warnings_or_errors():
++        exit(1)
+--=20
+2.25.1
+
diff --git a/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-sy=
stemready-scripts/0002-check-sr-results-Device-tree-improvements.patch b/=
meta-arm-systemready/recipes-test/arm-systemready-acs/arm-systemready-scr=
ipts/0002-check-sr-results-Device-tree-improvements.patch
new file mode 100644
index 00000000..f76a03ad
--- /dev/null
+++ b/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-systemrea=
dy-scripts/0002-check-sr-results-Device-tree-improvements.patch
@@ -0,0 +1,77 @@
+From 53ceb2d4167b05374678b966031b3d52fc5080a2 Mon Sep 17 00:00:00 2001
+From: Debbie Martin <Debbie.Martin@arm.com>
+Date: Fri, 29 Sep 2023 15:22:17 +0100
+Subject: [PATCH] check-sr-results: Device tree improvements
+
+Make check-sr-results.py accept 'extra_compat' configuration for
+devicetree files, and pass these in the compat list given to
+dt-parser.py.
+
+Update dt-parser.py to parse the GCC version line in the dtb log.
+
+Upstream-Status: Pending
+Signed-off-by: Debbie Martin <Debbie.Martin@arm.com>
+---
+ check-sr-results.py | 12 ++++++++++--
+ dt-parser.py        |  8 ++++++++
+ 2 files changed, 18 insertions(+), 2 deletions(-)
+
+diff --git a/check-sr-results.py b/check-sr-results.py
+index 48658f0..a207a39 100755
+--- a/check-sr-results.py
++++ b/check-sr-results.py
+@@ -598,7 +598,7 @@ def need_regen(filename, deps, margin=3D0):
+ # We run dtc and dt-validate to produce the log when needed.
+ # We add markers to the log, which will be ignored by dt-parser.py.
+ # We return a Stats object.
+-def check_devicetree(filename):
++def check_devicetree(filename, extra_compat=3DNone):
+     logging.debug(f"Check Devicetree `{filename}'")
+     stats =3D Stats()
+     log =3D f"{filename}.log"
+@@ -644,6 +644,9 @@ def check_devicetree(filename):
+     # We use the compatible strings extracted from Linux bindings to fi=
lter out
+     # more false positive.
+     compat =3D get_compat()
++    if extra_compat:
++        with open(compat, "a") as compat_file:
++            compat_file.write("\n".join(extra_compat))
+     cp =3D run(f"{dt_parser} --compatibles '{compat}' '{log}'")
+
+     if cp.returncode:
+@@ -930,7 +933,12 @@ def check_file(conffile, filename):
+                 stats.add(check_uefi_capsule(filename))
+
+             if 'devicetree' in conffile:
+-                stats.add(check_devicetree(filename))
++                stats.add(
++                    check_devicetree(
++                        filename,
++                        extra_compat=3Dconffile.get("extra_compat")
++                    )
++                )
+
+             if 'uefi-sniff' in conffile:
+                 stats.add(check_uefi_sniff(filename))
+diff --git a/dt-parser.py b/dt-parser.py
+index 3eccd74..c1c0031 100755
+--- a/dt-parser.py
++++ b/dt-parser.py
+@@ -181,6 +181,14 @@ def parse(filename):
+                 }
+                 continue
+
++            # line [GCC <version>]
++            m =3D re.match(r'\[GCC [0-9\.]+\]', line)
++            if m:
++                logging.debug(
++                    f"line {i}: GCC version (`{line}')"
++                )
++                continue
++
+             # If we could not parse the line we arrive here and complai=
n.
+             logging.warning(f"Unparsed line {i}: `{line}'")
+
+--
+2.25.1
+
diff --git a/meta-arm-systemready/recipes-test/arm-systemready-acs/edk2-t=
est-parser-native.bb b/meta-arm-systemready/recipes-test/arm-systemready-=
acs/edk2-test-parser-native.bb
new file mode 100644
index 00000000..ad93c41e
--- /dev/null
+++ b/meta-arm-systemready/recipes-test/arm-systemready-acs/edk2-test-par=
ser-native.bb
@@ -0,0 +1,26 @@
+SUMMARY =3D "EDK2 Test Parser"
+DESCRIPTION =3D "EDK2 Test Parser for parsing the results of UEFI SCT te=
sts"
+HOMEPAGE =3D "https://gitlab.arm.com/systemready/edk2-test-parser"
+
+inherit native
+
+LICENSE =3D "BSD-2-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc0550be4b3b9c0223efd0eaa70dc9=
085"
+
+RDEPENDS:${PN} =3D "python3-packaging-native python3-pyyaml-native \
+                  python3-jsonschema-native"
+
+PV =3D "v2023.04"
+S =3D "${WORKDIR}/git"
+SRC_URI =3D "git://git.gitlab.arm.com/systemready/edk2-test-parser.git;p=
rotocol=3Dhttps;nobranch=3D1"
+
+# The SRCREV is at the v2023.04 tag
+SRCREV  =3D "e8cdb692592d2a152cb87cf4d9fbd7ba2ae8b405"
+
+do_install() {
+    install -d ${D}/${libdir}/edk2_test_parser
+    cp -r ${S}/* ${D}/${libdir}/edk2_test_parser
+}
+
+do_configure[noexec] =3D "1"
+do_compile[noexec] =3D "1"
diff --git a/meta-arm-systemready/recipes-test/arm-systemready-linux-dist=
ros/arm-systemready-linux-distros-debian.bb b/meta-arm-systemready/recipe=
s-test/arm-systemready-linux-distros/arm-systemready-linux-distros-debian=
.bb
new file mode 100644
index 00000000..04faa3a9
--- /dev/null
+++ b/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros-debian.bb
@@ -0,0 +1,41 @@
+require arm-systemready-linux-distros.inc
+
+LICENSE =3D "GPL-1.0-only & GPL-1.0-or-later & GPL-2.0-only & GPL-2.0-or=
-later \
+           & GPL-3.0-only & GPL-3.0-or-later & LGPL-2.0-only \
+           & LGPL-2.0-or-later & LGPL-2.1-only & LGPL-2.1-or-later \
+           & LGPL-3.0-only & LGPL-3.0-or-later & BSD-3-Clause & BSD-4-Cl=
ause \
+           & Artistic-1.0-Perl & Apache-1.0 & Apache-1.1 & Apache-2.0 & =
Zlib \
+           & Python-2.0 & Ruby & PHP-3.01 & W3C-20150513 & OpenSSL & Sle=
epycat"
+LIC_FILES_CHKSUM =3D "\
+file://${COMMON_LICENSE_DIR}/GPL-1.0-only;md5=3De9e36a9de734199567a4d769=
498f743d \
+file://${COMMON_LICENSE_DIR}/GPL-1.0-or-later;md5=3D30c0b8a5048cc2f4be5f=
f15ef0d8cf61 \
+file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=3D801f80980d171dd642561083=
3a22dbe6 \
+file://${COMMON_LICENSE_DIR}/GPL-2.0-or-later;md5=3Dfed54355545ffd980b81=
4dab4a3b312c \
+file://${COMMON_LICENSE_DIR}/GPL-3.0-only;md5=3Dc79ff39f19dfec6d293b95de=
a7b07891 \
+file://${COMMON_LICENSE_DIR}/GPL-3.0-or-later;md5=3D1c76c4cc354acaac30ed=
4d5eefea7245 \
+file://${COMMON_LICENSE_DIR}/LGPL-2.0-only;md5=3D9427b8ccf5cf3df47c29110=
424c9641a \
+file://${COMMON_LICENSE_DIR}/LGPL-2.0-or-later;md5=3D6d2d9952d88b50a51a5=
c73dc431d06c7 \
+file://${COMMON_LICENSE_DIR}/LGPL-2.1-only;md5=3D1a6d268fd218675ffea8be5=
56788b780 \
+file://${COMMON_LICENSE_DIR}/LGPL-2.1-or-later;md5=3D2a4f4fd2128ea2f6504=
7ee63fbca9f68 \
+file://${COMMON_LICENSE_DIR}/LGPL-3.0-only;md5=3Dbfccfe952269fff2b407dd1=
1f2f3083b \
+file://${COMMON_LICENSE_DIR}/LGPL-3.0-or-later;md5=3Dc51d3eef3be114124d1=
1349ca0d7e117 \
+file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=3D550794465ba0ec5312d6919e=
203a55f9 \
+file://${COMMON_LICENSE_DIR}/BSD-4-Clause;md5=3D624d9e67e8ac41a78f6b6c2c=
55a83a2b \
+file://${COMMON_LICENSE_DIR}/Artistic-1.0-Perl;md5=3D8feedd169dbd5738981=
843bd7d931f9f \
+file://${COMMON_LICENSE_DIR}/Apache-1.0;md5=3D9f7a9503b805de9158a2a31a2c=
ef4b70 \
+file://${COMMON_LICENSE_DIR}/Apache-1.1;md5=3D61cc638ff95ff4f38f243855bc=
ec4317 \
+file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89aea4e17d99a7cacdbeed46a0=
096b10 \
+file://${COMMON_LICENSE_DIR}/Zlib;md5=3D87f239f408daca8a157858e192597633=
 \
+file://${COMMON_LICENSE_DIR}/Python-2.0;md5=3Da5c8025e305fb49e6d40576935=
8851f6 \
+file://${COMMON_LICENSE_DIR}/Ruby;md5=3D105fc57d3f4d3122db32912f3e6107d0=
 \
+file://${COMMON_LICENSE_DIR}/PHP-3.01;md5=3D3363e286b5882ec667a6ebd86e0d=
9d91 \
+file://${COMMON_LICENSE_DIR}/W3C-20150513;md5=3D9ff23a699fca546a380855dd=
40d12d4f \
+file://${COMMON_LICENSE_DIR}/OpenSSL;md5=3D4eb1764f3e65fafa1a25057f9082f=
2ae \
+file://${COMMON_LICENSE_DIR}/Sleepycat;md5=3D1cbb64231c94198653282f3ccab=
88ffb \
+"
+
+PV =3D "11.7.0"
+# netinst, DVD-1
+ISO_TYPE =3D "netinst"
+SRC_URI =3D "https://cdimage.debian.org/mirror/cdimage/archive/${PV}/arm=
64/iso-cd/debian-${PV}-arm64-${ISO_TYPE}.iso;unpack=3D0;downloadfilename=3D=
${ISO_IMAGE_NAME}.iso"
+SRC_URI[sha256sum] =3D "174caba674fe3172938439257156b9cb8940bb5fd5ddf124=
256e81ec00ec460d"
diff --git a/meta-arm-systemready/recipes-test/arm-systemready-linux-dist=
ros/arm-systemready-linux-distros-opensuse.bb b/meta-arm-systemready/reci=
pes-test/arm-systemready-linux-distros/arm-systemready-linux-distros-open=
suse.bb
new file mode 100644
index 00000000..13e4355d
--- /dev/null
+++ b/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros-opensuse.bb
@@ -0,0 +1,69 @@
+require arm-systemready-linux-distros.inc
+
+LICENSE =3D "AGPL-3.0-only & Apache-2.0 & Artistic-1.0 & Artistic-2.0 \
+           & BSD-2-Clause-Patent & BSD-2-Clause & BSD-3-Clause & BSD-4-C=
lause \
+           & CC-BY-3.0 & CC-BY-4.0 & CC-BY-SA-1.0 & CC-BY-SA-3.0 \
+           & CC-BY-SA-4.0 & CC0-1.0 & CDDL-1.0 & GFDL-1.1-only \
+           & GFDL-1.2-only & GFDL-1.3-only & GFDL-1.3-or-later \
+           & GPL-1.0-or-later & GPL-2.0-only & GPL-2.0-or-later \
+           & GPL-3.0-only & GPL-3.0-or-later & HPND & ICU & IPA \
+           & ISC & LGPL-2.0-only & LGPL-2.0-or-later & LGPL-2.1-only \
+           & LGPL-2.1-or-later & LGPL-3.0-only & LGPL-3.0-or-later \
+           & LPPL-1.3c & MIT & MPL-1.1 & MPL-2.0 & OFL-1.1 & OLDAP-2.8 \
+           & OpenSSL & Python-2.0 & Vim & W3C"
+
+LIC_FILES_CHKSUM =3D "\
+file://${COMMON_LICENSE_DIR}/AGPL-3.0-only;md5=3D73f1eb20517c55bf9493b7d=
d6e480788 \
+file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89aea4e17d99a7cacdbeed46a0=
096b10 \
+file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=3Dcda03bbdc3c1951996392b87=
2397b798 \
+file://${COMMON_LICENSE_DIR}/Artistic-2.0;md5=3D8bbc66f0ba93cec26ef52611=
7e280266 \
+file://${COMMON_LICENSE_DIR}/BSD-2-Clause-Patent;md5=3D0518d409dae93098c=
ca8dfa932f3ab1b \
+file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=3Dcb641bc04cda31daea161b1b=
c15da69f \
+file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=3D550794465ba0ec5312d6919e=
203a55f9 \
+file://${COMMON_LICENSE_DIR}/BSD-4-Clause;md5=3D624d9e67e8ac41a78f6b6c2c=
55a83a2b \
+file://${COMMON_LICENSE_DIR}/CC-BY-3.0;md5=3Ddfa02b5755629022e267f10b9c0=
a2ab7 \
+file://${COMMON_LICENSE_DIR}/CC-BY-4.0;md5=3D9b33bbd06fb58995fb0e299cd38=
d1838 \
+file://${COMMON_LICENSE_DIR}/CC-BY-SA-1.0;md5=3D681ffad43a0addd90f1bebf4=
5675104e \
+file://${COMMON_LICENSE_DIR}/CC-BY-SA-3.0;md5=3D3248afbd148270ac7337a6f3=
e2558be5 \
+file://${COMMON_LICENSE_DIR}/CC-BY-SA-4.0;md5=3D4084714af41157e38872e798=
eb3fe1b1 \
+file://${COMMON_LICENSE_DIR}/CC0-1.0;md5=3D0ceb3372c9595f0a8067e55da801e=
4a1 \
+file://${COMMON_LICENSE_DIR}/CDDL-1.0;md5=3Dd63dcc9297f2efd6c18d1e560b80=
7bc6 \
+file://${COMMON_LICENSE_DIR}/GFDL-1.1-only;md5=3D03322744a1a73f36ebf29f9=
8cced39a4 \
+file://${COMMON_LICENSE_DIR}/GFDL-1.2-only;md5=3D9f58808219e9a42ff122830=
9d6f83dc6 \
+file://${COMMON_LICENSE_DIR}/GFDL-1.3-only;md5=3De0771ae6a62dc8a2e50b1d4=
50fea66b7 \
+file://${COMMON_LICENSE_DIR}/GFDL-1.3-or-later;md5=3De0771ae6a62dc8a2e50=
b1d450fea66b7 \
+file://${COMMON_LICENSE_DIR}/GPL-1.0-or-later;md5=3D30c0b8a5048cc2f4be5f=
f15ef0d8cf61 \
+file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=3D801f80980d171dd642561083=
3a22dbe6 \
+file://${COMMON_LICENSE_DIR}/GPL-2.0-or-later;md5=3Dfed54355545ffd980b81=
4dab4a3b312c \
+file://${COMMON_LICENSE_DIR}/GPL-3.0-only;md5=3Dc79ff39f19dfec6d293b95de=
a7b07891 \
+file://${COMMON_LICENSE_DIR}/GPL-3.0-or-later;md5=3D1c76c4cc354acaac30ed=
4d5eefea7245 \
+file://${COMMON_LICENSE_DIR}/HPND;md5=3Dfaa364b3e3c6db0f74cc0e704ddf6b9c=
 \
+file://${COMMON_LICENSE_DIR}/ICU;md5=3D4d85ad1f393add71dc66bcf78e3ee584 =
\
+file://${COMMON_LICENSE_DIR}/IPA;md5=3D17b18da2d8b2c43c598aa7583229ef1b =
\
+file://${COMMON_LICENSE_DIR}/ISC;md5=3Df3b90e78ea0cffb20bf5cca7947a896d =
\
+file://${COMMON_LICENSE_DIR}/LGPL-2.0-only;md5=3D9427b8ccf5cf3df47c29110=
424c9641a \
+file://${COMMON_LICENSE_DIR}/LGPL-2.0-or-later;md5=3D6d2d9952d88b50a51a5=
c73dc431d06c7 \
+file://${COMMON_LICENSE_DIR}/LGPL-2.1-only;md5=3D1a6d268fd218675ffea8be5=
56788b780 \
+file://${COMMON_LICENSE_DIR}/LGPL-2.1-or-later;md5=3D2a4f4fd2128ea2f6504=
7ee63fbca9f68 \
+file://${COMMON_LICENSE_DIR}/LGPL-3.0-only;md5=3Dbfccfe952269fff2b407dd1=
1f2f3083b \
+file://${COMMON_LICENSE_DIR}/LGPL-3.0-or-later;md5=3Dc51d3eef3be114124d1=
1349ca0d7e117 \
+file://${COMMON_LICENSE_DIR}/LPPL-1.3c;md5=3Dba2fa6fe055623756de43a298d8=
8a8b3 \
+file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506ecda2f7b4f302 =
\
+file://${COMMON_LICENSE_DIR}/MPL-1.1;md5=3D1d38e87ed8d522c49f04e1efe0fab=
3ab \
+file://${COMMON_LICENSE_DIR}/MPL-2.0;md5=3D815ca599c9df247a0c7f619bab123=
dad \
+file://${COMMON_LICENSE_DIR}/OFL-1.1;md5=3Dfac3a519e5e9eb96316656e0ca4f2=
b90 \
+file://${COMMON_LICENSE_DIR}/OLDAP-2.8;md5=3Dbb28ada4fbb5c3f52c233899b2e=
410a5 \
+file://${COMMON_LICENSE_DIR}/OpenSSL;md5=3D4eb1764f3e65fafa1a25057f9082f=
2ae \
+file://${COMMON_LICENSE_DIR}/Python-2.0;md5=3Da5c8025e305fb49e6d40576935=
8851f6 \
+file://${COMMON_LICENSE_DIR}/Vim;md5=3D676d28582e2dca824e7e309a9865eeb1 =
\
+file://${COMMON_LICENSE_DIR}/W3C;md5=3D4b1d0384b406508a63e51f7c69687700 =
\
+"
+
+ARM_SYSTEMREADY_LINUX_DISTRO_INSTALL_SIZE =3D "6144"
+
+PV =3D "15.4"
+# possible value of ISO_TYPE: NET, DVD
+ISO_TYPE =3D "DVD"
+BUILD_NO =3D "243.2"
+SRC_URI =3D "https://download.opensuse.org/distribution/leap/${PV}/iso/o=
penSUSE-Leap-${PV}-${ISO_TYPE}-aarch64-Build${BUILD_NO}-Media.iso;unpack=3D=
0;downloadfilename=3D${ISO_IMAGE_NAME}.iso"
+SRC_URI[sha256sum] =3D "d87f79b2b723f9baaeedd9e2be0365c04081e51a4f7f7f08=
c7ab3eee0c3e0fae"
diff --git a/meta-arm-systemready/recipes-test/arm-systemready-linux-dist=
ros/arm-systemready-linux-distros.inc b/meta-arm-systemready/recipes-test=
/arm-systemready-linux-distros/arm-systemready-linux-distros.inc
new file mode 100644
index 00000000..e247a427
--- /dev/null
+++ b/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros.inc
@@ -0,0 +1,50 @@
+SUMMARY =3D "Arm SystemReady Linux distros installation"
+DESCRIPTION =3D "Arm SystemReady Linux distro CD/DVD images and installa=
tion \
+               target disk image"
+
+IMAGE_CLASSES:remove =3D "license_image testimage"
+
+INHIBIT_DEFAULT_DEPS =3D "1"
+COMPATIBLE_HOST =3D "aarch64-*"
+PACKAGE_ARCH =3D "${TARGET_ARCH}"
+
+inherit nopackages deploy rootfs-postcommands ${IMAGE_CLASSES}
+
+do_configure[noexec] =3D "1"
+do_compile[noexec] =3D "1"
+
+ISO_IMAGE_NAME =3D "${PN}-${PV}"
+IMAGE_LINK_NAME =3D "${PN}-${PV}-${MACHINE}"
+
+ARM_SYSTEMREADY_LINUX_DISTRO_ISO_IMAGE =3D \
+    "${DEPLOY_DIR_IMAGE}/${ISO_IMAGE_NAME}.iso"
+# Size of installation disk in MB
+ARM_SYSTEMREADY_LINUX_DISTRO_INSTALL_SIZE ?=3D "4096"
+
+do_image() {
+    dd if=3D/dev/zero of=3D${WORKDIR}/${IMAGE_LINK_NAME}.wic \
+        bs=3D1M count=3D${ARM_SYSTEMREADY_LINUX_DISTRO_INSTALL_SIZE} sta=
tus=3Dnone
+}
+
+do_deploy() {
+    # Deploy the iso and installation target disk image to the deploy fo=
lder
+    install -m 644 ${WORKDIR}/${ISO_IMAGE_NAME}.iso ${DEPLOYDIR}
+    install -m 644 ${WORKDIR}/${IMAGE_LINK_NAME}.wic ${DEPLOYDIR}
+}
+
+addtask image before do_install
+addtask deploy after do_install before do_image_complete
+
+# Post-process commands may write to IMGDEPLOYDIR
+IMGDEPLOYDIR =3D "${DEPLOY_DIR_IMAGE}"
+
+python do_image_complete() {
+    # Run the image post-process commands
+    from oe.utils import execute_pre_post_process
+    post_process_cmds =3D d.getVar("IMAGE_POSTPROCESS_COMMAND")
+    execute_pre_post_process(d, post_process_cmds)
+}
+do_image_complete[nostamp] =3D "1"
+addtask image_complete after do_deploy before do_build
+
+do_install[depends] +=3D "arm-systemready-firmware:do_image_complete"
--=20
2.25.1


