Received: from foss.arm.com (foss.arm.com [])
 by mx.groups.io with SMTP id smtpd.web12.8955.1622042188821861957
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 26 May 2021 08:16:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 _spf-b.arm.com}: parse error for token &{10 18 spf.protection.outlook.com}: parse error for token &{10 18 spfd.protection.outlook.com}: limit exceeded (domain: arm.com, ip: <nil>, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8979168F
	for <meta-arm@lists.yoctoproject.org>; Wed, 26 May 2021 08:16:28 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 817F23F73D
	for <meta-arm@lists.yoctoproject.org>; Wed, 26 May 2021 08:16:28 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/6] arm/fvpboot: add class to write FVP boot configuration
Date: Wed, 26 May 2021 16:16:16 +0100
Message-Id: <20210526151618.170014-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526151618.170014-1-ross.burton@arm.com>
References: <20210526151618.170014-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The fvpboot class is used to write a machine-readable file that describes
how to boot a given machine image inside a FVP, similar to how qemuboot
writes files for runqemu.

BSPs should set the FVP_* variables as appropriate in their machine
configuration, but let the user opt-in to adding fvpboot to IMAGE_CLASSES=
.

Change-Id: I2d1cd86ec4affc1d688a293987890d6a89124d94
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/classes/fvpboot.bbclass | 77 ++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 meta-arm/classes/fvpboot.bbclass

diff --git a/meta-arm/classes/fvpboot.bbclass b/meta-arm/classes/fvpboot.=
bbclass
new file mode 100644
index 0000000..823ef24
--- /dev/null
+++ b/meta-arm/classes/fvpboot.bbclass
@@ -0,0 +1,77 @@
+# Image class to write .fvpconf files for use with runfvp. If this is de=
sired
+# then add fvpboot to IMAGE_CLASSES, and set the variables below in your=
 machine
+# configuration as appropriate.
+
+# Name of recipe providing FVP executable. If unset then the executable =
must be installed on the host.
+FVP_PROVIDER ?=3D ""
+# Name of FVP executable to run
+FVP_EXE ?=3D ""
+# Flags for --parameter/-C
+FVP_CONFIG ?=3D ""
+# Flags for --data
+FVP_DATA ?=3D ""
+# Flags for --application
+FVP_APPLICATIONS ?=3D ""
+# Flags to name serial terminals. Flag name is the terminal id (such as
+# terminal_0), value is a human-readable name. If the name is not set
+# then runfvp will hide the terminal.
+FVP_TERMINALS ?=3D ""
+# Arbitrary extra arguments
+FVP_EXTRA_ARGS ?=3D ""
+
+EXTRA_IMAGEDEPENDS +=3D "${FVP_PROVIDER}"
+
+inherit image-artifact-names
+
+addtask do_write_fvpboot_conf after do_rootfs before do_image
+python do_write_fvpboot_conf() {
+    # Note that currently this JSON file is in development and the forma=
t may
+    # change at any point, so it should always be used with a matching r=
unfvp.
+
+    import json, shlex
+
+    if not d.getVar("FVP_EXE"):
+        return
+
+    conffile =3D os.path.join(d.getVar("IMGDEPLOYDIR"), d.getVar("IMAGE_=
NAME") + ".fvpconf")
+    conffile_link =3D os.path.join(d.getVar("IMGDEPLOYDIR"), d.getVar("I=
MAGE_LINK_NAME") + ".fvpconf")
+
+    data =3D {}
+    provider =3D d.getVar("FVP_PROVIDER")
+    if provider:
+        data["provider"] =3D provider
+        data["fvp-bindir"] =3D os.path.join(d.getVar("COMPONENTS_DIR"),
+                                            d.getVar("BUILD_ARCH"),
+                                            provider,
+                                            "usr", "bin")
+
+    def getFlags(varname):
+        flags =3D d.getVarFlags(varname)
+        # For unexplained reasons, getVarFlags() returns None if there a=
re no flags
+        if flags is None:
+            return {}
+        # For other reasons, you can't pass expand=3DTrue
+        return {key: d.expand(value) for key, value in flags.items()}
+
+    data["exe"] =3D d.getVar("FVP_EXE")
+    data["parameters"] =3D getFlags("FVP_CONFIG")
+    data["data"] =3D shlex.split(d.getVar("FVP_DATA") or "")
+    data["applications"] =3D getFlags("FVP_APPLICATIONS")
+    data["terminals"] =3D getFlags("FVP_TERMINALS")
+    data["args"] =3D shlex.split(d.getVar("FVP_EXTRA_ARGS") or "")
+
+    os.makedirs(os.path.dirname(conffile), exist_ok=3DTrue)
+    with open(conffile, "wt") as f:
+        json.dump(data, f)
+
+    if conffile_link !=3D conffile:
+        if os.path.lexists(conffile_link):
+           os.remove(conffile_link)
+        os.symlink(os.path.basename(conffile), conffile_link)
+}
+
+def fvpboot_vars(d):
+    build_vars =3D ['DEPLOY_DIR_IMAGE', 'IMAGE_NAME', 'IMAGE_LINK_NAME',
+                  'COMPONENTS_DIR', 'BUILD_ARCH']
+    return build_vars + [k for k in d.keys() if k.startswith('FVP_')]
+do_write_fvpboot_conf[vardeps] +=3D "${@' '.join(fvpboot_vars(d))}"
--=20
2.25.1

