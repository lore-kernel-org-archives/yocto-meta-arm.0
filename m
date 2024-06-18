Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE6A8C2BA18
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 13:43:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.86521.1718718183806248750
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 Jun 2024 06:43:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3355DA7
	for <meta-arm@lists.yoctoproject.org>; Tue, 18 Jun 2024 06:43:27 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E3C123F64C
	for <meta-arm@lists.yoctoproject.org>; Tue, 18 Jun 2024 06:43:02 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] Docs: add ci/kas, quick start, and release information
Date: Tue, 18 Jun 2024 09:43:01 -0400
Message-Id: <20240618134301.98815-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 18 Jun 2024 13:43:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5817

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 README.md                                     |  34 ++++--
 SECURITY.md                                   |  17 ++-
 .../continuous-integration-and-kas.md         |  67 +++++++++++
 documentation/quick-start.md                  | 105 ++++++++++++++++++
 documentation/releases.md                     |  43 +++++++
 5 files changed, 253 insertions(+), 13 deletions(-)
 create mode 100644 documentation/continuous-integration-and-kas.md
 create mode 100644 documentation/quick-start.md
 create mode 100644 documentation/releases.md

diff --git a/README.md b/README.md
index 0518c4efa8f9..798815270448 100644
--- a/README.md
+++ b/README.md
@@ -19,19 +19,23 @@ Other Directories
=20
 * ci
=20
-  This directory contains gitlab continuous integration configuration fi=
les (KAS yaml files) as well as scripts needed for this
+  This directory contains gitlab continuous integration configuration fi=
les (KAS yaml files) as well as scripts needed for this.
+
+* documentation
+
+  This directory contains information on the files in this repository, b=
uilding, and other relevant documents.
=20
 * kas
=20
-  This directory contains KAS yaml files to describe builds for systems =
not used in CI
+  This directory contains KAS yaml files to describe builds for systems =
not used in CI.
=20
 * scripts
=20
-  This directory contains scripts used in running the CI tests
+  This directory contains scripts used in running the CI tests.
=20
 Mailing List
 ------------
-To interact with the meta-arm developer community, please email the meta=
-arm mailing list at meta-arm@lists.yoctoproject.org
+To interact with the meta-arm developer community, please email the meta=
-arm mailing list at <meta-arm@lists.yoctoproject.org>.
 Currently, it is configured to only allow emails to members from those s=
ubscribed.
 To subscribe to the meta-arm mailing list, please go to
 https://lists.yoctoproject.org/g/meta-arm
@@ -42,7 +46,7 @@ Currently, we only accept patches from the meta-arm mai=
ling list.  For general
 information on how to submit a patch, please read
 https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
=20
-E-mail meta-arm@lists.yoctoproject.org with patches created using this p=
rocess. You can configure git-send-email to automatically use this addres=
s for the meta-arm repository with the following git command:
+E-mail <meta-arm@lists.yoctoproject.org> with patches created using this=
 process. You can configure git-send-email to automatically use this addr=
ess for the meta-arm repository with the following git command:
=20
 `$ git config --local --add sendemail.to meta-arm@lists.yoctoproject.org=
`
=20
@@ -55,6 +59,12 @@ The component being changed in the shortlog should be =
prefixed with the layer na
=20
 >  arm-toolchain/gcc: enable foobar v2
=20
+All contributions are under the [MIT License](/COPYING.MIT).
+
+For a quick start guide on how to build and use meta-arm, go to [quick-s=
tart.md](/documentation/quick-start.md).
+
+For information on the continuous integration done on meta-arm and how t=
o use it, go to [continuous-integration-and-kas.md](/documentation/contin=
uous-integration-and-kas.md).
+
 Backporting
 --------------
 Backporting patches to older releases may be done upon request, but only=
 after a version of the patch has been accepted into the master branch.  =
This is done by adding the branch name to email subject line.  This shoul=
d be between the square brackets (e.g., "[" and "]"), and before or after=
 the "PATCH".  For example,
