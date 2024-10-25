Return-Path: <romain.naour@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B5DD149D1
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 16:50:12 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.323.1729875011430963484
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 25 Oct 2024 09:50:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PMvWcEbT;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: romain.naour@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43155afca99so22808525e9.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 25 Oct 2024 09:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1729875010; x=1730479810; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dT9nRYQIfKXpkCK85mdYO8r728bxi7Gx5WzI7MpiCzU=;
        b=PMvWcEbTEXPWHevTryg8/gq3s1UyoeAxZuN+X2NezVkqbTOHQ+sreLD2tQhR9t15ZX
         f672EN00YHq+myaWgBYCNFCaH/uifzU0jOjAkKDWEe1+iSFkaXwkBm/kUcvw7G5MoAa7
         BIQooMBSqdCIILqHqKIRqp1erL4XsdNOpu3ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729875010; x=1730479810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dT9nRYQIfKXpkCK85mdYO8r728bxi7Gx5WzI7MpiCzU=;
        b=omhuip6U/y6SHW7Cxo45gL2ophUmoNwHeD9OVVGKfl5k8hRkuktmzKOgbjGUSlbtRw
         hDxjdAkPLIHM24DFDCzgdT9XkNHuHqLu4oil/ygrAuGbbOahtEAYtmQUezWGn3usjIvB
         XDRQo0Tzill8YPUxpKFih5H2REsQcm4h6HfNqTQB8aJKam6xB35JOB5KHjMQ1pMjgfab
         CryTUQ0ymO3sh2HtwSqkbkj63tkrRxLC0XqIUEJHZCeoryPrFwspcjadWY56Nkf5N0IA
         R1HU+wDPjjQktGjw3AQoFDcJ89SMp/79M8nLkq1wHVMtkwA1l1WYRwYxdSlBC5jbHg/H
         w8Xw==
X-Gm-Message-State: AOJu0YzmG5mRE5sl3PyNvWsdi0A3EWEKyy29JLPW/n3SmWOCF/LkN3+l
	3KXhTuqEGku9fR83vKE8+xvCaqJETS8AXEOXkxXjGihr4eRNF6TL/2vGIXRHH3bhSZyvZ55QPCx
	O
X-Google-Smtp-Source: AGHT+IGw0iwa/C3ahI6izc+4uUH0PLv0kW2NvbLxvMAzFj85/EO2UrSWPoAmud3Pq455UkcugADqLw==
X-Received: by 2002:a5d:4b02:0:b0:37c:fbb7:5082 with SMTP id ffacd0b85a97d-38060f37503mr168364f8f.25.1729875009780;
        Fri, 25 Oct 2024 09:50:09 -0700 (PDT)
Received: from P-NTS-Evian.home (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b70f25sm1991778f8f.67.2024.10.25.09.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 09:50:09 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com,
	Romain Naour <romain.naour@smile.fr>
Subject: [PATCH v2 6/8] external-arm-toolchain: override dynamic loader path with usrmerge enabled
Date: Fri, 25 Oct 2024 18:50:00 +0200
Message-ID: <20241025165002.2794821-6-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20241025165002.2794821-1-romain.naour@smile.fr>
References: <20241025165002.2794821-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 25 Oct 2024 16:50:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6232

usrmerge nowaday required by systemd [1] but it broke
external-arm-toolchain in several ways...

When usrmerge is enabled, /lib is no longer part of SYSROOT_DIRS list
while the prebuilt toolchain expect the dynamic loader to be placed in
/lib not /usr/lib.

There is no /lib directory in the per-package sysroot directory
generated to build each package:

  [...]/build/tmp/sysroots-components/<target>/<package>/
  sysroot-providers/ usr/

But the cross-compiler still generate binaries with dynamic loarder
path set to "/lib/ld-linux-<target>.so*"

  strings sanitycheckc_cross.exe | grep ld
  /lib/ld-linux-aarch64.so.1

A symlink /lib -> /usr/lib is crated in the final rootfs image.

But this broke the meson-qemuwrapper used when "qemu-usermode"
(MACHINE_FEATURES) is available:

See [2]:
  do_write_config:append:class-target() {
       # Write out a qemu wrapper that will be used as exe_wrapper so that meson
       # can run target helper binaries through that.
       qemu_binary="${@qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"

It produce a runtime issue while running a meson sanity check:

  meson-qemuwrapper [...]/build/meson-private/sanitycheckc_cross.exe

  qemu-aarch64: Could not open '/lib/ld-linux-aarch64.so.1': No such file or directory

Note: The binaries build by the Yocto internal toolchain seems be "patched" [3]
to look at /usr/lib instead of /lib.

We use -Wl,--dynamic-linker to make sure that the cross-compiler
generate binaries using the dynamic loader path defined by usrmerge
for all packages build by Yocto.

[1] https://git.openembedded.org/openembedded-core/commit/?id=802e853eeddf16d73db1900546cc5f045d1fb7ed
[2] https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/meson.bbclass?h=2024-04.3-scarthgap#n130
[3] https://github.com/openembedded/openembedded-core/blob/scarthgap/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../conf/distro/include/tcmode-external-arm.inc              | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
index 898663ea..99fe56b8 100644
--- a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
+++ b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
@@ -15,6 +15,11 @@ EAT_TARGET_SYS:aarch64 ?= "${@ 'aarch64-none-linux-gnu' if os.path.exists('${EXT
 EAT_TARGET_SYS = "${TARGET_SYS}"
 TARGET_PREFIX = "${EAT_TARGET_SYS}-"
 
+EXTERNAL_TOOLCHAIN_LIBDIR = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '/usr/lib', '/lib', d)}"
+EXTERNAL_TOOLCHAIN_DYN_LINKER_PATH:arm ?= " -Wl,--dynamic-linker=${EXTERNAL_TOOLCHAIN_LIBDIR}/ld-linux-armhf.so.3"
+EXTERNAL_TOOLCHAIN_DYN_LINKER_PATH:aarch64 ?= " -Wl,--dynamic-linker=${EXTERNAL_TOOLCHAIN_LIBDIR}/ld-linux-aarch64.so.1"
+TARGET_LDFLAGS:append:class-target = "${EXTERNAL_TOOLCHAIN_DYN_LINKER_PATH}"
+
 EAT_LIBDIR:arm = "lib"
 EAT_LIBDIR:aarch64 = "lib64"
 
-- 
2.45.0


