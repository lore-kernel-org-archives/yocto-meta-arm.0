Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC2AFC43219
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 17:13:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.7999.1640020421713115514
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Dec 2021 09:13:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 068B5D6E
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Dec 2021 09:13:43 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A4B4D3F774
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Dec 2021 09:13:42 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 7/7] runfvp: add basic documentation
Date: Mon, 20 Dec 2021 17:13:37 +0000
Message-Id: <20211220171337.877288-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220171337.877288-1-ross.burton@arm.com>
References: <20211220171337.877288-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 20 Dec 2021 17:13:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2748

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 documentation/runfvp.md | 120 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)
 create mode 100644 documentation/runfvp.md

diff --git a/documentation/runfvp.md b/documentation/runfvp.md
new file mode 100644
index 00000000..b9e007b1
--- /dev/null
+++ b/documentation/runfvp.md
@@ -0,0 +1,120 @@
+# Running Images with a FVP
+
+The `runfvp` tool in meta-arm makes it easy to run Yocto Project disk im=
ages inside a [Fixed Virtual Platform (FVP)][FVP].  Some FVPs, such as th=
e [Arm Architecture Models][AEM], are available free to download, but oth=
ers need registration or are only available commercially.  The `fvp-base`=
 machine in meta-arm-bsp uses one of these AEM models.
+
+## Running images with `runfvp`
+
+To build images with the FVP integration, the `fvpboot` class needs to b=
e inherited.  If the machine does not do this explicitly it can be done i=
n `local.conf`:
+
+```
+INHERIT +=3D "fvpboot"
+```
+
+The class will download the correct FVP and write a `.fvpconf` configura=
tion file when an image is built.
+
+To run an image in a FVP, pass either a machine name or a `.fvpconf` pat=
h to `runfvp`.
+
+```
+$ ./meta-arm/scripts/runfvp tmp/deploy/images/fvp-base/core-image-minima=
l-fvp-base.fvpconf
+```
+
+When a machine name is passed, `runfvp` will start the latest image that=
 has been built for that machine. This requires that the BitBake environm=
ent has been initialized (using `oe-init-build-env` or similar) as it wil=
l start BitBake to determine where the images are.
+
+```
+$ ./meta-arm/scripts/runfvp fvp-base
+```
+
+Note that currently meta-arm's `scripts` directory isn't in `PATH`, so a=
 full path needs to be used.
+
+`runfvp` will automatically start terminals connected to each of the ser=
ial ports that the machine specifies.  This can be controlled by using th=
e `--terminals` option, for example `--terminals=3Dnone` will mean no ter=
minals are started, and `--terminals=3Dtmux` will start the terminals in =
[`tmux`][tmux] sessions.  Alternatively, passing `--console` will connect=
 the serial port directly to the current session, without needing to open=
 further windows.
+
+The default terminal can also be configured by writing a [INI-style][INI=
] configuration file to `~/.config/runfvp.conf`:
+
+```
+[RunFVP]
+Terminal=3Dtmux
+```
+
+Arbitrary options can be passed directly to the FVP by specifying them a=
fter a double dash, for example this will list all of the FVP parameters:
+
+```
+$ runfvp fvp-base -- --list-params
+```
+
+## Configuring machines with `fvpboot`
+
+To configure a machine so that it can be ran inside `runfvp`, a number o=
f variables need to be set in the machine configuration file (such as `me=
ta-arm-bsp/conf/machine/fvp-base.conf`).
+
+Note that at present these variables are not stable and their behaviour =
may be changed in the future.
+
+### `FVP_EXE`
+
+The name of the FVP binary itself, for example `fvp-base` uses `FVP_Base=
_RevC-2xAEMvA`.
+
+### `FVP_PROVIDER`
+
+The name of the recipe that provides the FVP executable set in `FVP_EXE`=
, for example `fvp-base` uses `fvp-base-a-aem-native`.  This *must* be a =
`-native` recipe as the binary will be executed on the build host.
+
+There are recipes for common FVPs in meta-arm already, and writing new r=
ecipes is trivial.  For FVPs which are free to download `fvp-base-a-aem.b=
b` is a good example. Some FVPs must be downloaded separately as they nee=
d an account on Arm's website, `fvp-base-r-aem.bb` is a good example of t=
hose.
+
+If `FVP_PROVIDER` is not set then it is assumed that `FVP_EXE` is instal=
led on the host already.
+
+### `FVP_CONFIG`
+
+Parameters passed to the FVP with the `--parameter`/`-C` option.  These =
are expressed as variable flags so individual parameters can be altered e=
asily. For example:
+
+```
+FVP_CONFIG[bp.flashloader0.fname] =3D "${DEPLOY_DIR_IMAGE}/fip-fvp.bin"
+```
+
+### `FVP_DATA`
+
+Specify raw data to load at the specified address, passed to the FVP wit=
h the `--data` option.  This is a space-separated list of parameters in t=
he format `[INST=3D]FILE@[MEMSPACE:]ADDRESS`. For example:
+
+```
+FVP_DATA =3D "cluster0.cpu0=3D${DEPLOY_DIR_IMAGE}/Image@0x80080000 \
+            cluster0.cpu0=3D${DEPLOY_DIR_IMAGE}/fvp-base-revc.dtb@0x8300=
0000"
+```
+
+### `FVP_APPLICATIONS`
+
+Applications to load on the cores, passed to the FVP with the `--applica=
tion` option.  These are expressed as variable flags with the flag name b=
eing the instance and flag value the filename, for example:
+
+```
+FVP_APPLICATIONS[cluster0] =3D "${DEPLOY_DIR_IMAGE}/linux-system.axf"
+```
+
+Note that symbols are not allowed in flag names, so if you need to use a=
 wildcard in the instance then you'll need to use `FVP_EXTRA_ARGS` and `-=
-application` directly.
+
+### `FVP_TERMINALS`
+
+Map hardware serial ports to abstract names. For example the `FVP_Base_R=
evC-2xAEMvA` FVP exposes four serial ports, `terminal_0` to `terminal_3`.=
  Typically only `terminal_0` is used in the `fvp-base` machine so this c=
an be named `"Console"` and the others `""`.  When runfvp starts terminal=
s it will only start named serial ports, so instead of opening four windo=
ws where only one is useful, it will only open one.
+
+For example:
+```
+FVP_TERMINALS[bp.terminal_0] =3D "Console"
+FVP_TERMINALS[bp.terminal_1] =3D ""
+FVP_TERMINALS[bp.terminal_2] =3D ""
+FVP_TERMINALS[bp.terminal_3] =3D ""
+```
+
+### `FVP_CONSOLE`
+
+This specifies what serial port is used when `--console` is passed to ru=
nfvp. Note that this has to be the FVP identifier but without the board p=
refix, for example:
+```
+FVP_CONSOLE =3D "terminal_0"
+```
+
+### `FVP_EXTRA_ARGS`
+
+Arbitrary extra arguments that are passed directly to the FVP.  For exam=
ple:
+
+```
+FVP_EXTRA_ARGS =3D "--simlimit 60"
+```
+
+
+[AEM]: https://developer.arm.com/tools-and-software/simulation-models/fi=
xed-virtual-platforms/arm-ecosystem-models
+[FVP]: https://developer.arm.com/tools-and-software/simulation-models/fi=
xed-virtual-platforms
+[tmux]: https://tmux.github.io/
+[INI]: https://docs.python.org/3/library/configparser.html
--=20
2.25.1