@@ -66,15 +76,21 @@ https://www.kernel.org/doc/html/latest/process/submit=
ting-patches.html#submittin
 Releases and Release Schedule
 --------------
 We follow the Yocto Project release methodology, schedule, and stable/LT=
S support timelines.  For more information on these, please reference:
-https://docs.yoctoproject.org/ref-manual/release-process.html
-https://wiki.yoctoproject.org/wiki/Releases
-https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS
+* https://docs.yoctoproject.org/ref-manual/release-process.html
+* https://wiki.yoctoproject.org/wiki/Releases
+* https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS
+
+For more in-depth information on the meta-arm release and branch methodo=
logy, go to </documentation/releases.md>.
=20
 Reporting bugs
 --------------
-E-mail meta-arm@lists.yoctoproject.org with the error encountered and th=
e steps
+E-mail <meta-arm@lists.yoctoproject.org> with the error encountered and =
the steps
 to reproduce the issue.
=20
+Security and Reporting Security Issues
+--------------
+For information on the security of meta-arm and how to report issues, pl=
ease consult [SECURITY.md](/SECURITY.md).
+
 Maintainer(s)
 -------------
 * Jon Mason <jon.mason@arm.com>
diff --git a/SECURITY.md b/SECURITY.md
index 0fa6cbcd3d15..403d62f53b81 100644
--- a/SECURITY.md
+++ b/SECURITY.md
@@ -18,7 +18,7 @@ number), please contact the meta-arm mailing list at
 meta-arm@lists.yoctoproject.org and arm-security@arm.com.
=20
 If you are dealing with a not-yet released or urgent issue, please send =
a mail
-to the maintainers (see README.md) and arm-security@arm.com, including a=
s much
+to the maintainers \(see [README.md](/README.md)\) and arm-security@arm.=
com, including as much
 detail as possible.  Encrypted emails using PGP are welcome.
=20
 For more information, please visit https://developer.arm.com/support/arm=
-security-updates/report-security-vulnerabilities.
@@ -27,11 +27,20 @@ For more information, please visit https://developer.=
arm.com/support/arm-securit
 ## Branches maintained with security fixes
=20
 meta-arm follows the Yocto release model, so see
-[https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS Stable releas=
e and
-LTS] for detailed info regarding the policies and maintenance of stable
+[Stable release and LTS](https://wiki.yoctoproject.org/wiki/Stable_Relea=
se_and_LTS)
+for detailed info regarding the policies and maintenance of stable
 branches.
