Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1842CA5FA5
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 15:30:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61341.1790609431408365686
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 28 Sep 2026 08:30:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Vh4A4zSJ;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D63C1758;
	Mon, 28 Sep 2026 08:30:27 -0700 (PDT)
Received: from e142474.cambridge.arm.com (e142474.arm.com [10.2.203.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F4EB3F763;
	Mon, 28 Sep 2026 08:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790609430; bh=sQCCekJK+X40B06bjzQrFaH52aB8Ivt1QBB7OYYIWy8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vh4A4zSJ4qq/zCA0T8QHTJEtr5kt/xUnGMipJdqzAljic2KtdNhgYPS+EtpYAT0by
	 yUDHm5fuHVKQKQ1DHfdSB63zLAhBnTzLCgXLEJqx63wdbpXovNkGFLocUkfNWuFnRh
	 Ni2KrxzNstNlFcYwGoFbVFbHU3v5OQvCJn0EXglo=
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 1/1] arm/trusted-firmware-a: fix cot-dt2c parser failure
Date: Mon, 28 Sep 2026 16:30:22 +0100
Message-ID: <20260928153022.1966815-2-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928153022.1966815-1-harsimransingh.tungal@arm.com>
References: <20260928153022.1966815-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 28 Sep 2026 15:30:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7177

Provide a TF-A fix to normalise CoT DTS cell expressions before cot-dt2c
parses the generated descriptor.

This avoids build failures where cot-dt2c reports "not a valid CoT DT fil=
e"
when parsing arithmetic expressions in generated CoT descriptors.

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 .../trusted-firmware-a/cot-dt2c_0.1.0.bb      |  4 +-
 ...ormalise-arithmetic-cell-expressions.patch | 77 +++++++++++++++++++
 2 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/0001-co=
t-dt2c-normalise-arithmetic-cell-expressions.patch

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/cot-dt2c_0.1.0.bb b/=
meta-arm/recipes-bsp/trusted-firmware-a/cot-dt2c_0.1.0.bb
index a4e72b00..7d9dec48 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/cot-dt2c_0.1.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/cot-dt2c_0.1.0.bb
@@ -3,7 +3,9 @@ DESCRIPTION =3D "CoT-dt2c Tool is a python script to conv=
ert CoT DT file into corr
 LICENSE =3D "BSD-3-Clause"
=20
 SRC_URI_TRUSTED_FIRMWARE_A ?=3D "git://review.trustedfirmware.org/TF-A/t=
rusted-firmware-a;protocol=3Dhttps"
-SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A};branch=3D${SRCBRANCH}"
+SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A};branch=3D${SRCBRANCH} \
+           file://0001-cot-dt2c-normalise-arithmetic-cell-expressions.pa=
tch \
+           "
 LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D6ed7bace7b0bc63021c6=
eba7b524039e"
=20
 # Use cot-dt2c from TF-A v2.15.0
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-cot-dt2c-=
normalise-arithmetic-cell-expressions.patch b/meta-arm/recipes-bsp/truste=
d-firmware-a/files/0001-cot-dt2c-normalise-arithmetic-cell-expressions.pa=
tch
new file mode 100644
index 00000000..b6fc1d9f
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-cot-dt2c-normali=
se-arithmetic-cell-expressions.patch
@@ -0,0 +1,77 @@
+From 64fe79ae2d8200ac48658837e5440f2469728dac Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimran.singh.tungal@arm.com>
+Date: Thu, 24 Sep 2026 12:00:00 +0100
+Subject: [PATCH] fix(cot-dt2c): normalise arithmetic cell expressions
+
+TF-A's generated CoT descriptor can contain preprocessed C macro
+expressions in devicetree cells, such as:
+
+    image-id =3D <((39) + 2)>;
+
+Recent pydevicetree evaluates the inner parenthesised tokens before the
+outer expression and raises a TypeError while parsing these values. This
+makes cot-dt2c report "not a valid CoT DT file" even though the
+descriptor is valid after evaluating the numeric expression.
+
+Keep the normal parser path unchanged, but retry with numeric cell
+expressions reduced to integer values when parsing fails.
+
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-A/tr=
usted-firmware-a/+/54905]
+Change-Id: I432025f82b48d026a21ae136b12cd681e49f8a00
+Signed-off-by: Harsimran Singh Tungal <harsimran.singh.tungal@arm.com>
+---
+ tools/cot_dt2c/cot_dt2c/cot_parser.py | 33 +++++++++++++++++++++++++--
+ 1 file changed, 31 insertions(+), 2 deletions(-)
+
+diff --git a/tools/cot_dt2c/cot_dt2c/cot_parser.py b/tools/cot_dt2c/cot_=
dt2c/cot_parser.py
+index 39e51db3c..2aaebd0eb 100644
+--- a/tools/cot_dt2c/cot_dt2c/cot_parser.py
++++ b/tools/cot_dt2c/cot_dt2c/cot_parser.py
+@@ -1,5 +1,5 @@
+ #
+-# Copyright (c) 2024, Arm Limited and Contributors. All rights reserved=
.
++# Copyright (c) 2024, 2026 Arm Limited and Contributors. All rights res=
erved.
+ #
+ # SPDX-License-Identifier: BSD-3-Clause
+ #
+@@ -11,10 +11,39 @@ from pydevicetree import Devicetree, Property, Node
+ from pathlib import Path
+ from typing import List, Optional
+=20
++def _normalise_cell_expression(match):
++    value =3D match.group(1).strip()
++    if not re.fullmatch(r"[0-9a-fA-FxX\s()+\-*/%<>&|^~]+", value):
++        return match.group(0)
++
++    try:
++        evaluated =3D eval(value, {"__builtins__": {}}, {})
++    except Exception:
++        return match.group(0)
++
++    if not isinstance(evaluated, int):
++        return match.group(0)
++
++    return f"<{evaluated}>"
++
++def _normalise_cell_expressions(contents):
++    return re.sub(r"<([^<>]+)>", _normalise_cell_expression, contents)
++
++def _parse_cot_file(inputfile):
++    try:
++        return Devicetree.parseFile(inputfile)
++    except Exception:
++        contents =3D Path(inputfile).read_text()
++        normalised =3D _normalise_cell_expressions(contents)
++        if normalised =3D=3D contents:
++            raise
++
++        return Devicetree.from_dts(normalised)
++
+ class COT:
+     def __init__(self, inputfile: str, outputfile=3DNone):
+         try:
+-            self.tree =3D Devicetree.parseFile(inputfile)
++            self.tree =3D _parse_cot_file(inputfile)
+         except:
+             print("not a valid CoT DT file")
+             exit(1)