=20
-The [https://wiki.yoctoproject.org/wiki/Releases Release page] contains =
a list of all
+The [Release page](https://wiki.yoctoproject.org/wiki/Releases) contains=
 a list of all
 releases of the Yocto Project. Versions in grey are no longer actively m=
aintained with
 security patches, but well-tested patches may still be accepted for them=
 for
 significant issues.
+
+
+# Disclaimer
+
+Arm reference solutions are Arm public example software projects that tr=
ack and
+pull upstream components, incorporating their respective security fixes
+published over time. Arm partners are responsible for ensuring that the
+components they use contain all the required security fixes, if and when=
 they
+deploy a product derived from Arm reference solutions.
diff --git a/documentation/continuous-integration-and-kas.md b/documentat=
ion/continuous-integration-and-kas.md
new file mode 100644
index 000000000000..2eb54cf04461
--- /dev/null
+++ b/documentation/continuous-integration-and-kas.md
@@ -0,0 +1,67 @@
+# **CI for Yocto Project and meta-arm**
+# **CI for Yocto Project**
+The Yocto Project has an autobuilder that performs nightly builds and im=
age tests on all of the defined QEMU machines, including qemuarm and qemu=
arm64  Also, it currently runs builds on the hardware reference platforms=
 including genericarm64 and meta-arm mahines fvp-base and sbsa-ref.  More=
 information on the autobuilder can be found at=C2=A0<https://autobuilder=
.yoctoproject.org/>.
+
+More information on the image tests can be found at=C2=A0<https://wiki.y=
octoproject.org/wiki/Image_tests>.
+
+The Yocto Project also has the ability to have individual package tests,=
 ptests.=C2=A0 For more information on those, go to=C2=A0<https://wiki.yo=
ctoproject.org/wiki/Ptest>.
+# **CI for meta-arm**
+meta-arm is using the Gitlab CI infrastructure.=C2=A0 This is currently =
being done internal to Arm, but an external version can be seen at <https=
://gitlab.com/jonmason00/meta-arm/-/pipelines>.
+
+This CI is constantly being expanded to provide increased coverage of th=
e software and hardware supported in meta-arm.  All platforms are require=
d to add a kas file and `.gitlab-ci.yml` entry as part of the initial pat=
ch series.  More information on kas can be found at <https://github.com/s=
iemens/kas>.
+
+To this end, it would be wise to run kas locally to verify everything wo=
rks prior to pushing to the CI build system.
+## **Running kas locally**
+### **Install kas**
+kas can be installed with pip, for example:
+```
+$ pip3 install --user kas
+```
+
+See <https://kas.readthedocs.io/en/latest/userguide/getting-started.html=
> for information on the dependencies and more.
+
+This assumes that the kas path ($HOME/.local/bin) is in $PATH.  If not, =
the user will need to manually add this or the kas command will not be fo=
und.
+
+### **Run kas locally**
+```
+$ cd ~/meta-arm/
+$ kas build kas/juno.yml
+```
+
+By default kas will create a build directory under meta-arm to contain t=
he checked out layers, build directory, and downloads. =C2=A0You can chan=
ge this by setting environment variables.  DL\_DIR and SSTATE\_DIR are re=
spected so these can point at existing directories, and setting KAS\_WORK=
\_DIR to the directory where repositories are already cloned will save ha=
ving to re-fetch.  This can look something like:
+```
+$ SSTATE_DIR=3D/builds/persist/sstate DL_DIR=3D/builds/persist/downloads=
 kas build ci/qemuarm64.yml:ci/testimage.yml
+```
+
+See the [quick start guide](/documentation/quick-start.md) for more info=
rmation on how to set this up.
+
+## **Locked Revisions in CI with lockfiles**
+The CI in meta-arm will generate a kas "lock file" when it starts to ens=
ure that all of the builds checkout the same revision of the various diff=
erent layers that are used. If this isn't done then there's a chance that=
 a layer will be modified upstream during the CI, which results in some b=
uilds failing and some builds passing.
+
+This lock file is saved as an artefact of the update-repos job by the CI=
, and only generated if it doesn't already exist in the repository.  This=
 can be used to force specific revisions of layers to be used instead of =
HEAD, which can be useful if upstream changes are causing problems in dev=
elopment.
+
+The lockfile.yml can be downloaded manually, but there's a script in met=
a-arm to fetch the lock file for the latest successful build of the speci=
fied branch:
+
+```
+$ ./ci/download-lockfile.py --help
+usage: download-lockfile.py [-h] server project refspec
+
+positional arguments:
+  server      GitLab server name
+  project     meta-arm project name
+  refspec     Branch/commit
+
+$ ./ci/download-lockfile.py https://gitlab.com/jonmason00/meta-arm maste=
r
+Fetched lockfile.yml
+Commit this lockfile.yml to the top-level of the meta-arm repository and=
 the CI will use it automatically.
+```
+# **Relevant Links for kas, CI, and testing**
+<https://github.com/siemens/kas.git>
+
+<https://wiki.yoctoproject.org/wiki/Oe-selftest>
+
+<https://wiki.yoctoproject.org/wiki/Image_tests>
+
+<https://wiki.yoctoproject.org/wiki/Ptest>
+
+<https://wiki.yoctoproject.org/wiki/BSP_Test_Plan>
diff --git a/documentation/quick-start.md b/documentation/quick-start.md
new file mode 100644
index 000000000000..2ce5efc857fa
--- /dev/null
+++ b/documentation/quick-start.md
@@ -0,0 +1,105 @@
+# **Yocto Project quick start for Arm system software developers**
+If you want to read the The Yocto Project official quick start documenta=
tion, go to <https://docs.yoctoproject.org/brief-yoctoprojectqs/index.htm=
l>
+
+If that looks like too much reading, then here is how to do it even fast=
er!
+# **Step 0: Install build deps and kas**
+```
+$ sudo apt install gawk wget git diffstat unzip texinfo gcc build-essent=
ial chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debia=
nutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev=
 python3-subunit mesa-common-dev zstd liblz4-tool file locales libacl1
+
+$ pip install kas
+```
+OR, if you prefer to use a docker will all that stuff already installed:
+
+```
+$ sudo docker run -it --name kas-test --volume /mnt/yocto/:/builds/persi=
st ghcr.io/siemens/kas/kas /bin/bash
+```
+
+> **_NOTE:_**
+> the =E2=80=9C--volume=E2=80=9D is the directory where your persistent =
stuff (like downloads and build artifacts) will go to help speed up your =
builds and can be sharable amongst your builds/containers.=C2=A0 If you w=
ant to go completely clean-room, feel free to remove it
+# **Step 1: clone meta-arm and build meta-arm**
+```
+$ git clone https://git.yoctoproject.org/meta-arm
+$ cd meta-arm/
+$ SSTATE_DIR=3D/builds/persist/sstate DL_DIR=3D/builds/persist/downloads=
 kas build ci/fvp-base.yml:ci/testimage.yml
+```
+> **_NOTE:_**
+> =E2=80=9Cci/testimage.yml=E2=80=9D will cause the build to run some ba=
sic system tests.=C2=A0 If you don=E2=80=99t care about verifying basic f=
unctionality, then remove it and it should be faster (a few less programs=
 will be added to the system image and the 2-3mins that it takes to run t=
he test will not happen).
+
+> **_NOTE:_**
+> You may wish to add the Yocto Project SSTATE Mirror (especially the fi=
rst time) to speed up the build by downloading the build fragments (built=
 by the Yocto Project autobuilder) from the internet.  This can be done b=
y adding "ci/sstate-mirror.yml" in kas or adding the relevant lines to yo=
ur local.conf.  Using the above example:
+
+```
+$ SSTATE_DIR=3D/builds/persist/sstate DL_DIR=3D/builds/persist/downloads=
 kas build ci/fvp-base.yml:ci/sstate-mirror.yml
+```
+
+> **_NOTE:_**
+> This only fetches the parts necessary for your build and may take seve=
ral minutes depending on your internet connection speed.  Also, it only f=
etches what is available.  There may still be a need to build things depe=
nding on your configuration.
+
+For more information on kas and various commands, please reference <http=
s://kas.readthedocs.io/en/latest/>.
+
+Depending on what software you are building, fvp-base might not be the m=
achine you want to build for.
+The following website provides an EXTREMELY rough way to tell what softw=
are is in what machines, and what versions are being run:
+<https://gitlab.com/jonmason00/meta-arm/-/jobs/artifacts/master/file/upd=
ate-report/index.html?job=3Dpending-updates>
+
+If, as an example, we=E2=80=99re wanting to develop trusted-firmware-a; =
then fvp-base will work for us.=C2=A0
+
+### **Okay, you are done!=C2=A0 VICTORY!**
+### **Oh, you actually wanted to mess around with the system software so=
urce code?**
+# **Step 2: use devtool to get your source**
+Setup your environment via the (non-kas) Yocto Project tools
+
+```
+$ source poky/oe-init-build-env
+```
+
+Use devtool to checkout the version of software being used on the machin=
e above (in the above example, this will be trusted-firmware-a for fvp-ba=
se).
+
+```
+$ devtool modify trusted-firmware-a
+```
+
+This will download the source, hopefully in git (depending on how the Yo=
cto Project recipe was written), and should print a path at the end where=
 the source code was checked out.=C2=A0 In the trusted-firmware-a example=
, I got:
+
+> /builder/meta-arm/build/workspace/sources/trusted-firmware-a
+
+Inside of that directory, you should see the relevant source code.=C2=A0=
 In this example, it is a standard git tree.=C2=A0 So, you can add remote=
s, checkout different SHAs, etc
+
+Ok, so you are set with your changes and want to build them.
+
+```
+$ devtool build trusted-firmware-a
+```
+
+This should build the software in question, but it is not yet integrated=
 into a system image.=C2=A0 To do that, run:
+
+```
+$ devtool build-image core-image-sato
+```
+
+The image should match the image being used on your machine above.=C2=A0=
 Most of them in meta-arm are set to core-image-sato.=C2=A0=C2=A0
+
+Also, if you used testimage above, it will run testimage now
+### **Okay, you are done!=C2=A0 VICTORY!**
+# **Step 3.=C2=A0 Testing your patches outside of devtool**
+At this point I will assume you have a patch and want to add it to the b=
ase recipe.=C2=A0 Using the above example, in the devtool directory:
+```
+$ git format-patch -1
+0001-example.patch
+$ mv 0001-example.patch ~/meta-arm/meta-arm/recipes-bsp/trusted-firmware=
-a/files/
+$ cd ~/meta-arm
+$ devtool reset trusted-firmware-a
+$ echo =E2=80=98SRC_URI:append =3D " file://0001-example.patch" >> meta-=
arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.3.bb
+```
+
+> **_NOTE:_**
+> there is a space before the =E2=80=9Cfile=E2=80=9D and yes it matters =
very much
+
+At this point, you can go back using kas and verify that the patch works=
 in a clean-ish tree.
+
+```
+$ SSTATE_DIR=3D/builds/persist/sstate DL_DIR=3D/builds/persist/downloads=
 kas build ci/fvp-base.yml:ci/testimage.yml
+```
+
+There is obviously much more that can be done and other ways to do simil=
ar things.
+
+## **If there are issues or questions then please ask them on the #meta-=
arm irc channel on libera.chat**
diff --git a/documentation/releases.md b/documentation/releases.md
new file mode 100644
index 000000000000..d900c9b2f9d8
--- /dev/null
+++ b/documentation/releases.md
@@ -0,0 +1,43 @@
+# **meta-arm Releases and Branching**
+## **Release and Branching background**
+The Yocto Project releases twice a year (April and October): "stable" re=
leases are made every six months and have a lifetime of seven months to a=
llow for migration, while "long term support" (LTS) releases are picked e=
very two years starting from Dunfell in April 2020. The standard practice=
 for all Yocto Compatible layers is to create a "named" branch consistent=
 with the code name of that release. For example, the =E2=80=9Cdunfell=E2=
=80=9D release of the Yocto Project will have a branch named =E2=80=9Cdun=
fell=E2=80=9D in the official git repository, and layers compatible with =
dunfell will have a branch named =E2=80=9Cdunfell=E2=80=9D. Thus, a custo=
mer can easily organize a collection of appropriate layers to make a prod=
uct.
+
+In the Yocto Project, these named branches are =E2=80=9Cstable=E2=80=9D,=
 and only take bug fixes or security-critical upgrades. Active developmen=
t occurs on the master branch. However, this methodology can be problemat=
ic if mimicked with the compatible layers. Companies, like Arm, may not w=
ish to release a snapshot of the relevant =E2=80=9Cmaster=E2=80=9D branch=
es under active development, due to the amount of testing, fixing, and ha=
rdening necessary to make a product from a non-stable release. Also, chan=
ges to keep the master branch of a layer working with the upstream master=
 branch of the Yocto Project may result in that branch no longer being co=
mpatible with named branches (e.g., it might not be possible to mix and m=
atch master and dunfell). So, a decision must be made on the branching po=
licy of meta-arm.
+
+## **Adding new Hardware or Software features**
+There are many different ways to resolve this issue. After some discussi=
on, the best solution for us is to allow new hardware enablement (and rel=
evant software features) to be included in LTS named branches (not just b=
ug fixes). This will allow for a more stable software platform for softwa=
re to be developed, tested, and released. Also, the single branch allows =
for focused testing (limiting the amount of resources needed for CI/CD), =
lessens/eliminates code diverging on various branches, and lessens confus=
ion on which branch to use. The risk of making this choice is a potential=
ly non-stable branch which will require more frequent testing to lessen t=
he risk, and not following the =E2=80=9Cstable=E2=80=9D methodology of th=
e core Yocto Project layers (though it is not uncommon for BSP layers to =
behave this way).
+
+## **Process**
+The process for patches intended on being integrated into only the maste=
r branch is the normal internal process of pushing for code review and CI=
, approval and integration into upstream meta-arm master branch.=20
+For patches intended on being included in an LTS named branch, the prefe=
rred process is to upstream via the master branch, rebase the patch (or s=
eries against the intended LTS branch) and send email with the release na=
me in the subject line after the "PATCH" (e.g., "[PATCH dunfell] Add foo =
to bar").
+
+If there is a time crunch and the preferred way above cannot be complete=
d in time, upstreaming via the LTS branch can occur. This follows the nor=
mal process above but without the master integration step.  However, any =
patches upstreamed in this manner must be pushed to master in a timely fa=
shion (after the time crunch). Nagging emails will be sent and managers w=
ill be involved as the time grows.
+
+## **Testing**
+See [continuous-integration-and-kas.md](/documentation/continuous-integr=
ation-and-kas.md) for information how the layer is tested and what tests =
are run. It is presumed that all code will be compiled as part of the CI =
process of the gerrit code review. Also, testing on virtual platforms and=
 code conformity checks will be run when enabled in the process.
+
+## **Branching strategy and releases**
+Named branches for meta-arm will be released as close as possible to the=
 release of the YP LTS release. Meta-arm named branches will be created f=
rom the meta-arm master branch.
+
+To minimize the additional work of maintaining multiple branches it is a=
ssumed that there will only be two active development branches at any giv=
en time: master and the most recent Long Term Stable (LTS) as the named b=
ranch. All previous named LTS branches will be EOLed when a new LTS has b=
een released. Any branches that are EOLed will still exist in the meta-ar=
m, but bug fix patches will be accepted. Limited to no testing will occur=
 on EOL=E2=80=99ed branches. Exceptions to this can be made, but must be =
sized appropriately and agreed to by the relevant parties.
+
+Named branch release will coincide with Yocto Project releases. These no=
n-LTS branches will be bug fix only and will be EOLed on the next release=
 (similar to the YP branching behavior).
+
+### **Branch transitions**
+When YP is approaching release, meta-arm will attempt to stabilize maste=
r so that the releases can coincide.=20
+* T-6 weeks - Email is sent to meta-arm mailing list notifying of upcomi=
ng code freeze of features to meta-arm
+* T-4 weeks - Code freeze to meta-arm. Only bug fixes are taken at this =
point.
+* T-0 - Official upstream release occurs. With no outstanding critical b=
ugs, a new named branch is created based on the current meta-arm master b=
ranch. Previous named branches are now frozen and will not accept new pat=
ches (but will continue to be present for reference and legacy usage).
+
+## **Tagging**
+### **Branch Tagging**
+When each branch is released, a git tag with the Yocto Project version n=
umber will be added.  For example, `4.3`.  Also, this tag version number =
will be prepended with "yocto" in a duplicate tag (e.g., "yocto-4.3").
+
+Conciding with the Yocto Project release schedule, every branch which ha=
s one or more changes added to it in the previous 6 months will get a min=
or versioned tag (e.g., "4.3.1" and "yocto-4.3.1").
+
+### **BSP Release Tagging**
+BSP releases for those boards supported in meta-arm-bsp maybe have an ad=
ditional tag to denote their software releases.  The tag will consist of =
the board name (in all capital letters), year, and month.  For example, "=
CORSTONE1000-2023.11".
+The release schedule for this is outside the standard Yocto Project rele=
ase candence, but is generally encouraged to be as close to these release=
s as possible.  Similarily, it is recommended the BSP releases be based o=
n the latest LTS branch.
+
+# **Relevant Links**
+<https://wiki.yoctoproject.org/wiki/Releases>
--=20
2.39.3 (Apple Git-146)


